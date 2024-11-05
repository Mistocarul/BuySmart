using MediatR;
using Domain.Common;

namespace Application.Commands
{
    public class DeleteUserClientCommand : IRequest<Result<object>>
    {
        public Guid UserId { get; set; }
    }
}
