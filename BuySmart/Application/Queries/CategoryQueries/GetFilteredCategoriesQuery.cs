using Application.DTOs;
using Application.Utils;
using Domain.Common;
using Domain.Entities;
using MediatR;
using System.Linq.Expressions;

namespace Application.Queries.CategoryQueries
{
    public class GetFilteredCategoriesQuery : IRequest<Result<PagedResult<CategoryDto>>>
    {
        public int Page { get; set; }

        public int PageSize { get; set; }

        public Expression<Func<Category, bool>>? Filter { get; set; }
    }
}