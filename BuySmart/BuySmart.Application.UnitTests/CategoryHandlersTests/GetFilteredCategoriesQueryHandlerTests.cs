using System.Linq.Expressions;
using Application.DTOs;
using Application.Queries.CategoryQueries;
using Application.QueryHandlers.CategoryQueryHandlers;
using AutoMapper;
using Domain.Entities;
using Domain.Repositories;
using FluentAssertions;
using NSubstitute;
using Xunit;

namespace Application.UnitTests.QueryHandlers.CategoryQueryHandlers
{
    public class GetFilteredCategoriesQueryHandlerTests
    {
        private readonly ICategoryRepository _categoryRepository;
        private readonly IMapper _mapper;
        private readonly GetFilteredcategoriesQueryHandler _handler;

        public GetFilteredCategoriesQueryHandlerTests()
        {
            _categoryRepository = Substitute.For<ICategoryRepository>();
            _mapper = Substitute.For<IMapper>();
            _handler = new GetFilteredcategoriesQueryHandler(_categoryRepository, _mapper);
        }

        [Fact]
        public async Task Handle_WithFilter_ShouldReturnFilteredCategories()
        {
            // Arrange
            var categories = new List<Category>
            {
                new Category { CategoryId = Guid.NewGuid(), Name = "Category 1" },
                new Category { CategoryId = Guid.NewGuid(), Name = "Category 2" }
            };
            _categoryRepository.GetAllAsync().Returns(categories);

            Expression<Func<Category, bool>> filter = c => c.Name.Contains("1");
            var query = new GetFilteredCategoriesQuery
            {
                Page = 1,
                PageSize = 10,
                Filter = filter
            };

            var filteredCategories = categories.AsQueryable().Where(filter).ToList();
            var categoryDtos = new List<CategoryDto>
            {
                new CategoryDto { Name = "Category 1" }
            };
            _mapper.Map<List<CategoryDto>>(Arg.Any<IEnumerable<Category>>()).Returns(categoryDtos);

            // Act
            var result = await _handler.Handle(query, CancellationToken.None);

            // Assert
            result.IsSuccess.Should().BeTrue();
            result.Data.TotalCount.Should().Be(filteredCategories.Count);
            result.Data.Data.Should().BeEquivalentTo(categoryDtos);
        }

        [Fact]
        public async Task Handle_WithoutFilter_ShouldReturnAllCategories()
        {
            // Arrange
            var categories = new List<Category>
            {
                new Category { CategoryId = Guid.NewGuid(), Name = "Category 1" },
                new Category { CategoryId = Guid.NewGuid(), Name = "Category 2" }
            };
            _categoryRepository.GetAllAsync().Returns(categories);

            var query = new GetFilteredCategoriesQuery
            {
                Page = 1,
                PageSize = 10,
                Filter = null
            };

            var categoryDtos = new List<CategoryDto>
            {
                new CategoryDto { Name = "Category 1" },
                new CategoryDto { Name = "Category 2" }
            };
            _mapper.Map<List<CategoryDto>>(Arg.Any<IEnumerable<Category>>()).Returns(categoryDtos);

            // Act
            var result = await _handler.Handle(query, CancellationToken.None);

            // Assert
            result.IsSuccess.Should().BeTrue();
            result.Data.TotalCount.Should().Be(categories.Count);
            result.Data.Data.Should().BeEquivalentTo(categoryDtos);
        }

        [Fact]
        public async Task Handle_WithPaging_ShouldReturnPagedCategories()
        {
            // Arrange
            var categories = new List<Category>
            {
                new Category { CategoryId = Guid.NewGuid(), Name = "Category 1" },
                new Category { CategoryId = Guid.NewGuid(), Name = "Category 2" },
                new Category { CategoryId = Guid.NewGuid(), Name = "Category 3" }
            };
            _categoryRepository.GetAllAsync().Returns(categories);

            var query = new GetFilteredCategoriesQuery
            {
                Page = 1,
                PageSize = 2,
                Filter = null
            };

            var pagedCategories = categories.Take(2).ToList();
            var categoryDtos = new List<CategoryDto>
            {
                new CategoryDto { Name = "Category 1" },
                new CategoryDto { Name = "Category 2" }
            };
            _mapper.Map<List<CategoryDto>>(Arg.Any<IEnumerable<Category>>()).Returns(categoryDtos);

            // Act
            var result = await _handler.Handle(query, CancellationToken.None);

            // Assert
            result.IsSuccess.Should().BeTrue();
            result.Data.TotalCount.Should().Be(categories.Count);
            result.Data.Data.Should().BeEquivalentTo(categoryDtos);
        }
    }
}
