using Domain.Common;

namespace Domain.Repositories
{
    public interface IUserAuthRepository<User>
    {
        Task<Result<Guid>> Register(int verificationCode, CancellationToken cancellationToken);
        Task<Result<string>> Login(User user);
        Task<Result<string>> SendVerificationCode(User user, CancellationToken cancellationToken);
    }
}
