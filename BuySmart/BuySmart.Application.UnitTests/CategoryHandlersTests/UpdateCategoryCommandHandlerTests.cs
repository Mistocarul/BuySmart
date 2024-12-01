using Application.CommandHandlers.CategoryCommandHandlers;
using Application.Commands.CategoryCommands;
using AutoMapper;
using Domain.Common;
using Domain.Entities;
using Domain.Repositories;
using NSubstitute;

namespace BuySmart.Application.UnitTests.CategoryHandlersTests
{
    public class UpdateCategoryCommandHandlerTests
    {
        private readonly ICategoryRepository categoryRepository;
        private readonly IMapper mapper;
        private readonly UpdateCategoryCommandHandler handler;

        public UpdateCategoryCommandHandlerTests()
        {
            categoryRepository = Substitute.For<ICategoryRepository>();
            mapper = Substitute.For<IMapper>();
            handler = new UpdateCategoryCommandHandler(categoryRepository, mapper);
        }

        [Fact]
        public async Task Handle_ShouldReturnSuccessResult_WhenCategoryIsUpdated()
        {
            // Arrange
            var command = new UpdateCategoryCommand
            {
                CategoryId = Guid.NewGuid(),
                Name = "Updated Category",
                Description = "Updated Description"
            };

            var category = new Category
            {
                CategoryId = command.CategoryId,
                Name = command.Name,
                Description = command.Description
            };

            var result = Result<object>.Success(new object());

            mapper.Map<Category>(command).Returns(category);
            categoryRepository.UpdateAsync(category).Returns(result);

            // Act
            var response = await handler.Handle(command, CancellationToken.None);

            // Assert
            Assert.True(response.IsSuccess);
            Assert.Equal(result.Data, response.Data);
        }

        
        [Fact]
        public async Task Handle_ShouldReturnFailure_WhenCategoryUpdateFails()
        {
            // Arrange
            var command = new UpdateCategoryCommand
            {
                CategoryId = Guid.NewGuid(),
                Name = "Updated Category",
                Description = "Updated Description"
            };
            
            var category = new Category
            {
                CategoryId = command.CategoryId,
                Name = command.Name,
                Description = command.Description
            };

            var result = Result<object>.Failure("Error updating business");

            mapper.Map<Category>(command).Returns(category);
            categoryRepository.UpdateAsync(category).Returns(result);

            // Act
            var response = await handler.Handle(command, CancellationToken.None);

            // Assert
            Assert.False(response.IsSuccess);
            Assert.Equal(result.ErrorMessage, response.ErrorMessage);
        }
    }
}


