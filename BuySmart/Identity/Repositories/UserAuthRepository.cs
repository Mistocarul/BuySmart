using Domain.Common;
using Domain.Entities;
using Domain.Repositories;
using Infrastructure.Persistence;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
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

        public async Task<Result<Guid>> Register(User user, CancellationToken cancellationToken)
        {
            try
            {
                if (user.UserType == UserType.Client)
                {
                    var userClient = new UserClient
                    {
                        Name = user.Name,
                        Email = user.Email,
                        Password = user.Password,
                        UserType = UserType.Client,
                        Image = user.Image
                    };
                    await context.UserClients.AddAsync(userClient);
                    await context.SaveChangesAsync(cancellationToken);
                    Guid userId = userClient.UserId;
                    user.UserId = userId;
                }
                else if (user.UserType == UserType.Business)
                {
                    var userBusiness = new UserBusiness
                    {
                        Name = user.Name,
                        Email = user.Email,
                        Password = user.Password,
                        UserType = UserType.Business,
                        Image = user.Image
                    };
                    await context.UserBusinesses.AddAsync(userBusiness);
                    await context.SaveChangesAsync(cancellationToken);
                    Guid userId = userBusiness.UserId;
                    user.UserId = userId;
                }
                usersDbContext.Users.Add(user);
                await usersDbContext.SaveChangesAsync(cancellationToken);
                return Result<Guid>.Success(user.UserId);
            }
            catch (Exception ex)
            {
                return Result<Guid>.Failure(ex.Message);
            }
        }
    }
}
