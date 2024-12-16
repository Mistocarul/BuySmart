using Application.DTOs;
using Application.Utils;
using Domain.Common;
using Domain.Entities;
using MediatR;
using System.Linq.Expressions;

namespace Application.Queries.BusinessQueries
{
    public class GetFilteredBusinessesQuery : IRequest<Result<PagedResult<BusinessDto>>>
    {
        public int Page { get; set; }
        public int PageSize { get; set; }
        public Expression<Func<Business, bool>>? Filter { get; set; }
    }
}