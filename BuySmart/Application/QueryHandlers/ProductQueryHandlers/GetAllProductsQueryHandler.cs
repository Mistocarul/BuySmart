using Application.DTOs;
using Application.Queries.ProductQueries;
using AutoMapper;
using Domain.Repositories;
using MediatR;

namespace Application.QueryHandlers.ProductQueryHandlers
{
    public class GetAllProductsQueryHandler : IRequestHandler<GetAllProductsQuery, List<ProductDto>>
    {
        private readonly IProductRepository productRepository;
        private readonly IMapper mapper;

        public GetAllProductsQueryHandler(IProductRepository productRepository, IMapper mapper)
        {
            this.productRepository = productRepository;
            this.mapper = mapper;
        }

        public async Task<List<ProductDto>> Handle(GetAllProductsQuery request, CancellationToken cancellationToken)
        {
            var products = await productRepository.GetAllAsync(request.pageNumber, request.pageSize, request.order);

            if (!string.IsNullOrEmpty(request.Name))
            {
                products = products.Where(p => p.Name.Contains(request.Name)).ToList();
            }
            if(request.CategoryId.HasValue)
            {
                products = products.Where(p => p.Categories.Any(c => c.CategoryId == request.CategoryId)).ToList();
            }

            if (request.MinPrice.HasValue)
            {
                products = products.Where(p => p.Price >= request.MinPrice.Value).ToList();
            }

            if (request.MaxPrice.HasValue)
            {
                products = products.Where(p => p.Price <= request.MaxPrice.Value).ToList();
            }

            return mapper.Map<List<ProductDto>>(products);
        }
    }
}
