using Domain.Common;
using MediatR;

namespace Application.Commands.ReviewBusinessCommands
{
    public class UpdateReviewBusinessCommand : IRequest<Result<object>>
    {
        public Guid ReviewId { get; set; }
        public Guid UserClientId { get; set; }
        public Guid BusinessId { get; set; }
        public double Rating { get; set; } = 0;
        public string Comment { get; set; } = string.Empty;
    }
}
