using Application.DTOs;
using Application.Utils;
using Domain.Common;
using Domain.Entities;
using MediatR;
using System.Linq.Expressions;

namespace Application.Queries.ProductQueries
{
    public class GetFilteredProductsQuery : IRequest<Result<PagedResult<ProductDto>>>
    {
        public int Page { get; set; }

        public int PageSize { get; set; }

        public Expression<Func<Product, bool>>? Filter { get; set; }
        public string? SortDirection { get; set; }
    }
}