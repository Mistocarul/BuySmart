using Domain.Common;
using MediatR;

namespace Application.Commands.ProductCommands
{
    public class CreateProductCommand : IRequest<Result<Guid>>
    {
        public string Name { get; set; } = string.Empty;
        public string Description { get; set; } = string.Empty;
        public decimal Price { get; set; }
        public double Stock { get; set; }
        public double Rating { get; set; }
        public string Image { get; set; } = string.Empty;
        public Guid BusinessId { get; set; }

        public List<string> CategoryNames { get; set; } = new List<string>();
    }
}
