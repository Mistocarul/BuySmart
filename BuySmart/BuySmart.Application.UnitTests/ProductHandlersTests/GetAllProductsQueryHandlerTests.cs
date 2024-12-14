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
            var query = new GetAllProductsQuery { };
            var products = new List<Product> { new Product { ProductId = Guid.NewGuid(), Name = "Product1" } };
            var productDtos = new List<ProductDto> { new ProductDto { ProductId = products[0].ProductId, Name = "Product1" } };

            productRepository.GetAllAsync();
            mapper.Map<List<ProductDto>>(Arg.Any<List<Product>>()).Returns(productDtos);

            // Act
            var result = await handler.Handle(query, CancellationToken.None);

            // Assert
            Assert.Equal(productDtos, result);
        }
    }
}
