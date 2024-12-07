using Application.CommandHandlers.ProductCommandHandlers;
using Application.Commands.ProductCommands;
using AutoMapper;
using Domain.Common;
using Domain.Entities;
using Domain.Repositories;
using NSubstitute;

namespace Application.UnitTests.ProductHandlersTests
{
    public class UpdateProductCommandHandlerTests
    {
        private readonly IMapper mapper;
        private readonly IProductRepository repository;
        private readonly UpdateProductCommandHandler handler;

        public UpdateProductCommandHandlerTests()
        {
            mapper = Substitute.For<IMapper>();
            repository = Substitute.For<IProductRepository>();
            handler = new UpdateProductCommandHandler(mapper, repository);
        }

        [Fact]
        public async Task Handle_ShouldReturnFailure_WhenProductDoesNotExist()
        {
            // Arrange
            var command = new UpdateProductCommand { ProductId = Guid.NewGuid() };
            repository.GetByIdAsync(command.ProductId).Returns(Task.FromResult<Product>(null!));

            // Act
            var result = await handler.Handle(command, CancellationToken.None);

            // Assert
            Assert.False(result.IsSuccess);
            Assert.Equal("Product not found", result.ErrorMessage);
        }

        [Fact]
        public async Task Handle_ShouldReturnSuccess_WhenProductIsUpdatedSuccessfully()
        {
            // Arrange
            var command = new UpdateProductCommand { ProductId = Guid.NewGuid(), Name = "Updated Product" };
            var product = new Product { ProductId = command.ProductId, Name = "Old Product" };
            var updatedProduct = new Product { ProductId = command.ProductId, Name = "Updated Product" };

            repository.GetByIdAsync(command.ProductId).Returns(product);
            mapper.Map<Product>(command).Returns(updatedProduct);
            repository.UpdateAsync(updatedProduct).Returns(Result<object>.Success(updatedProduct));

            // Act
            var result = await handler.Handle(command, CancellationToken.None);

            // Assert
            Assert.True(result.IsSuccess);
            Assert.Equal(updatedProduct, result.Data);
        }

        [Fact]
        public async Task Handle_ShouldReturnFailure_WhenProductUpdateFails()
        {
            // Arrange
            var command = new UpdateProductCommand { ProductId = Guid.NewGuid(), Name = "Updated Product" };
            var product = new Product { ProductId = command.ProductId, Name = "Old Product" };
            var updatedProduct = new Product { ProductId = command.ProductId, Name = "Updated Product" };

            repository.GetByIdAsync(command.ProductId).Returns(product);
            mapper.Map<Product>(command).Returns(updatedProduct);
            repository.UpdateAsync(updatedProduct).Returns(Result<object>.Failure("Update failed"));

            // Act
            var result = await handler.Handle(command, CancellationToken.None);

            // Assert
            Assert.False(result.IsSuccess);
            Assert.Equal("Update failed", result.ErrorMessage);
        }
    }
}
