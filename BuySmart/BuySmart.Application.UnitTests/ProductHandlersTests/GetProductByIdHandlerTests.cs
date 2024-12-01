using System;
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
    public class GetProductByIdHandlerTests
    {
        private readonly IProductRepository repository;
        private readonly IMapper mapper;
        private readonly GetProductByIdHandler handler;

        public GetProductByIdHandlerTests()
        {
            repository = Substitute.For<IProductRepository>();
            mapper = Substitute.For<IMapper>();
            handler = new GetProductByIdHandler(mapper, repository);
        }

        [Fact]
        public async Task Handle_ShouldReturnProductDto_WhenProductExists()
        {
            // Arrange
            var query = new GetProductByIdQuery { ProductId = Guid.NewGuid() };
            var product = new Product { ProductId = query.ProductId, Name = "Product1" };
            var productDto = new ProductDto { ProductId = query.ProductId, Name = "Product1" };

            repository.GetByIdAsync(query.ProductId).Returns(product);
            mapper.Map<ProductDto>(product).Returns(productDto);

            // Act
            var result = await handler.Handle(query, CancellationToken.None);

            // Assert
            Assert.Equal(productDto, result);
        }

        [Fact]
        public async Task Handle_ShouldReturnNull_WhenProductDoesNotExist()
        {
            // Arrange
            var query = new GetProductByIdQuery { ProductId = Guid.NewGuid() };

            repository.GetByIdAsync(query.ProductId).Returns(Task.FromResult<Product>(null!));

            // Act
            var result = await handler.Handle(query, CancellationToken.None);

            // Assert
            Assert.Null(result);
        }
    }

}

