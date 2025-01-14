using Domain.Common;
using Domain.Entities;
using Domain.Repositories;
using Infrastructure.Persistence;
using Microsoft.EntityFrameworkCore;

namespace Infrastructure.Repositories
{
    public class UserBusinessRepository : IUserRepository<UserBusiness>
    {
        private readonly ApplicationDbContext context;
        public UserBusinessRepository(ApplicationDbContext context)
        {
            this.context = context;
        }
        public async Task<Result<Guid>> AddAsync(UserBusiness userBusiness)
        {
            try
            {
                await context.UserBusinesses.AddAsync(userBusiness);
                await context.SaveChangesAsync();
                return Result<Guid>.Success(userBusiness.UserId);
            }
            catch (Exception ex)
            {
                return Result<Guid>.Failure(ex.Message);
            }

        }

        public async Task<IEnumerable<UserBusiness>> GetAllAsync()
        {
            return await context.UserBusinesses.ToListAsync();
        }

        public async Task<UserBusiness> GetByIdAsync(Guid userId)
        {
            var userBusiness = await context.UserBusinesses.FindAsync(userId);
            if (userBusiness == null)
            {
                throw new KeyNotFoundException("UserBusiness not found");
            }
            return userBusiness;
        }

        public async Task<Result<object>> UpdateAsync(UserBusiness userBusiness)
        {
            try
            {
                var existingUserBusiness = await context.UserBusinesses.FindAsync(userBusiness.UserId);
                if (existingUserBusiness == null)
                {
                    return Result<object>.Failure("UserBusiness not found");
                }

                
                existingUserBusiness.Name = userBusiness.Name;
                existingUserBusiness.Email = userBusiness.Email;
                existingUserBusiness.Password = userBusiness.Password;
                existingUserBusiness.UserType = userBusiness.UserType;
                existingUserBusiness.Image = userBusiness.Image;

                context.UserBusinesses.Update(existingUserBusiness);
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
