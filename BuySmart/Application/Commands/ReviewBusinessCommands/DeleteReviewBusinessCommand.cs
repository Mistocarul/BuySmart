using Domain.Common;
using MediatR;

namespace Application.Commands.ReviewBusinessCommands
{
    public class DeleteReviewBusinessCommand : IRequest<Result<object>>
    {
        public Guid ReviewId { get; set; }
    }
}
