using Domain.Common;
using Domain.Entities;

namespace Domain.Repositories
{
    public interface IUserRepository<T> where T : User
    {
        Task<IEnumerable<T>> GetAllAsync();
        Task<T> GetByIdAsync(Guid userId);
        Task<Result<Guid>> AddAsync(T user);
        Task<Result<object>> UpdateAsync(T user);
        Task DeleteAsync(Guid user);
    }
}
