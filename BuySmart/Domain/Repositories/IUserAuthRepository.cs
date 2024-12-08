using Domain.Entities;

namespace Domain.Repositories
{
    public interface IUserAuthRepository<User>
    {
        Task<Guid> Register(User user, CancellationToken cancellationToken);
        Task<string> Login(User user);
    }
}
