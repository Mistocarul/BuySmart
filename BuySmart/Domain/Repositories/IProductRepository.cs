using Domain.Common;
using Domain.Entities;

namespace Domain.Repositories
{
    public interface IProductRepository
    {
        Task<IEnumerable<Product>> GetAllAsync();
        Task<IEnumerable<Product>> GetAllByBusinessIdAsync(Guid businessId);
        Task<Product> GetByIdAsync(Guid productId);
        Task<Result<Guid>> AddAsync(Product product);
        Task<Result<object>> UpdateAsync(Product product);
        Task DeleteAsync(Guid productId);
    }
}
