using Domain.Common;
using MediatR;

namespace Application.Commands.CartCommands
{
    public class CreateCartCommand : IRequest<Result<Guid>>
    {
        public Guid UserClientId { get; set; }
    }
}
