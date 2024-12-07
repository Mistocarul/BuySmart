using Application.CommandHandlers.ProductCommandHandlers;
using Application.Commands.ProductCommands;
using Domain.Entities;
using Domain.Repositories;
using NSubstitute;

namespace Application.UnitTests.ProductHandlersTests
{
    public class DeleteProductCommandHandlerTests
    {
        private readonly IProductRepository repository;
        private readonly DeleteProductCommandHandler handler;

        public DeleteProductCommandHandlerTests()
        {
            repository = Substitute.For<IProductRepository>();
            handler = new DeleteProductCommandHandler(repository);
        }

        [Fact]
        public async Task Handle_ShouldReturnFailure_WhenProductDoesNotExist()
        {
            // Arrange
            var command = new DeleteProductCommand { ProductId = Guid.NewGuid() };
            repository.GetByIdAsync(Arg.Any<Guid>()).Returns(Task.FromResult<Product>(null!));

            // Act
            var result = await handler.Handle(command, CancellationToken.None);

            // Assert
            Assert.False(result.IsSuccess);
            Assert.Equal("Product not found", result.ErrorMessage);
        }

        [Fact]
        public async Task Handle_ShouldReturnSuccess_WhenProductIsDeletedSuccessfully()
        {
            // Arrange
            var command = new DeleteProductCommand { ProductId = Guid.NewGuid() };
            var product = new Product { ProductId = command.ProductId };
            repository.GetByIdAsync(Arg.Any<Guid>()).Returns(product);

            // Act
            var result = await handler.Handle(command, CancellationToken.None);

            // Assert
            Assert.True(result.IsSuccess);
            await repository.Received(1).DeleteAsync(command.ProductId);
        }
    }

}

