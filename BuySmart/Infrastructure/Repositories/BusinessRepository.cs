using Domain.Common;
using Domain.Entities;
using Domain.Repositories;
using Infrastructure.Persistence;
using Microsoft.EntityFrameworkCore;

namespace Infrastructure.Repositories
{
    public class BusinessRepository: IBusinessRepository
    {
        private readonly ApplicationDbContext context;

        public BusinessRepository(ApplicationDbContext context)
        {
            this.context = context;
        }

        public async Task<IEnumerable<Business>> GetAllAsync()
        {
            return await context.Businesses.ToListAsync();
        }
       

        public async Task<Business> GetByIdAsync(Guid businessId)
        {
            var business = await context.Businesses.FindAsync(businessId);
            if (business == null)
            {
                throw new KeyNotFoundException("Business not found");
            }
            return business;
        }

        public async Task<Business> GetByUserBusinessIdAsync(Guid userId)
        {
            var business = await context.Businesses.FirstOrDefaultAsync(b => b.UserBusinessId == userId);
            if (business == null)
            {
                throw new KeyNotFoundException("Business not found");
            }
            return business;
        }

        public async Task<Result<Guid>> AddAsync(Business business)
        {
            
            try
            {
                var userExists = await context.Users.AnyAsync(u => u.UserId == business.UserBusinessId);
                if (!userExists)
                {
                    return Result<Guid>.Failure("UserBusinessID does not exist.");
                }

                await context.Businesses.AddAsync(business);
                await context.SaveChangesAsync();
                return Result<Guid>.Success(business.BusinessID);
            }
            catch (Exception ex)
            {
                return Result<Guid>.Failure(ex.Message);
            }
        }

        public async Task<Result<object>> UpdateAsync(Business business)
        {
            try
            {
                var existingBusiness = await context.Businesses.FindAsync(business.BusinessID);
                if (existingBusiness == null)
                {
                    return Result<object>.Failure("Business not found");
                }

                // Update only the properties that are allowed to be changed
                existingBusiness.Name = business.Name;
                existingBusiness.Address = business.Address;
                existingBusiness.PhoneNumber = business.PhoneNumber;
                existingBusiness.Description = business.Description;
                

                context.Businesses.Update(existingBusiness);
                await context.SaveChangesAsync();
                return Result<object>.Success(new object());
            }
            catch (Exception ex)
            {
                return Result<object>.Failure(ex.Message);
            }
        }

        public async Task DeleteAsync(Guid businessId)
        {
            var business = await context.Businesses.FindAsync(businessId);
            if (business == null)
            {
                throw new KeyNotFoundException("Business not found");
            }

            context.Businesses.Remove(business);
            await context.SaveChangesAsync();
        }


    }
}
