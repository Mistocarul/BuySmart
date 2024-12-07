using Domain.Common;
using MediatR;

namespace Application.Commands.ProductCommands
{
    public class UpdateProductCommand : IRequest<Result<object>>
    {
        public Guid ProductId { get; set; }
        public string Name { get; set; } = string.Empty;
        public string Description { get; set; } = string.Empty;
        public decimal Price { get; set; }
        public int Stock { get; set; }
        public double Rating { get; set; }
        public string Image { get; set; } = string.Empty;
        public Guid BusinessId { get; set; }
    }
}
