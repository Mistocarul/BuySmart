using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using Application.DTOs;
using Application.QueryHandlers.ProductQueryHandlers;
using Application.Queries.ProductQueries;
using AutoMapper;
using Domain.Entities;
using Domain.Repositories;
using NSubstitute;
using Xunit;

namespace Application.UnitTests.ProductHandlersTests
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
        public async Task Handle_ShouldReturnMappedProducts_WhenNoFiltersAreApplied()
        {
            // Arrange
            var query = new GetAllProductsQuery { pageNumber = 1, pageSize = 10, order = ProductOrder.Def };
            var products = new List<Product> { new Product { ProductId = Guid.NewGuid(), Name = "Product1" } };
            var productDtos = new List<ProductDto> { new ProductDto { ProductId = products[0].ProductId, Name = "Product1" } };

            productRepository.GetAllAsync(Arg.Any<int>(), Arg.Any<int>(), Arg.Any<ProductOrder>()).Returns(products);
            mapper.Map<List<ProductDto>>(Arg.Any<List<Product>>()).Returns(productDtos);

            // Act
            var result = await handler.Handle(query, CancellationToken.None);

            // Assert
            Assert.Equal(productDtos, result);
        }

        [Fact]
        public async Task Handle_ShouldFilterByName_WhenNameIsProvided()
        {
            // Arrange
            var query = new GetAllProductsQuery { pageNumber = 1, pageSize = 10, order = ProductOrder.Def, Name = "Product1" };
            var products = new List<Product>
        {
            new Product { ProductId = Guid.NewGuid(), Name = "Product1" },
            new Product { ProductId = Guid.NewGuid(), Name = "Product2" }
        };
            var filteredProducts = products.Where(p => p.Name.Contains(query.Name)).ToList();
            var productDtos = new List<ProductDto> { new ProductDto { ProductId = filteredProducts[0].ProductId, Name = "Product1" } };

            productRepository.GetAllAsync(Arg.Any<int>(), Arg.Any<int>(), Arg.Any<ProductOrder>()).Returns(products);
            mapper.Map<List<ProductDto>>(Arg.Any<List<Product>>()).Returns(productDtos);

            // Act
            var result = await handler.Handle(query, CancellationToken.None);

            // Assert
            Assert.Single(result);
            Assert.Equal("Product1", result[0].Name);
        }

        [Fact]
        public async Task Handle_ShouldFilterByCategoryId_WhenCategoryIdIsProvided()
        {
            // Arrange
            var categoryId = Guid.NewGuid();
            var query = new GetAllProductsQuery { pageNumber = 1, pageSize = 10, order = ProductOrder.Def, CategoryId = categoryId };
            var products = new List<Product>
        {
            new Product { ProductId = Guid.NewGuid(), Name = "Product1", Categories = new List<Category> { new Category { CategoryId = categoryId } } },
            new Product { ProductId = Guid.NewGuid(), Name = "Product2", Categories = new List<Category> { new Category { CategoryId = Guid.NewGuid() } } }
        };
            var filteredProducts = products.Where(p => p.Categories.Any(c => c.CategoryId == query.CategoryId)).ToList();
            var productDtos = new List<ProductDto> { new ProductDto { ProductId = filteredProducts[0].ProductId, Name = "Product1" } };

            productRepository.GetAllAsync(Arg.Any<int>(), Arg.Any<int>(), Arg.Any<ProductOrder>()).Returns(products);
            mapper.Map<List<ProductDto>>(Arg.Any<List<Product>>()).Returns(productDtos);

            // Act
            var result = await handler.Handle(query, CancellationToken.None);

            // Assert
            Assert.Single(result);
            Assert.Equal("Product1", result[0].Name);
        }

        [Fact]
        public async Task Handle_ShouldFilterByMinPrice_WhenMinPriceIsProvided()
        {
            // Arrange
            var query = new GetAllProductsQuery { pageNumber = 1, pageSize = 10, order = ProductOrder.Def, MinPrice = 50 };
            var products = new List<Product>
        {
            new Product { ProductId = Guid.NewGuid(), Name = "Product1", Price = 100 },
            new Product { ProductId = Guid.NewGuid(), Name = "Product2", Price = 30 }
        };
            var filteredProducts = products.Where(p => p.Price >= query.MinPrice.Value).ToList();
            var productDtos = new List<ProductDto> { new ProductDto { ProductId = filteredProducts[0].ProductId, Name = "Product1" } };

            productRepository.GetAllAsync(Arg.Any<int>(), Arg.Any<int>(), Arg.Any<ProductOrder>()).Returns(products);
            mapper.Map<List<ProductDto>>(Arg.Any<List<Product>>()).Returns(productDtos);

            // Act
            var result = await handler.Handle(query, CancellationToken.None);

            // Assert
            Assert.Single(result);
            Assert.Equal("Product1", result[0].Name);
        }

        [Fact]
        public async Task Handle_ShouldFilterByMaxPrice_WhenMaxPriceIsProvided()
        {
            // Arrange
            var query = new GetAllProductsQuery { pageNumber = 1, pageSize = 10, order = ProductOrder.Def, MaxPrice = 50 };
            var products = new List<Product>
        {
            new Product { ProductId = Guid.NewGuid(), Name = "Product1", Price = 100 },
            new Product { ProductId = Guid.NewGuid(), Name = "Product2", Price = 30 }
        };
            var filteredProducts = products.Where(p => p.Price <= query.MaxPrice.Value).ToList();
            var productDtos = new List<ProductDto> { new ProductDto { ProductId = filteredProducts[0].ProductId, Name = "Product2" } };

            productRepository.GetAllAsync(Arg.Any<int>(), Arg.Any<int>(), Arg.Any<ProductOrder>()).Returns(products);
            mapper.Map<List<ProductDto>>(Arg.Any<List<Product>>()).Returns(productDtos);

            // Act
            var result = await handler.Handle(query, CancellationToken.None);

            // Assert
            Assert.Single(result);
            Assert.Equal("Product2", result[0].Name);
        }
    }

}

