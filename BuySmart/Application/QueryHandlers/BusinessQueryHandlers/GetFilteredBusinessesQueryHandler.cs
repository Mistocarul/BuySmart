using Application.DTOs;
using Application.Queries.BusinessQueries;
using Application.Utils;
using AutoMapper;
using Domain.Common;
using Domain.Repositories;
using MediatR;
using Gridify;

namespace Application.QueryHandlers.BusinessQueryHandlers
{
    public class GetFilteredBusinessesQueryHandler : IRequestHandler<GetFilteredBusinessesQuery, Result<PagedResult<BusinessDto>>>
    {
        private readonly IBusinessRepository repository;
        private readonly IMapper mapper;
        public GetFilteredBusinessesQueryHandler(IBusinessRepository repository, IMapper mapper)
        {
            this.repository = repository;
            this.mapper = mapper;
        }

        public async Task<Result<PagedResult<BusinessDto>>> Handle(GetFilteredBusinessesQuery request, CancellationToken cancellationToken)
        {
            var businesses = await repository.GetAllAsync();
            if (request.Filter != null)
            {
                businesses = businesses.AsQueryable().Where(request.Filter);
            }
            var totalCount = businesses.Count();
            var pagedBusinesses = businesses.AsQueryable().ApplyPaging(request.Page, request.PageSize);
            var businessDtos = mapper.Map<List<BusinessDto>>(pagedBusinesses);
            var pagedResult = new PagedResult<BusinessDto>(businessDtos, totalCount);
            return Result<PagedResult<BusinessDto>>.Success(pagedResult);
        }
    }
}