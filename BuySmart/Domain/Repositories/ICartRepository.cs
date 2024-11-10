using Domain.Common;
using Domain.Entities;

namespace Domain.Repositories
{
    public interface ICartRepository
    {
        Task<IEnumerable<Cart>> GetAllAsync();
        Task<Cart> GetByIdAsync(Guid cartId);
        Task<Result<Guid>> AddAsync(Cart cart);
        Task<Result<object>> UpdateAsync(Cart cart);
        Task DeleteAsync(Guid cartId);
    }
}
