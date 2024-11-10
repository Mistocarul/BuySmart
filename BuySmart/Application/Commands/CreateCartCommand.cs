using Domain.Common;
using MediatR;

namespace Application.Commands
{
    public class CreateCartCommand : IRequest<Result<Guid>>
    {
        public Guid UserClientId { get; set; }
    }
}
