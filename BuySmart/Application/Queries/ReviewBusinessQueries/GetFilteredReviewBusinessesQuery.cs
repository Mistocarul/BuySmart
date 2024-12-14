using Application.DTOs;
using Application.Utils;
using Domain.Common;
using Domain.Entities;
using MediatR;
using System.Linq.Expressions;

namespace Application.Queries.ReviewBusinessQueries
{
    public class GetFilteredReviewBusinessesQuery: IRequest<Result<PagedResult<ReviewDto>>>
    {
        public int Page { get; set; }
        public int PageSize { get; set; }
        public Expression<Func<Review, bool>>? Filter { get; set; }
    }
}
