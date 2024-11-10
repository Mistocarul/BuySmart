using Domain.Common;
using Domain.Entities;
using Domain.Repositories;
using Infrastructure.Persistence;
using Microsoft.EntityFrameworkCore;

namespace Infrastructure.Repositories
{
    public class CartRepository : ICartRepository
    {
        private readonly ApplicationDbContext context;

        public CartRepository(ApplicationDbContext context)
        {
            this.context = context;
        }
        public async Task<Result<Guid>> AddAsync(Cart cart)
        {
            try
            {
                var userExists = await context.Users.AnyAsync(u => u.UserId == cart.UserClientId);
                if (!userExists)
                {
                    return Result<Guid>.Failure("UserClientId does not exist.");
                }

                await context.Carts.AddAsync(cart);
                await context.SaveChangesAsync();
                return Result<Guid>.Success(cart.CartId);
            }
            catch (Exception ex)
            {
                return Result<Guid>.Failure(ex.Message);
            }
        }

        public Task DeleteAsync(Guid cartId)
        {
            throw new NotImplementedException();
        }

        public Task<IEnumerable<Cart>> GetAllAsync()
        {
            throw new NotImplementedException();
        }

        public Task<Cart> GetByIdAsync(Guid cartId)
        {
            throw new NotImplementedException();
        }

        public Task<Result<object>> UpdateAsync(Cart cart)
        {
            throw new NotImplementedException();
        }
    }
}
