using Domain.Common;
using MediatR;

namespace Application.Commands
{
    public class DeleteUserBusinessCommand : IRequest<Result<object>>
    {
        public Guid UserId { get; set; }
    }
}
