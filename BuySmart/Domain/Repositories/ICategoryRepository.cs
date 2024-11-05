using Domain.Entities;

namespace Domain.Repositories
{
    public interface ICategoryRepository
    {
        Task<IEnumerable<Category>> GetAllAsync();
        Task<Category> GetByIdAsync(Guid categoryId);
        Task<Guid> AddAsync(Category category);
        Task UpdateAsync(Category category);
        Task DeleteAsync(Guid categoryId);

    }
}
