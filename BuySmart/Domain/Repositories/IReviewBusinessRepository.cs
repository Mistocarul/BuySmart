using Domain.Common;
using Domain.Entities;

namespace Domain.Repositories
{
    public interface IReviewBusinessRepository
    {
        Task<IEnumerable<Review>> GetAllAsync();
        Task<Review> GetByIdAsync(Guid review);
        Task<Result<Guid>> AddAsync(Review review);
        Task<Result<object>> UpdateAsync(Review review);
        Task DeleteAsync(Guid review);
    }
}
