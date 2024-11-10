using MediatR;
using Domain.Common;

namespace Application.Commands.UserClientCommands
{
    public class DeleteUserClientCommand : IRequest<Result<object>>
    {
        public Guid UserId { get; set; }
    }
}
