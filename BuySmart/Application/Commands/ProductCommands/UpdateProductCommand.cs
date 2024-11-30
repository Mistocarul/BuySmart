using Domain.Common;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Commands.ProductCommands
{
    public class UpdateProductCommand : IRequest<Result<object>>
    {
        public Guid ProductId { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public decimal Price { get; set; }
        public int Stock { get; set; }
        public double Rating { get; set; }
        public string Image { get; set; }
        public Guid BusinessId { get; set; }
    }
}
