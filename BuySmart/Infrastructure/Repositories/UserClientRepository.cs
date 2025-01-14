using Domain.Common;
using Domain.Entities;
using Domain.Repositories;
using Infrastructure.Persistence;
using Microsoft.EntityFrameworkCore;

namespace Infrastructure.Repositories
{
    public class UserClientRepository : IUserRepository<UserClient>
    {
        private readonly ApplicationDbContext context;

        public UserClientRepository(ApplicationDbContext context)
        {
            this.context = context;
        }

        public async Task<IEnumerable<UserClient>> GetAllAsync()
        {
            var userClients = await context.UserClients.ToListAsync();
            foreach (var userClient in userClients)
            {
                string profileFilePath = userClient.Image;
                if (File.Exists(profileFilePath))
                {
                    byte[] imageArray = await File.ReadAllBytesAsync(profileFilePath);
                    string base64ImageRepresentation = Convert.ToBase64String(imageArray);
                    userClient.Image = base64ImageRepresentation;
                }
                else
                {
                    throw new FileNotFoundException("Image not found");
                }
            }
            return userClients;
        }

        public async Task<UserClient> GetByIdAsync(Guid userId)
        {
            var userClient = await context.UserClients.FindAsync(userId);
            if (userClient == null)
            {
                throw new KeyNotFoundException("UserClient not found");
            }
            string profileFilePath = userClient.Image;
            if (File.Exists(profileFilePath))
            {
                byte[] imageArray = await File.ReadAllBytesAsync(profileFilePath);
                string base64ImageRepresentation = Convert.ToBase64String(imageArray);
                userClient.Image = base64ImageRepresentation;
            }
            else
            {
                throw new FileNotFoundException("Image not found");
            }    
            return userClient;
        }

        public async Task<Result<Guid>> AddAsync(UserClient userClient)
        {
            try
            {
                await context.UserClients.AddAsync(userClient);
                await context.SaveChangesAsync();
                return Result<Guid>.Success(userClient.UserId);
            }
            catch (Exception ex)
            {
                return Result<Guid>.Failure(ex.Message);
            }
        }

        public async Task<Result<object>> UpdateAsync(UserClient userClient)
        {
            try
            {
                var existingUserClient = await context.UserClients.FindAsync(userClient.UserId);
                if (existingUserClient == null)
                {
                    return Result<object>.Failure("UserClient not found");
                }

                
                existingUserClient.Name = userClient.Name;
                existingUserClient.Email = userClient.Email;
                existingUserClient.Password = userClient.Password;
                existingUserClient.Image = userClient.Image;
                existingUserClient.UserType = userClient.UserType;

                context.UserClients.Update(existingUserClient);
                await context.SaveChangesAsync();
                return Result<object>.Success(new object());
            }
            catch (Exception ex)
            {
                return Result<object>.Failure(ex.Message);
            }
        }
    }
}
