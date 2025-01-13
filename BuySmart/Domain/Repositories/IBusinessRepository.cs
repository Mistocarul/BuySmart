using Domain.Common;
using Domain.Entities;

namespace Domain.Repositories
{
    public interface IBusinessRepository
    {
        Task<IEnumerable<Business>> GetAllAsync();
        Task<Business> GetByIdAsync(Guid businessId);
        Task<Business> GetByUserBusinessIdAsync(Guid userId);
        Task<Result<Guid>> AddAsync(Business business);
        Task<Result<object>> UpdateAsync(Business business);
        Task DeleteAsync(Guid businessId);
    }
}
