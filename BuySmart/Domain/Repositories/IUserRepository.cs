using Domain.Common;
using Domain.Entities;

namespace Domain.Repositories
{
    public interface IUserRepository
    {
        Task<IEnumerable<User>> GetAllAsync();
        Task<User> GetByIdAsync(Guid userId);
        Task<Result<Guid>> AddAsync(User user);
        Task<Result<object>> UpdateAsync(User user);
        Task DeleteAsync(Guid userId);
    }
}
