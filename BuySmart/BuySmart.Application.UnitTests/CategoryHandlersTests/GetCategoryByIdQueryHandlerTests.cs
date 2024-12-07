using Application.QueryHandlers.CategoryQueryHandlers;
using Application.Queries.CategoryQueries;
using AutoMapper;
using Domain.Entities;
using Domain.Repositories;
using NSubstitute;
using Application.DTOs;

namespace BuySmart.Application.UnitTests.CategoryHandlersTests
{
    public class GetCategoryByIdQueryHandlerTests
    {
        private readonly ICategoryRepository categoryRepository;
        private readonly IMapper mapper;
        private readonly GetCategoryByIdQueryHandler handler;

        public GetCategoryByIdQueryHandlerTests()
        {
            categoryRepository = Substitute.For<ICategoryRepository>();
            mapper = Substitute.For<IMapper>();
            handler = new GetCategoryByIdQueryHandler(categoryRepository, mapper);
        }

        [Fact]
        public async Task Handle_ShouldReturnCategoryDto_WhenCategoryExists()
        {
            // Arrange
            var categoryId = Guid.NewGuid();
            var category = new Category
            {
                CategoryId = categoryId,
                Name = "Test Category",
                Description = "Test Description"
            };

            var categoryDto = new CategoryDto
            {
                CategoryId = category.CategoryId,
                Name = category.Name,
                Description = category.Description
            };

            categoryRepository.GetByIdAsync(categoryId).Returns(category);
            mapper.Map<CategoryDto>(category).Returns(categoryDto);

            var query = new GetCategoryByIdQuery { CategoryId = categoryId };
            var response = await handler.Handle(query, CancellationToken.None);

            // Assert
            Assert.Equal(categoryDto, response);
        }

        [Fact]
        public async Task Handle_ShouldThrowKeyNotFoundException_WhenCategoryDoesNotExist()
        {
            // Arrange
            var query = new GetCategoryByIdQuery { CategoryId = Guid.NewGuid() };
            categoryRepository.GetByIdAsync(query.CategoryId).Returns(Task.FromResult<Category>(null!)); ;


            // Act
            var result = await handler.Handle(query, CancellationToken.None);

            // Assert
            Assert.Null(result);

        }
    }
}


