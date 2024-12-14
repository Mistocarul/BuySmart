using Domain.Common;
using Domain.Entities;

namespace Domain.Repositories
{
    public interface ICategoryRepository
    {
        Task<IEnumerable<Category>> GetAllAsync();
        Task<Category> GetByIdAsync(Guid categoryId);
        Task<Result<Guid>> AddAsync(Category category);
        Task<Result<object>> UpdateAsync(Category category);
        Task DeleteAsync(Guid categoryId);

    }
}
