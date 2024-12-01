using Domain.Entities;
using Domain.Common;

namespace Domain.Repositories
{
    public interface IUserBusinessRepository
    {
        Task<IEnumerable<UserBusiness>> GetAllAsync(int pageNumber, int pageSize);
        Task<UserBusiness> GetByIdAsync(Guid userBusinessId);
        Task<Result<Guid>> AddAsync(UserBusiness userBusiness);
        Task<Result<object>> UpdateAsync(UserBusiness userBusiness);
        Task DeleteAsync(Guid userBusinessId);

    }
}
