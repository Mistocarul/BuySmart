using Application.DTOs;
using Application.Queries.ProductQueries;
using Application.Utils;
using AutoMapper;
using Domain.Common;
using Domain.Repositories;
using MediatR;
using Gridify;

namespace Application.QueryHandlers.ProductQueryHandlers
{
    public class GetFilteredProductsQueryHandler : IRequestHandler<GetFilteredProductsQuery, Result<PagedResult<ProductDto>>>
    {

        private readonly IProductRepository repository;
        private readonly IMapper mapper;
        public GetFilteredProductsQueryHandler(IProductRepository repository, IMapper mapper)
        {
            this.repository = repository;
            this.mapper = mapper;
        }
        public async Task<Result<PagedResult<ProductDto>>> Handle(GetFilteredProductsQuery request, CancellationToken cancellationToken)
        {
            var products = await repository.GetAllAsync();

            if (request.Filter != null)
            {
                products = products.AsQueryable().Where(request.Filter);
            }

            if (!string.IsNullOrEmpty(request.SortDirection))
            {
                if (request.SortDirection?.Equals("desc", StringComparison.OrdinalIgnoreCase) == true)
                {
                    products = products.AsQueryable().OrderByDescending(p=>p.Price);
                }
                else
                {
                    products= products.AsQueryable().OrderBy(p=>p.Price);
                }
            }
            var totalCount = products.Count();
            var pagedProducts = products.AsQueryable().ApplyPaging(request.Page, request.PageSize);
            var productDtos = mapper.Map<List<ProductDto>>(pagedProducts);

            var pagedResult = new PagedResult<ProductDto>(productDtos, totalCount);

            return Result<PagedResult<ProductDto>>.Success(pagedResult);
        }
    }
    }


