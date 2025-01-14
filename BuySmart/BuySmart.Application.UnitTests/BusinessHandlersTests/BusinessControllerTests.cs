using Application.Commands.BusinessCommands;
using Application.DTOs;
using Application.Queries.BusinessQueries;
using Application.Utils;
using BuySmart.Controllers;
using Domain.Common;
using MediatR;
using Microsoft.AspNetCore.Mvc;
using NSubstitute;

namespace BuySmart.UnitTests
{
    public class BusinessControllerTests
    {
        private readonly IMediator _mediator;
        private readonly BusinessController _controller;

        public BusinessControllerTests()
        {
            _mediator = Substitute.For<IMediator>();
            _controller = new BusinessController(_mediator);
        }

        [Fact]
        public async Task GetAllBusinesses_ShouldReturnOk()
        {
            var businesses = new List<BusinessDto>
            {
                new BusinessDto { Name = "Business 1", Description = "Description 1", Address = "Address 1", PhoneNumber = "1234567890", UserBusinessId = Guid.NewGuid() },
                new BusinessDto { Name = "Business 2", Description = "Description 2", Address = "Address 2", PhoneNumber = "0987654321", UserBusinessId = Guid.NewGuid() }
            };
            _mediator.Send(Arg.Any<GetAllBusinessesQuery>()).Returns(businesses);

            var response = await _controller.GetAllBusinesses();

            var actionResult = Assert.IsType<OkObjectResult>(response);
            Assert.Equal(businesses, actionResult.Value);
        }

        

        [Fact]
        public async Task GetPaginatedBusinesses_ShouldReturnNotFound_WhenFailed()
        {
            var result = Result<PagedResult<BusinessDto>>.Failure("Error");
            _mediator.Send(Arg.Any<GetFilteredBusinessesQuery>()).Returns(result);

            var response = await _controller.GetFilteredBusinesses(1, 10, "test");

            var actionResult = Assert.IsType<NotFoundObjectResult>(response.Result);
            Assert.Equal(result.ErrorMessage, actionResult.Value);
        }

        
        [Fact]
        public async Task CreateBusiness_ShouldReturnCreated()
        {
            var command = new CreateBusinessCommand
            {
                Name = "Business 1",
                Description = "Description 1",
                Address = "Address 1",
                PhoneNumber = "1234567890",
                UserBusinessId = Guid.NewGuid()
            };
            var result = Result<Guid>.Success(Guid.NewGuid());
            _mediator.Send(command).Returns(result);

            var response = await _controller.CreateBusiness(command);

            var actionResult = Assert.IsType<CreatedAtActionResult>(response.Result);
            Assert.Equal(result.Data, actionResult.Value);
        }

        [Fact]
        public async Task CreateBusiness_ShouldReturnBadRequest_WhenFailed()
        {
            var command = new CreateBusinessCommand
            {
                Name = "Business 1",
                Description = "Description 1",
                Address = "Address 1",
                PhoneNumber = "1234567890",
                UserBusinessId = Guid.NewGuid()
            };
            var result = Result<Guid>.Failure("Error");
            _mediator.Send(command).Returns(result);

            var response = await _controller.CreateBusiness(command);

            var actionResult = Assert.IsType<BadRequestObjectResult>(response.Result);
            Assert.Equal(result.ErrorMessage, actionResult.Value);
        }

        [Fact]
        public async Task UpdateBusiness_ShouldReturnBadRequest_WhenIdMismatch()
        {
            // Arrange
            var command = new UpdateBusinessCommand
            {
                BusinessID = Guid.NewGuid(),      // ID din comandă
                Name = "Updated Business",
                Description = "Updated Description",
                Address = "Updated Address",
                PhoneNumber = "0987654321"
            };

            // Act: folosim un ID diferit pentru a simula neconcordanța
            var response = await _controller.UpdateBusiness(Guid.NewGuid(), command);

            // Assert: verificăm tipul răspunsului
            var actionResult = Assert.IsType<ActionResult<Result<object>>>(response);

            // Verificăm că rezultatul este de tip BadRequestResult
            var badRequestResult = Assert.IsType<BadRequestResult>(actionResult.Result);

            // Verificăm codul de status (400 - Bad Request)
            Assert.Equal(400, badRequestResult.StatusCode);
        }


       

        [Fact]
        public async Task DeleteBusinessById_ShouldReturnNoContent()
        {
            var businessId = Guid.NewGuid();

            var response = await _controller.DeleteBusinessById(businessId);

            Assert.IsType<NoContentResult>(response);
        }
    }
}



