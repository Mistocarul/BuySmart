using Domain.Common;

namespace Domain.Repositories
{
    public interface IUserAuthRepository<User>
    {
        Task<Result<Guid>> Register(int verificationCode, CancellationToken cancellationToken);
        Task<Result<string>> Login(User user);
        Task<Result<string>> SendVerificationCode(User user, CancellationToken cancellationToken);
        Task DeleteUserAsync(Guid userId);
        Task<User> GetByIdAsync(Guid userId);
        Task<Result<string>> VerifyPassword(Guid userId, string password);
    }
}
