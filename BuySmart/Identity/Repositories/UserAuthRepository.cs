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

        public async Task<string> Login(User user)
        {
            var existingUser = await usersDbContext.Users.SingleOrDefaultAsync(u => u.Email == user.Email);
            if (existingUser == null)
            {
                throw new UnauthorizedAccessException("Invalid credentials");
            }

            var tokenHandler = new JwtSecurityTokenHandler();
            var key = Encoding.ASCII.GetBytes(configuration["Jwt:Key"]!);
            var tokenDescriptor = new SecurityTokenDescriptor
            {
                Subject = new ClaimsIdentity(new[] { new Claim(ClaimTypes.Name, user.UserId.ToString()) }),
                Expires = DateTime.UtcNow.AddDays(7),
                SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(key), SecurityAlgorithms.HmacSha256Signature)
            };

            var token = tokenHandler.CreateToken(tokenDescriptor);
            return tokenHandler.WriteToken(token);
        }

        public async Task<Guid> Register(User user, CancellationToken cancellationToken)
        {
            usersDbContext.Users.Add(user);
            if (user.UserType == UserType.Client)
            {
                var userClient = new UserClient
                {
                    UserId = user.UserId,
                    Email = user.Email,
                    Password = user.Password
                };
                await context.UserClients.AddAsync(userClient);
                await context.SaveChangesAsync(cancellationToken);
            }
            await usersDbContext.SaveChangesAsync(cancellationToken);
            return user.UserId;
        }
    }
}
