using Application.DTOs;
using Application.Queries.UserClientQueries;
using Application.Utils;
using AutoMapper;
using Domain.Common;
using Domain.Repositories;
using MediatR;
using Gridify;
using Domain.Entities;

namespace Application.QueryHandlers.UserClientQueryHandlers
{
    public class GetFilteredUserClientsQueryHandler : IRequestHandler<GetFilteredUserClientsQuery, Result<PagedResult<UserClientDto>>>
    {
        private readonly IUserRepository<UserClient> repository;
        private readonly IMapper mapper;
        public GetFilteredUserClientsQueryHandler(IUserRepository<UserClient> repository, IMapper mapper)
        {
            this.repository = repository;
            this.mapper = mapper;
        }
        public async Task<Result<PagedResult<UserClientDto>>> Handle(GetFilteredUserClientsQuery request, CancellationToken cancellationToken)
        {
            var userClients = await repository.GetAllAsync();

            if (request.Filter != null)
            {
                userClients = userClients.AsQueryable().Where(request.Filter);
            }

            var totalCount = userClients.Count();
            var pagedUserClients = userClients.AsQueryable().ApplyPaging(request.Page, request.PageSize);
            var userClientDtos = mapper.Map<List<UserClientDto>>(pagedUserClients);
            var pagedResult = new PagedResult<UserClientDto>(userClientDtos, totalCount);
            return Result<PagedResult<UserClientDto>>.Success(pagedResult);
        }
    }
}