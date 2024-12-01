using Domain.Common;
using Domain.Entities;
using Domain.Repositories;
using Infrastructure.Persistence;
using Microsoft.EntityFrameworkCore;

namespace Infrastructure.Repositories
{
    public class UserClientRepository : IUserClientRepository
    {
        private readonly ApplicationDbContext context;

        public UserClientRepository(ApplicationDbContext context)
        {
            this.context = context;
        }

        public async Task<IEnumerable<UserClient>> GetAllAsync()
        {
            return await context.UserClients.ToListAsync();
        }

        public async Task<UserClient> GetByIdAsync(Guid userClientId)
        {
            var userClient = await context.UserClients.FindAsync(userClientId);
            if (userClient == null)
            {
                throw new KeyNotFoundException("UserClient not found");
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

                // Update only the properties that are allowed to be changed
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

        public async Task DeleteAsync(Guid userClientId)
        {
            var userClient = await context.UserClients.FindAsync(userClientId);
            if (userClient == null)
            {
                throw new KeyNotFoundException("UserClient not found");
            }
            context.UserClients.Remove(userClient);
            await context.SaveChangesAsync();
        }
    }
}
