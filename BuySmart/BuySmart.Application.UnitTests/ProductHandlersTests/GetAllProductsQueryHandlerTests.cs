using Application.DTOs;
using Application.QueryHandlers.ProductQueryHandlers;
using Application.Queries.ProductQueries;
using AutoMapper;
using Domain.Entities;
using Domain.Repositories;
using NSubstitute;

namespace BuySmart.Application.UnitTests.ProductHandlersTests
{
    public class GetAllProductsQueryHandlerTests
    {
        private readonly IProductRepository productRepository;
        private readonly IMapper mapper;
        private readonly GetAllProductsQueryHandler handler;

        public GetAllProductsQueryHandlerTests()
        {
            productRepository = Substitute.For<IProductRepository>();
            mapper = Substitute.For<IMapper>();
            handler = new GetAllProductsQueryHandler(productRepository, mapper);
        }

        [Fact]
        public async Task Handle_ShouldReturnMappedProducts_WhenProductsExist()
        {
            // Arrange
            var query = new GetAllProductsQuery();
            var products = new List<Product>
            {
                new Product { ProductId = Guid.NewGuid(), Name = "Product1", Categories = new List<Category> { new Category { CategoryId = Guid.NewGuid(), Name = "Category1" } } },
                new Product { ProductId = Guid.NewGuid(), Name = "Product2", Categories = new List<Category> { new Category { CategoryId = Guid.NewGuid(), Name = "Category2" } } }
            };
            var productDtos = new List<ProductDto>
            {
                new ProductDto { ProductId = products[0].ProductId, Name = "Product1", Categories = new List<CategoryDto> { new CategoryDto { CategoryId = products[0].Categories.First().CategoryId, Name = "Category1" } } },
                new ProductDto { ProductId = products[1].ProductId, Name = "Product2", Categories = new List<CategoryDto> { new CategoryDto { CategoryId = products[1].Categories.First().CategoryId, Name = "Category2" } } }
            };

            productRepository.GetAllAsync().Returns(products);
            mapper.Map<List<CategoryDto>>(products[0].Categories).Returns(productDtos[0].Categories.ToList());
            mapper.Map<List<CategoryDto>>(products[1].Categories).Returns(productDtos[1].Categories.ToList());
            mapper.Map<ProductDto>(products[0]).Returns(productDtos[0]);
            mapper.Map<ProductDto>(products[1]).Returns(productDtos[1]);

            // Act
            var result = await handler.Handle(query, CancellationToken.None);

            // Assert
            Assert.Equal(productDtos.Count, result.Count);
            Assert.Equal(productDtos[0].ProductId, result[0].ProductId);
            Assert.Equal(productDtos[1].ProductId, result[1].ProductId);
            await productRepository.Received(1).GetAllAsync();
        }

        [Fact]
        public async Task Handle_ShouldReturnEmptyList_WhenNoProductsExist()
        {
            // Arrange
            var query = new GetAllProductsQuery();
            var products = new List<Product>();
            var productDtos = new List<ProductDto>();

            productRepository.GetAllAsync().Returns(products);
            mapper.Map<List<ProductDto>>(products).Returns(productDtos);

            // Act
            var result = await handler.Handle(query, CancellationToken.None);

            // Assert
            Assert.Empty(result);
            await productRepository.Received(1).GetAllAsync();
        }
    }
}



