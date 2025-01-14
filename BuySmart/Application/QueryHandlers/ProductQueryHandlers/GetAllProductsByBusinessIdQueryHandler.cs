using Application.DTOs;
using Application.Queries.ProductQueries;
using AutoMapper;
using Domain.Repositories;
using MediatR;

namespace Application.QueryHandlers.ProductQueryHandlers
{
    public class GetAllProductsByBusinessIdQueryHandler : IRequestHandler<GetAllProductsByBusinessIdQuery, List<ProductDto>>
    {
        private readonly IProductRepository repository;
        private readonly IMapper mapper;

        public GetAllProductsByBusinessIdQueryHandler(IProductRepository repository, IMapper mapper)
        {
            this.repository = repository;
            this.mapper = mapper;
        }

        public async Task<List<ProductDto>> Handle(GetAllProductsByBusinessIdQuery request, CancellationToken cancellationToken)
        {
            var products = await repository.GetAllByBusinessIdAsync(request.BusinessId);
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
