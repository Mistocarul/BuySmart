using Domain.Common;
using Domain.Entities;
using Domain.Repositories;
using Infrastructure.Persistence;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using SendGrid;
using SendGrid.Helpers.Mail;
using System.IdentityModel.Tokens.Jwt;
using System.Net;
using System.Security.Claims;
using System.Text;

namespace Identity.Repositories
{
    public class UserAuthRepository : IUserAuthRepository<User>
    {
        private readonly UsersDbContext usersDbContext;
        private readonly IConfiguration configuration;
        private readonly ApplicationDbContext context;

        public UserAuthRepository(UsersDbContext usersDbContext, IConfiguration configuration, ApplicationDbContext context)
        {
            this.usersDbContext = usersDbContext;
            this.configuration = configuration;
            this.context = context;
        }

        public async Task<Result<string>> Login(User user)
        {
            try
            {
                var existingUser = await usersDbContext.Users.SingleOrDefaultAsync(u => u.Email == user.Email);
                if (existingUser == null)
                {
                    return Result<string>.Failure("Invalid credentials");
                }

                var tokenHandler = new JwtSecurityTokenHandler();
                var key = Encoding.ASCII.GetBytes(configuration["Jwt:Key"]!);
                var tokenDescriptor = new SecurityTokenDescriptor
                {
                    Subject = new ClaimsIdentity(new List<Claim> { new Claim(ClaimTypes.Name, user.UserId.ToString(), user.UserType.ToString()) }),
                    Expires = DateTime.UtcNow.AddDays(7),
                    SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(key), SecurityAlgorithms.HmacSha256Signature)
                };

                var token = tokenHandler.CreateToken(tokenDescriptor);
                return Result<string>.Success(tokenHandler.WriteToken(token));
            }
            catch (Exception ex)
            {
                return Result<string>.Failure(ex.Message);
            }
        }

        public async Task<Result<string>> SendVerificationCode(User user, CancellationToken cancellationToken)
        {
            try
            {
                var verificationCode = new Random().Next(100000, 999999);
                var imageFromString = Convert.FromBase64String(user.Image);
                var existingUser = await context.Users.SingleOrDefaultAsync(u => u.Email == user.Email);
                if (existingUser != null)
                {
                    return Result<string>.Failure("Email already exists");
                }
                ConfirmationCode confirmationCode = new ConfirmationCode
                {
                    Code = verificationCode,
                    Email = user.Email,
                    Name = user.Name,
                    Password = user.Password,
                    UserType = user.UserType,
                    Image = imageFromString
                };
                var sendGridClient = new SendGridClient(configuration["SendGrid:ApiKey"]);
                var from = new EmailAddress(configuration["SendGrid:FromEmail"], configuration["SendGrid:FromName"]);
                var to = new EmailAddress(user.Email, user.Name);
                var dynamicTemplateData = new Dictionary<string, string>
                {
                    { "username", user.Name },
                    { "code", verificationCode.ToString() }
                };
                var msg = MailHelper.CreateSingleTemplateEmail(from, to, configuration["SendGrid:TemplateId"], dynamicTemplateData);
                var response = await sendGridClient.SendEmailAsync(msg, cancellationToken);
                if (response.StatusCode != HttpStatusCode.OK && response.StatusCode != HttpStatusCode.Accepted)
                {
                    return Result<string>.Failure("Failed to send email");
                }
                else
                {
                    var existingConfirmationCode = await usersDbContext.ConfirmationCodes.SingleOrDefaultAsync(c => c.Email == user.Email);
                    if (existingConfirmationCode != null)
                    {
                        usersDbContext.ConfirmationCodes.Remove(existingConfirmationCode);
                    }
                    usersDbContext.ConfirmationCodes.Add(confirmationCode);
                    await usersDbContext.SaveChangesAsync(cancellationToken);
                    //remove all confirmation codes older than 30 minutes
                    var oldConfirmationCodes = await usersDbContext.ConfirmationCodes.Where(c => c.CreationTime.AddMinutes(30) < DateTime.UtcNow).ToListAsync();
                    if (oldConfirmationCodes != null) {
                        usersDbContext.ConfirmationCodes.RemoveRange(oldConfirmationCodes);
                        await usersDbContext.SaveChangesAsync(cancellationToken);
                    }
                    return Result<string>.Success(verificationCode.ToString());
                }
            }
            catch (Exception ex)
            {
                return Result<string>.Failure(ex.Message);
            }
        }

