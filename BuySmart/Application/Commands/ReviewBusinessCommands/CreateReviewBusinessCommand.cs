using Domain.Common;
using MediatR;

namespace Application.Commands.ReviewBusinessCommands
{
    public class CreateReviewBusinessCommand : IRequest<Result<Guid>>
    {
        public Guid UserClientId { get; set; }
        public Guid BusinessId { get; set; }
        public double Rating { get; set; }
        public string Comment { get; set; } = string.Empty;
    }
}
