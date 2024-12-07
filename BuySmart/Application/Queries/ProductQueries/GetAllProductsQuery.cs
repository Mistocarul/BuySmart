using Application.DTOs;
using Domain.Entities;
using MediatR;

namespace Application.Queries.ProductQueries
{
    public class GetAllProductsQuery : IRequest<List<ProductDto>>
    {
        public string? Name { get; set; }
        public Guid? CategoryId { get; set; }
        public decimal? MinPrice { get; set; }
        public decimal? MaxPrice { get; set; }

        public int pageNumber { get; set; }
        public int pageSize { get; set; }

        public ProductOrder order { get; set; }


    }
}
