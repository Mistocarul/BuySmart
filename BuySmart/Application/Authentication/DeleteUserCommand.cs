using Domain.Common;
using MediatR;

namespace Application.Authentication
{
    public class DeleteUserCommand : IRequest<Result<object>>
    {
        public Guid UserId { get; set; }
    }
}