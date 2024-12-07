using Application.CommandHandlers.CategoryCommandHandlers;
using Application.Commands.CategoryCommands;
using Domain.Entities;
using Domain.Repositories;
using NSubstitute;

namespace BuySmart.Application.UnitTests.CategoryHandlersTests
{
    public class DeleteCategoryCommandHandlerTests
    {
        private readonly ICategoryRepository categoryRepository;
        private readonly DeleteCategoryCommandHandler handler;

        public DeleteCategoryCommandHandlerTests()
        {
            categoryRepository = Substitute.For<ICategoryRepository>();
            handler = new DeleteCategoryCommandHandler(categoryRepository);
        }

        [Fact]
        public async Task Handle_ShouldReturnSuccessResult_WhenCategoryIsDeleted()
        {
            // Arrange
            var command = new DeleteCategoryCommand
            {
                CategoryId = Guid.NewGuid()
            };

            categoryRepository.GetByIdAsync(command.CategoryId).Returns(new Category { CategoryId = command.CategoryId });
            categoryRepository.DeleteAsync(command.CategoryId).Returns(Task.CompletedTask);

            // Act
            var result = await handler.Handle(command, CancellationToken.None);

            // Assert
            Assert.True(result.IsSuccess);
            Assert.Null(result.ErrorMessage);
        }

        [Fact]
        public async Task Handle_ShouldReturnFailureResult_WhenCategoryDeletionFails()
        {
            // Arrange
            var command = new DeleteCategoryCommand
            {
                CategoryId = Guid.NewGuid()
            };

            categoryRepository.GetByIdAsync(command.CategoryId).Returns(Task.FromResult<Category>(null!));

            // Act
            var result = await handler.Handle(command, CancellationToken.None);

            // Assert
            Assert.False(result.IsSuccess);
            Assert.Equal("Category not found", result.ErrorMessage);
            
        }
    }
}
