using Application.Authentication;
using Domain.Common;
using Domain.Entities;
using Domain.Repositories;
using MediatR;

namespace Application.CommandHandlers.UserClientCommandHandlers
{
    public class DeleteUserCommandHandler : IRequestHandler<DeleteUserCommand, Result<object>>
    {
        private readonly IUserAuthRepository<User> userAuthRepository;

        public DeleteUserCommandHandler(IUserAuthRepository<User> userAuthRepository)
        {
            this.userAuthRepository = userAuthRepository;
        }

        public async Task<Result<object>> Handle(DeleteUserCommand request, CancellationToken cancellationToken)
        {
            var user = await userAuthRepository.GetByIdAsync(request.UserId);
            if (user == null)
            {
                return Result<object>.Failure("User not found");
            }
            await userAuthRepository.DeleteUserAsync(request.UserId);
            return Result<object>.Success(new object());
        }
    }
}