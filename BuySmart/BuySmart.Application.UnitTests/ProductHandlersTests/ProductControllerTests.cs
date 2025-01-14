using Application.Commands.ProductCommands;
using Application.DTOs;
using Application.Queries.ProductQueries;
using Application.Utils;
using BuySmart.Controllers;
using Domain.Common;
using MediatR;
using Microsoft.AspNetCore.Mvc;
using NSubstitute;

namespace BuySmart.UnitTests
{
    public class ProductControllerTests
    {
        private readonly IMediator _mediator;
        private readonly ProductController _controller;

        public ProductControllerTests()
        {
            _mediator = Substitute.For<IMediator>();
            _controller = new ProductController(_mediator);
        }

        [Fact]
        public async Task GetAllProducts_ShouldReturnOk()
        {
            var products = new List<ProductDto>
            {
                new ProductDto
                {
                    ProductId = Guid.NewGuid(),
                    Name = "Product 1",
                    Description = "Description 1",
                    Price = 10.0m,
                    Stock = 100,
                    Rating = 4.5,
                    Categories = new List<CategoryDto>()
                },
                new ProductDto
                {
                    ProductId = Guid.NewGuid(),
                    Name = "Product 2",
                    Description = "Description 2",
                    Price = 20.0m,
                    Stock = 200,
                    Rating = 4.0,
                    Categories = new List<CategoryDto>()
                }
            };
            _mediator.Send(Arg.Any<GetAllProductsQuery>()).Returns(products);

            var response = await _controller.GetAllProducts();

            var actionResult = Assert.IsType<OkObjectResult>(response);
            Assert.Equal(products, actionResult.Value);
        }


        [Fact]
        public async Task GetFilteredProducts_ShouldReturnNotFound_WhenFailed()
        {
            var result = Result<PagedResult<ProductDto>>.Failure("Error");
            _mediator.Send(Arg.Any<GetFilteredProductsQuery>()).Returns(result);

            var response = await _controller.GetFilteredProducts(1, 10, null, null, null, null, null);

            var actionResult = Assert.IsType<NotFoundObjectResult>(response.Result);
            Assert.Equal(result.ErrorMessage, actionResult.Value);
        }

       

        [Fact]
        public async Task CreateProduct_ShouldReturnCreated()
        {
            var command = new CreateProductCommand
            {
                Name = "Product 1",
                Description = "Description 1",
                Price = 10.0m,
                Stock = 100,
                Rating = 4.5,
                Image = "image_data",
                BusinessId = Guid.NewGuid(),
                CategoryNames = new List<string> { "Category 1" }
            };
            var result = Result<Guid>.Success(Guid.NewGuid());
            _mediator.Send(command).Returns(result);

            var response = await _controller.CreateProduct(command);

            var actionResult = Assert.IsType<CreatedAtActionResult>(response.Result);
            Assert.Equal(result.Data, actionResult.Value);
        }

        [Fact]
        public async Task CreateProduct_ShouldReturnBadRequest_WhenFailed()
        {
            var command = new CreateProductCommand
            {
                Name = "Product 1",
                Description = "Description 1",
                Price = 10.0m,
                Stock = 100,
                Rating = 4.5,
                Image = "image_data",
                BusinessId = Guid.NewGuid(),
                CategoryNames = new List<string> { "Category 1" }
            };
            var result = Result<Guid>.Failure("Error");
            _mediator.Send(command).Returns(result);

            var response = await _controller.CreateProduct(command);

            var actionResult = Assert.IsType<BadRequestObjectResult>(response.Result);
            Assert.Equal(result.ErrorMessage, actionResult.Value);
        }

        [Fact]
        public async Task UpdateProduct_ShouldReturnNoContent()
        {
            var productId = Guid.NewGuid();
            var command = new UpdateProductCommand
            {
                ProductId = productId,
                Name = "Updated Product",
                Description = "Updated Description",
                Price = 20.0m,
                Stock = 200,
                Rating = 4.0,
                Image = "updated_image_data",
                BusinessId = Guid.NewGuid()
            };
            var result = Result<object>.Success(null);
            _mediator.Send(command).Returns(result);

            var response = await _controller.UpdateProduct(productId, command);

            Assert.IsType<NoContentResult>(response.Result);
        }

        [Fact]
        public async Task UpdateProduct_ShouldReturnBadRequest_WhenIdMismatch()
        {
            var productId = Guid.NewGuid();
            var command = new UpdateProductCommand
            {
                ProductId = Guid.NewGuid(),
                Name = "Updated Product",
                Description = "Updated Description",
                Price = 20.0m,
                Stock = 200,
                Rating = 4.0,
                Image = "updated_image_data",
                BusinessId = Guid.NewGuid()
            };

            var response = await _controller.UpdateProduct(productId, command);

            Assert.IsType<BadRequestResult>(response.Result);
        }

        [Fact]
        public async Task UpdateProduct_ShouldReturnBadRequest_WhenFailed()
        {
            var productId = Guid.NewGuid();
            var command = new UpdateProductCommand
            {
                ProductId = productId,
                Name = "Updated Product",
                Description = "Updated Description",
                Price = 20.0m,
                Stock = 200,
                Rating = 4.0,
                Image = "updated_image_data",
                BusinessId = Guid.NewGuid()
            };
            var result = Result<object>.Failure("Error");
            _mediator.Send(command).Returns(result);

            var response = await _controller.UpdateProduct(productId, command);

            var actionResult = Assert.IsType<BadRequestObjectResult>(response.Result);
            Assert.Equal(result.ErrorMessage, actionResult.Value);
        }

        [Fact]
        public async Task DeleteProductById_ShouldReturnNoContent()
        {
            var productId = Guid.NewGuid();

            var response = await _controller.DeleteProductById(productId);

            Assert.IsType<NoContentResult>(response);
        }
    }
}


