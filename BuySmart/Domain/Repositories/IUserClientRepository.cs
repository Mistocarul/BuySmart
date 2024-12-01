using Domain.Common;
using Domain.Entities;

namespace Domain.Repositories
{
    public interface IUserClientRepository
    {
        Task<IEnumerable<UserClient>> GetAllAsync(int pageNumber, int pageSize);
        Task<UserClient> GetByIdAsync(Guid userClientId);
        Task<Result<Guid>> AddAsync(UserClient userClient);
        Task<Result<object>> UpdateAsync(UserClient userClient);
        Task DeleteAsync(Guid userClientId);
    }
}
