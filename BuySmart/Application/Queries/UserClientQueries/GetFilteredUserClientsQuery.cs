using Application.DTOs;
using Application.Utils;
using Domain.Common;
using Domain.Entities;
using MediatR;
using System.Linq.Expressions;

namespace Application.Queries.UserClientQueries
{
    public class GetFilteredUserClientsQuery : IRequest<Result<PagedResult<UserClientDto>>>
    {
        public int Page { get; set; }
        public int PageSize { get; set; }
        public Expression<Func<UserClient, bool>>? Filter { get; set; }
    }
}