using Application.DTOs;
using Application.Queries.UserBusinessQueries;
using Application.Utils;
using AutoMapper;
using Domain.Common;
using Domain.Repositories;
using MediatR;
using Gridify;
using Domain.Entities;

namespace Application.QueryHandlers.UserBusinessQueryHandlers
{
    public class GetFilteredUserBusinessesQueryHandler : IRequestHandler<GetFilteredUserBusinessesQuery, Result<PagedResult<UserBusinessDto>>>
    {
        private readonly IUserRepository<UserBusiness> repository;
        private readonly IMapper mapper;
        public GetFilteredUserBusinessesQueryHandler(IUserRepository<UserBusiness> repository, IMapper mapper)
        {
            this.repository = repository;
            this.mapper = mapper;
        }
        public async Task<Result<PagedResult<UserBusinessDto>>> Handle(GetFilteredUserBusinessesQuery request, CancellationToken cancellationToken)
        {
            var userBusinesses = await repository.GetAllAsync();

            if (request.Filter != null)
            {
                userBusinesses = userBusinesses.AsQueryable().Where(request.Filter);
            }

            var totalCount = userBusinesses.Count();
            var pagedUserBusinesses = userBusinesses.AsQueryable().ApplyPaging(request.Page, request.PageSize);
            var userBusinessDtos = mapper.Map<List<UserBusinessDto>>(pagedUserBusinesses);
            var pagedResult = new PagedResult<UserBusinessDto>(userBusinessDtos, totalCount);
            return Result<PagedResult<UserBusinessDto>>.Success(pagedResult);
        }
    }
}