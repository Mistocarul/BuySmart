using Domain.Common;
using MediatR;

namespace Application.Commands.ProductCommands
{
    public class DeleteProductCommand : IRequest<Result<object>>
    {
        public Guid ProductId { get; set; }
    }
}
