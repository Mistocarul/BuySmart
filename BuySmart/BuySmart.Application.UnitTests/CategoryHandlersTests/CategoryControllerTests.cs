using Application.Commands.CategoryCommands;
using Application.DTOs;
using Application.Queries.CategoryQueries;
using Application.Utils;
using BuySmart.Controllers;
using Domain.Common;
using MediatR;
using Microsoft.AspNetCore.Mvc;
using NSubstitute;

namespace BuySmart.UnitTests
{
    public class CategoryControllerTests
    {
        private readonly IMediator _mediator;
        private readonly CategoryController _controller;

        public CategoryControllerTests()
        {
            _mediator = Substitute.For<IMediator>();
            _controller = new CategoryController(_mediator);
        }

        [Fact]
        public async Task GetAllCategories_ShouldReturnOk()
        {
            var categories = new List<CategoryDto>
            {
                new CategoryDto { CategoryId = Guid.NewGuid(), Name = "Category 1", Description = "Description 1" },
                new CategoryDto { CategoryId = Guid.NewGuid(), Name = "Category 2", Description = "Description 2" }
            };
            _mediator.Send(Arg.Any<GetAllCategoriesQuery>()).Returns(categories);

            var response = await _controller.GetAllCategories();

            var actionResult = Assert.IsType<OkObjectResult>(response);
            Assert.Equal(categories, actionResult.Value);
        }

        

        [Fact]
        public async Task GetPaginatedCategories_ShouldReturnNotFound_WhenFailed()
        {
            var result = Result<PagedResult<CategoryDto>>.Failure("Error");
            _mediator.Send(Arg.Any<GetFilteredCategoriesQuery>()).Returns(result);

            var response = await _controller.GetFilteredCategories(1, 10, "test");

            var actionResult = Assert.IsType<NotFoundObjectResult>(response.Result);
            Assert.Equal(result.ErrorMessage, actionResult.Value);
        }

       

        [Fact]
        public async Task CreateCategory_ShouldReturnCreated()
        {
            var command = new CreateCategoryCommand
            {
                Name = "Category 1",
                Description = "Description 1"
            };
            var result = Result<Guid>.Success(Guid.NewGuid());
            _mediator.Send(command).Returns(result);

            var response = await _controller.CreateCategory(command);

            var actionResult = Assert.IsType<CreatedAtActionResult>(response.Result);
            Assert.Equal(result.Data, actionResult.Value);
        }

        [Fact]
        public async Task CreateCategory_ShouldReturnBadRequest_WhenFailed()
        {
            var command = new CreateCategoryCommand
            {
                Name = "Category 1",
                Description = "Description 1"
            };
            var result = Result<Guid>.Failure("Error");
            _mediator.Send(command).Returns(result);

            var response = await _controller.CreateCategory(command);

            var actionResult = Assert.IsType<BadRequestObjectResult>(response.Result);
            Assert.Equal(result.ErrorMessage, actionResult.Value);
        }
       
        [Fact]
        public async Task UpdateCategory_ShouldReturnBadRequest_WhenFailed()
        {
            // Arrange
            var command = new UpdateCategoryCommand
            {
                CategoryId = Guid.NewGuid(),
                Name = "Updated Category",
                Description = "Updated Description"
            };

            // Simulăm un eșec al comenzii
            var result = Result<object>.Failure("Error");
            _mediator.Send(command).Returns(result);

            // Act
            var response = await _controller.UpdateCategory(command.CategoryId, command);

            // Assert
            var actionResult = Assert.IsType<ActionResult<Result<object>>>(response);

            // Verificăm că rezultatul este de tip BadRequestObjectResult
            var badRequestResult = Assert.IsType<BadRequestObjectResult>(actionResult.Result);

            // Verificăm mesajul de eroare
            Assert.Equal(result.ErrorMessage, badRequestResult.Value);
        }


        [Fact]
        public async Task DeleteCategoryById_ShouldReturnNoContent()
        {
            var categoryId = Guid.NewGuid();

            var response = await _controller.DeleteCategoryById(categoryId);

            Assert.IsType<NoContentResult>(response);
        }
    }
}



