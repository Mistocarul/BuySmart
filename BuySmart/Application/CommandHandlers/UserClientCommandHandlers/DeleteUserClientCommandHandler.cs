using Application.Commands.UserClientCommands;
using Domain.Common;
using Domain.Entities;
using Domain.Repositories;
using MediatR;

namespace Application.CommandHandlers.UserClientCommandHandlers
{
    public class DeleteUserClientCommandHandler : IRequestHandler<DeleteUserClientCommand, Result<object>>
    {
        private readonly IUserRepository<UserClient> userRepository;

        public DeleteUserClientCommandHandler(IUserRepository<UserClient> userRepository)
        {
            this.userRepository = userRepository;
        }

        public async Task<Result<object>> Handle(DeleteUserClientCommand request, CancellationToken cancellationToken)
        {
            var user = await userRepository.GetByIdAsync(request.UserId);
            if (user == null)
            {
                return Result<object>.Failure("User not found");
            }

            await userRepository.DeleteAsync(request.UserId);
            return Result<object>.Success(new object());
        }
    }
}
