using Domain.Common;

namespace Domain.Repositories
{
    public interface IUserAuthRepository<User>
    {
        Task<Result<Guid>> Register(User user, CancellationToken cancellationToken);
        Task<Result<string>> Login(User user);
    }
}
