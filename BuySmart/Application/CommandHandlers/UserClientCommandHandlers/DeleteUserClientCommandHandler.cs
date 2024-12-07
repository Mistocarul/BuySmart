using Application.Commands.UserClientCommands;
using Domain.Common;
using Domain.Repositories;
using MediatR;

namespace Application.CommandHandlers.UserClientCommandHandlers
{
    public class DeleteUserClientCommandHandler : IRequestHandler<DeleteUserClientCommand, Result<object>>
    {
        private readonly IUserClientRepository userClientRepository;

        public DeleteUserClientCommandHandler(IUserClientRepository userClientRepository)
        {
            this.userClientRepository = userClientRepository;
        }

        public async Task<Result<object>> Handle(DeleteUserClientCommand request, CancellationToken cancellationToken)
        {
            var user = await userClientRepository.GetByIdAsync(request.UserId);
            if (user == null)
            {
                return Result<object>.Failure("User not found");
            }

            await userClientRepository.DeleteAsync(request.UserId);
            return Result<object>.Success(new object());
        }
    }
}
