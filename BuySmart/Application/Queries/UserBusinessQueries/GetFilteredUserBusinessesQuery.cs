using Application.DTOs;
using Application.Utils;
using Domain.Common;
using Domain.Entities;
using MediatR;
using System.Linq.Expressions;

namespace Application.Queries.UserBusinessQueries
{
    public class GetFilteredUserBusinessesQuery : IRequest<Result<PagedResult<UserBusinessDto>>>
    {
        public int Page { get; set; }
        public int PageSize { get; set; }
        public Expression<Func<UserBusiness, bool>>? Filter { get; set; }
    }
}