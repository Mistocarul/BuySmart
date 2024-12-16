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
            var products = await productRepository.GetAllAsync();
            List<ProductDto> productsDto = new List<ProductDto>();
            foreach (var product in products)
            {
                var categoryDtos = mapper.Map<List<CategoryDto>>(product.Categories);
                var productDto = mapper.Map<ProductDto>(product);
                productDto.Categories = categoryDtos;
                productsDto.Add(productDto);
            }
            return productsDto;
        }
    }
}