        public async Task<Result<Guid>> Register(int confirmationCode, CancellationToken cancellationToken)
        {
            try
            {
                var confirmationCodeEntity = await usersDbContext.ConfirmationCodes.SingleOrDefaultAsync(c => c.Code == confirmationCode);
                if (confirmationCodeEntity == null || confirmationCodeEntity.CreationTime.AddMinutes(30) < DateTime.UtcNow)
                {
                    usersDbContext.ConfirmationCodes.Remove(confirmationCodeEntity);
                    await usersDbContext.SaveChangesAsync(cancellationToken);
                    return Result<Guid>.Failure("Invalid confirmation code");
                }

                string relativePath = configuration["PathToPhotos:Path"];
                string projectRoot = Directory.GetParent(AppContext.BaseDirectory).Parent.Parent.Parent.FullName;
                string fullPathToPhotos = Path.Combine(projectRoot, relativePath);
                fullPathToPhotos = Path.GetFullPath(fullPathToPhotos);
                string profilePhotoPath;

                if (confirmationCodeEntity.Image != null && confirmationCodeEntity.Image.Length> 0)
                {
                    string fileName = $"{confirmationCodeEntity.Name}.png";
                    profilePhotoPath = Path.Combine(fullPathToPhotos, fileName);
                    await File.WriteAllBytesAsync(profilePhotoPath, confirmationCodeEntity.Image, cancellationToken);
                }
                else
                {
                    string defaultPhotoPath = Path.Combine(fullPathToPhotos, "default.png");
                    profilePhotoPath = Path.Combine(fullPathToPhotos, $"{confirmationCodeEntity.Name}.png");
                    File.Copy(defaultPhotoPath, profilePhotoPath, overwrite: true);
                }
                var user = new User
                {
                    Name = confirmationCodeEntity.Name,
                    Email = confirmationCodeEntity.Email,
                    Password = confirmationCodeEntity.Password,
                    UserType = confirmationCodeEntity.UserType,
                    Image = profilePhotoPath
                };
                Guid userId;

                if (user.UserType == UserType.Client)
                {
                    userId = await AddUserClientAsync(user, cancellationToken);
                }
                else if (user.UserType == UserType.Business)
                {
                    userId = await AddUserBusinessAsync(user, cancellationToken);
                }
                else
                {
                    return Result<Guid>.Failure("Invalid user type.");
                }
                user.UserId = userId;
                usersDbContext.Users.Add(user);
                await usersDbContext.SaveChangesAsync(cancellationToken);
                usersDbContext.ConfirmationCodes.Remove(confirmationCodeEntity);
                await usersDbContext.SaveChangesAsync(cancellationToken);

                return Result<Guid>.Success(userId);
            }
            catch (Exception ex)
            {
                return Result<Guid>.Failure(ex.Message);
            }
        }

        private async Task<Guid> AddUserClientAsync(User user, CancellationToken cancellationToken)
        {
            var userClient = new UserClient
            {
                Name = user.Name,
                Email = user.Email,
                Password = user.Password,
                UserType = UserType.Client,
                Image = user.Image
            };

            await context.UserClients.AddAsync(userClient, cancellationToken);
            await context.SaveChangesAsync(cancellationToken);
            return userClient.UserId;
        }

        private async Task<Guid> AddUserBusinessAsync(User user, CancellationToken cancellationToken)
        {
            var userBusiness = new UserBusiness
            {
                Name = user.Name,
                Email = user.Email,
                Password = user.Password,
                UserType = UserType.Business,
                Image = user.Image
            };

            await context.UserBusinesses.AddAsync(userBusiness, cancellationToken);
            await context.SaveChangesAsync(cancellationToken);
            return userBusiness.UserId;
        }
    }
}
