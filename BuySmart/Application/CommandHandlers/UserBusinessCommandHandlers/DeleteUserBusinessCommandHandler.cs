using Application.Commands.UserBusinessCommands;
using Domain.Common;
using Domain.Entities;
using Domain.Repositories;
using MediatR;

namespace Application.CommandHandlers.UserBusinessCommandHandlers
{
    public class DeleteUserBusinessCommandHandler : IRequestHandler<DeleteUserBusinessCommand, Result<object>>
    {
        private readonly IUserRepository<UserBusiness> userBusinessRepository;
        public DeleteUserBusinessCommandHandler(IUserRepository<UserBusiness> userBusinessRepository)
        {
            this.userBusinessRepository = userBusinessRepository;
        }
        public async Task<Result<object>> Handle(DeleteUserBusinessCommand request, CancellationToken cancellationToken)
        {
            var user = await userBusinessRepository.GetByIdAsync(request.UserId);
            if (user == null)
            {
                return Result<object>.Failure("User not found");
            }
            await userBusinessRepository.DeleteAsync(request.UserId);
            return Result<object>.Success(new object());
        }
    }
}
