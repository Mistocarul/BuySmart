using System.Linq.Expressions;
using Application.DTOs;
using Application.Queries.ProductQueries;
using Application.QueryHandlers.ProductQueryHandlers;
using AutoMapper;
using Domain.Entities;
using Domain.Repositories;
using FluentAssertions;
using NSubstitute;

namespace Application.Tests.QueryHandlers.ProductQueryHandlers
{
    public class GetFilteredProductsQueryHandlerTests
    {
        private readonly IProductRepository _productRepository;
        private readonly IMapper _mapper;
        private readonly GetFilteredProductsQueryHandler _handler;

        public GetFilteredProductsQueryHandlerTests()
        {
            _productRepository = Substitute.For<IProductRepository>();
            _mapper = Substitute.For<IMapper>();
            _handler = new GetFilteredProductsQueryHandler(_productRepository, _mapper);
        }

        [Fact]
        public async Task Handle_ShouldReturnPagedResult_WhenProductsExist()
        {
            // Arrange
            var products = new List<Product>
            {
                new Product { ProductId = Guid.NewGuid(), Name = "Product1", Price = 10 },
                new Product { ProductId = Guid.NewGuid(), Name = "Product2", Price = 20 }
            };
            _productRepository.GetAllAsync().Returns(products);

            var productDtos = products.Select(p => new ProductDto { ProductId = p.ProductId, Name = p.Name, Price = p.Price }).ToList();
            _mapper.Map<List<ProductDto>>(Arg.Any<IEnumerable<Product>>()).Returns(productDtos);

            var query = new GetFilteredProductsQuery
            {
                Page = 1,
                PageSize = 10,
                Filter = null,
                SortDirection = null
            };
            var cancellationToken = CancellationToken.None;

            // Act
            var result = await _handler.Handle(query, cancellationToken);

            // Assert
            result.IsSuccess.Should().BeTrue();
            result.Data.Data.Should().HaveCount(2);
            result.Data.TotalCount.Should().Be(2);
        }

        [Fact]
        public async Task Handle_ShouldApplyFilter_WhenFilterIsProvided()
        {
            // Arrange
            var products = new List<Product>
            {
                new Product { ProductId = Guid.NewGuid(), Name = "Product1", Price = 10 },
                new Product { ProductId = Guid.NewGuid(), Name = "Product2", Price = 20 }
            };
            _productRepository.GetAllAsync().Returns(products);

            var productDtos = products.Select(p => new ProductDto { ProductId = p.ProductId, Name = p.Name, Price = p.Price }).ToList();
            _mapper.Map<List<ProductDto>>(Arg.Any<IEnumerable<Product>>()).Returns(productDtos);

            Expression<Func<Product, bool>> filter = p => p.Price > 15;
            var query = new GetFilteredProductsQuery
            {
                Page = 1,
                PageSize = 10,
                Filter = filter,
                SortDirection = null
            };
            var cancellationToken = CancellationToken.None;

            // Act
            var result = await _handler.Handle(query, cancellationToken);

            // Assert
            result.IsSuccess.Should().BeTrue();
            result.Data.Data.Should().HaveCount(2);
            result.Data.TotalCount.Should().Be(1);
        }

        [Fact]
        public async Task Handle_ShouldApplySorting_WhenSortDirectionIsProvided()
        {
            // Arrange
            var products = new List<Product>
            {
                new Product { ProductId = Guid.NewGuid(), Name = "Product1", Price = 10 },
                new Product { ProductId = Guid.NewGuid(), Name = "Product2", Price = 20 }
            };
            _productRepository.GetAllAsync().Returns(products);

            var productDtos = products.Select(p => new ProductDto { ProductId = p.ProductId, Name = p.Name, Price = p.Price }).ToList();
            _mapper.Map<List<ProductDto>>(Arg.Any<IEnumerable<Product>>()).Returns(productDtos);

            var query = new GetFilteredProductsQuery
            {
                Page = 1,
                PageSize = 10,
                Filter = null,
                SortDirection = "asc"
            };
            var cancellationToken = CancellationToken.None;

            // Act
            var result = await _handler.Handle(query, cancellationToken);

            // Assert
            result.IsSuccess.Should().BeTrue();
            result.Data.Data.First().Price.Should().Be(10);
        }

        [Fact]
        public async Task Handle_ShouldApplyPaging_WhenPageAndPageSizeAreProvided()
        {
            // Arrange
            var products = new List<Product>
            {
                new Product { ProductId = Guid.NewGuid(), Name = "Product1", Price = 10 },
                new Product { ProductId = Guid.NewGuid(), Name = "Product2", Price = 20 },
                new Product { ProductId = Guid.NewGuid(), Name = "Product3", Price = 30 }
            };
            _productRepository.GetAllAsync().Returns(products);

            var productDtos = products.Select(p => new ProductDto { ProductId = p.ProductId, Name = p.Name, Price = p.Price }).ToList();
            _mapper.Map<List<ProductDto>>(Arg.Any<IEnumerable<Product>>()).Returns(productDtos);

            var query = new GetFilteredProductsQuery
            {
                Page = 1,
                PageSize = 2,
                Filter = null,
                SortDirection = null
            };
            var cancellationToken = CancellationToken.None;

            // Act
            var result = await _handler.Handle(query, cancellationToken);

            // Assert
            result.IsSuccess.Should().BeTrue();
            result.Data.Data.Should().HaveCount(3);
            result.Data.TotalCount.Should().Be(3);
        }
    }
}

