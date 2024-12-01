using Application.CommandHandlers.CategoryCommandHandlers;
using Application.Commands.CategoryCommands;
using AutoMapper;
using Domain.Common;
using Domain.Entities;
using Domain.Repositories;
using NSubstitute;

namespace BuySmart.Application.UnitTests.CategoryHandlersTests
{
    public class CreateCategoryCommandHandlerTests
    {
        private readonly ICategoryRepository categoryRepository;
        private readonly IMapper mapper;
        private readonly CreateCategoryCommandHandler handler;

        public CreateCategoryCommandHandlerTests()
        {
            categoryRepository = Substitute.For<ICategoryRepository>();
            mapper = Substitute.For<IMapper>();
            handler = new CreateCategoryCommandHandler(categoryRepository, mapper);
        }

        [Fact]
        public async Task Handle_ShouldReturnSuccessResult_WhenCategoryIsCreated()
        {
            // Arrange
            var command = new CreateCategoryCommand
            {
                Name = "Test Category",
                Description = "Test Description"
            };

            var category = new Category
            {
                CategoryId = Guid.NewGuid(),
                Name = command.Name,
                Description = command.Description
            };

            mapper.Map<Category>(command).Returns(category);
            categoryRepository.AddAsync(category).Returns(Result<Guid>.Success(category.CategoryId));

            // Act
            var result = await handler.Handle(command, CancellationToken.None);

            // Assert
            Assert.True(result.IsSuccess);
            Assert.Equal(category.CategoryId, result.Data);
        }

        [Fact]
        public async Task Handle_ShouldReturnFailureResult_WhenCategoryCreationFails()
        {
            // Arrange
            var command = new CreateCategoryCommand
            {
                Name = "Test Category",
                Description = "Test Description"
            };

            var category = new Category
            {
                CategoryId = Guid.NewGuid(),
                Name = command.Name,
                Description = command.Description
            };

            mapper.Map<Category>(command).Returns(category);
            categoryRepository.AddAsync(category).Returns(Result<Guid>.Failure("Error creating category"));

            // Act
            var result = await handler.Handle(command, CancellationToken.None);

            // Assert
            Assert.False(result.IsSuccess);
            Assert.Equal("Error creating category", result.ErrorMessage);
        }
    }
}
