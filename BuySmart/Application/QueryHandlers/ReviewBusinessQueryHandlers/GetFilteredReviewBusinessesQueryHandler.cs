using Application.DTOs;
using Application.Queries.ReviewBusinessQueries;
using Application.Utils;
using AutoMapper;
using Domain.Common;
using Domain.Repositories;
using MediatR;
using Gridify;

namespace Application.QueryHandlers.ReviewBusinessQueryHandlers
{
    public class GetFilteredReviewBusinessesQueryHandler : IRequestHandler<GetFilteredReviewBusinessesQuery, Result<PagedResult<ReviewDto>>>
    {
        private readonly IReviewBusinessRepository repository;
        private readonly IMapper mapper;
        public GetFilteredReviewBusinessesQueryHandler(IReviewBusinessRepository repository, IMapper mapper)
        {
            this.repository = repository;
            this.mapper = mapper;
        }
        public async Task<Result<PagedResult<ReviewDto>>> Handle(GetFilteredReviewBusinessesQuery request, CancellationToken cancellationToken)
        {
            var reviewBusinesses = await repository.GetAllAsync();

            if (request.Filter != null)
            {
                reviewBusinesses = reviewBusinesses.AsQueryable().Where(request.Filter);
            }

            var totalCount = reviewBusinesses.Count();
            var pagedReviewBusinesses = reviewBusinesses.AsQueryable().ApplyPaging(request.Page, request.PageSize);
            var reviewBusinessDtos = mapper.Map<List<ReviewDto>>(pagedReviewBusinesses);
            var pagedResult = new PagedResult<ReviewDto>(reviewBusinessDtos, totalCount);
            return Result<PagedResult<ReviewDto>>.Success(pagedResult);
        }
    }
}