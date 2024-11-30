using Application.DTOs;
using MediatR;

namespace Application.Queries.ProductQueries
{
    public class GetProductByIdQuery : IRequest<ProductDto>
    {
        public Guid ProductId { get; set; }
    }
      
}

