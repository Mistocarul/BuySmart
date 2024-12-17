using Application.DTOs;
using MediatR;

namespace Application.Queries.ProductQueries
{
    public class GetAllProductsQuery : IRequest<List<ProductDto>>
    {

    }
}