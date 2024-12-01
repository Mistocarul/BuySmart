using Application.CommandHandlers.ProductCommandHandlers;
using Application.Commands.ProductCommands;
using AutoMapper;
using Domain.Common;
using Domain.Entities;
using Domain.Repositories;
using NSubstitute;

namespace Application.UnitTests.ProductHandlersTests
{
    public class CreateProductCommandHandlerTests
    {
        private readonly IMapper mapper;
        private readonly IProductRepository productRepository;
        private readonly ICategoryRepository categoryRepository;
        private readonly CreateProductCommandHandler handler;

        public CreateProductCommandHandlerTests()
        {
            mapper = Substitute.For<IMapper>();
            productRepository = Substitute.For<IProductRepository>();
            categoryRepository = Substitute.For<ICategoryRepository>();
            handler = new CreateProductCommandHandler(mapper, productRepository, categoryRepository);
        }

        [Fact]
        public async Task Handle_ShouldReturnFailure_WhenCategoryDoesNotExist()
        {
            // Arrange
            var command = new CreateProductCommand
            {
                Name = "Test Product",
                Description = "Test Description",
                Price = 10.0m,
                Stock = 5,
                Rating = 4.5,
                Image = "test.jpg",
                BusinessId = Guid.NewGuid(),
                CategoryNames = new List<string> { "NonExistentCategory" }
            };
            categoryRepository.GetByNamesAsync(Arg.Any<List<string>>()).Returns(new List<Category>());

            // Act
            var result = await handler.Handle(command, CancellationToken.None);

            // Assert
            Assert.False(result.IsSuccess);
            Assert.Equal("Category 'NonExistentCategory' does not exist.", result.ErrorMessage);
        }

        [Fact]
        public async Task Handle_ShouldReturnSuccess_WhenProductIsCreatedSuccessfully()
        {
            // Arrange
            var command = new CreateProductCommand
            {
                Name = "Test Product",
                Description = "Test Description",
                Price = 10.0m,
                Stock = 5,
                Rating = 4.5,
                Image = "test.jpg",
                BusinessId = Guid.NewGuid(),
                CategoryNames = new List<string> { "ExistingCategory" }
            };
            var categories = new List<Category> { new Category { Name = "ExistingCategory" } };
            var product = new Product { ProductId = Guid.NewGuid() };
            categoryRepository.GetByNamesAsync(Arg.Any<List<string>>()).Returns(categories);
            mapper.Map<Product>(Arg.Any<CreateProductCommand>()).Returns(product);
            productRepository.AddAsync(Arg.Any<Product>()).Returns(Result<Guid>.Success(product.ProductId));

            // Act
            var result = await handler.Handle(command, CancellationToken.None);

            // Assert
            Assert.True(result.IsSuccess);
            Assert.Equal(product.ProductId, result.Data);
        }

        [Fact]
        public async Task Handle_ShouldReturnFailure_WhenProductCreationFails()
        {
            // Arrange
            var command = new CreateProductCommand
            {
                Name = "Test Product",
                Description = "Test Description",
                Price = 10.0m,
                Stock = 5,
                Rating = 4.5,
                Image = "test.jpg",
                BusinessId = Guid.NewGuid(),
                CategoryNames = new List<string> { "ExistingCategory" }
            };
            var categories = new List<Category> { new Category { Name = "ExistingCategory" } };
            var product = new Product { ProductId = Guid.NewGuid() };
            categoryRepository.GetByNamesAsync(Arg.Any<List<string>>()).Returns(categories);
            mapper.Map<Product>(Arg.Any<CreateProductCommand>()).Returns(product);
            productRepository.AddAsync(Arg.Any<Product>()).Returns(Result<Guid>.Failure("Product creation failed."));

            // Act
            var result = await handler.Handle(command, CancellationToken.None);

            // Assert
            Assert.False(result.IsSuccess);
            Assert.Equal("Product creation failed.", result.ErrorMessage);
        }
    }

}


