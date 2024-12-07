using Application.QueryHandlers.CategoryQueryHandlers;
using Application.Queries.CategoryQueries;
using AutoMapper;
using Domain.Entities;
using Domain.Repositories;
using NSubstitute;
using Application.DTOs;

namespace BuySmart.Application.UnitTests.CategoryHandlersTests
{
    public class GetAllCategoriesQueryHandlerTests
    {
        private readonly ICategoryRepository categoryRepository;
        private readonly IMapper mapper;
        private readonly GetAllCategoriesQueryHandler handler;

        public GetAllCategoriesQueryHandlerTests()
        {
            categoryRepository = Substitute.For<ICategoryRepository>();
            mapper = Substitute.For<IMapper>();
            handler = new GetAllCategoriesQueryHandler(categoryRepository, mapper);
        }

        [Fact]
        public async Task Handle_ShouldReturnListOfCategoryDtos_WhenCategoriesExist()
        {
            // Arrange
            var categories = new List<Category>
            {
                new Category
                {
                    CategoryId = Guid.NewGuid(),
                    Name = "Category 1",
                    Description = "Description 1"
                },
                new Category
                {
                    CategoryId = Guid.NewGuid(),
                    Name = "Category 2",
                    Description = "Description 2"
                }
            };

            var categoryDtos = new List<CategoryDto>
            {
                new CategoryDto
                {
                    CategoryId = categories[0].CategoryId,
                    Name = categories[0].Name,
                    Description = categories[0].Description
                },
                new CategoryDto
                {
                    CategoryId = categories[1].CategoryId,
                    Name = categories[1].Name,
                    Description = categories[1].Description
                }
            };

            categoryRepository.GetAllAsync(1, 10).Returns(categories);
            mapper.Map<List<CategoryDto>>(categories).Returns(categoryDtos);

            var query = new GetAllCategoriesQuery { PageNumber = 1, PageSize = 10 };
            var response = await handler.Handle(query, CancellationToken.None);

            // Assert
            Assert.Equal(categoryDtos.Count, response.Count);
            Assert.Equal(categoryDtos[0].CategoryId, response[0].CategoryId);
            Assert.Equal(categoryDtos[1].CategoryId, response[1].CategoryId);
            await categoryRepository.Received(1).GetAllAsync(1, 10);
        }

        [Fact]
        public async Task Handle_ShouldReturnEmptyList_WhenNoCategoriesExist()
        {
            // Arrange
            var categories = new List<Category>();
            var categoryDtos = new List<CategoryDto>();

            categoryRepository.GetAllAsync(1, 10).Returns(categories);
            mapper.Map<List<CategoryDto>>(categories).Returns(categoryDtos);

            var query = new GetAllCategoriesQuery { PageNumber = 1, PageSize = 10 };
            var response = await handler.Handle(query, CancellationToken.None);

            // Assert
            Assert.Empty(response);
            await categoryRepository.Received(1).GetAllAsync(1, 10);
        }
    }
}

