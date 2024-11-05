using Domain.Entities;

namespace Domain.Repositories
{
    public interface IProductRepository
    {
        Task<IEnumerable<Product>> GetAllAsync();
        Task<Product> GetByIdAsync(Guid productId);
        Task<Guid> AddAsync(Product product);
        Task UpdateAsync(Product product);
        Task DeleteAsync(Guid productId);
    }
}
