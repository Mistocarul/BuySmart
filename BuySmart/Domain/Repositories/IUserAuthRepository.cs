using Domain.Entities;

namespace Domain.Repositories
{
    public interface IUserAuthRepository<T> where T : User
    {
        Task<Guid> Register(T user, CancellationToken cancellationToken);
        Task<string> Login(T user);
    }
}
