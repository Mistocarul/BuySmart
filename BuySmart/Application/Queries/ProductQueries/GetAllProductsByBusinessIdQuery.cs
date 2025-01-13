using Application.DTOs;
using MediatR;

namespace Application.Queries.ProductQueries
{
    public class GetAllProductsByBusinessIdQuery : IRequest<List<ProductDto>>
    {
        public Guid BusinessId { get; set; }
    }
}
