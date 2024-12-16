using Application.DTOs;
using Application.Queries.CategoryQueries;
using Application.Utils;
using AutoMapper;
using Domain.Common;
using Domain.Repositories;
using MediatR;
using Gridify;

namespace Application.QueryHandlers.CategoryQueryHandlers
{
    public class GetFilteredcategoriesQueryHandler : IRequestHandler<GetFilteredCategoriesQuery, Result<PagedResult<CategoryDto>>>
    {
        private readonly ICategoryRepository repository;
        private readonly IMapper mapper;
        public GetFilteredcategoriesQueryHandler(ICategoryRepository repository, IMapper mapper)
        {
            this.repository = repository;
            this.mapper = mapper;
        }
        public async Task<Result<PagedResult<CategoryDto>>> Handle(GetFilteredCategoriesQuery request, CancellationToken cancellationToken)
        {
            var categories = await repository.GetAllAsync();

            if (request.Filter != null)
            {
                categories = categories.AsQueryable().Where(request.Filter);
            }

            //lazy evaluation; interogare executata direct in baza de date 
            //doar datele necesare sunt aduse in memorie
            //daca faceam ca inainte, skip si take erau aplicate in memorie

            var totalCount = categories.Count();
            var pagedCategories = categories.AsQueryable().ApplyPaging(request.Page, request.PageSize);
            var categoryDtos = mapper.Map<List<CategoryDto>>(pagedCategories);

            var pagedResult = new PagedResult<CategoryDto>(categoryDtos, totalCount);

            return Result<PagedResult<CategoryDto>>.Success(pagedResult);
        }
    }
}