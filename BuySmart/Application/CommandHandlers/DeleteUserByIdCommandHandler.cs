using Application.Commands;
using Domain.Repositories;
using MediatR;

namespace Application.CommandHandlers
{
    public class DeleteUserByIdCommandHandler : IRequestHandler<DeleteUserByIdCommand>
    {
        private readonly IUserRepository userRepository;
        public DeleteUserByIdCommandHandler(IUserRepository userRepository)
        {
            this.userRepository = userRepository;
        }
        public async Task Handle(DeleteUserByIdCommand request, CancellationToken cancellationToken)
        {
            await userRepository.DeleteAsync(request.Id);
        }
    }
}
