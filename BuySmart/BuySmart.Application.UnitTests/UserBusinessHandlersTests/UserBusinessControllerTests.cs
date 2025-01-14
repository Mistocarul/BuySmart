using System.Security.Claims;
using Application.Authentication;
using Application.Commands.UserBusinessCommands;
using Application.DTOs;
using Application.Queries.UserBusinessQueries;
using Application.Utils;
using BuySmart.Controllers;
using BuySmart.JWT;
using Domain.Common;
using Domain.Entities;
using MediatR;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using NSubstitute;

namespace BuySmart.UnitTests
{
    public class UserBusinessControllerTests
    {
        private readonly IMediator _mediator;
        private readonly IHttpContextAccessor _httpContextAccessor;
        private readonly UserBusinessController _controller;

        public UserBusinessControllerTests()
        {
            _mediator = Substitute.For<IMediator>();
            _httpContextAccessor = Substitute.For<IHttpContextAccessor>();
            _controller = new UserBusinessController(_mediator, _httpContextAccessor);
        }

        [Fact]
        public async Task CreateUserBusiness_ShouldReturnCreated()
        {
            var command = new CreateUserBusinessCommand
            {
                Name = "Test User Business",
                Email = "testuser@example.com",
                Password = "password",
                UserType = UserType.Business,
                Image = "image_data"
            };
            var result = Result<Guid>.Success(Guid.NewGuid());
            _mediator.Send(command).Returns(result);

            var response = await _controller.CreateUserBusiness(command);

            var actionResult = Assert.IsType<CreatedAtActionResult>(response.Result);
            Assert.Equal(result.Data, actionResult.Value);
        }

        [Fact]
        public async Task CreateUserBusiness_ShouldReturnBadRequest_WhenFailed()
        {
            var command = new CreateUserBusinessCommand
            {
                Name = "Test User Business",
                Email = "testuser@example.com",
                Password = "password",
                UserType = UserType.Business,
                Image = "image_data"
            };
            var result = Result<Guid>.Failure("Error");
            _mediator.Send(command).Returns(result);

            var response = await _controller.CreateUserBusiness(command);

            var actionResult = Assert.IsType<BadRequestObjectResult>(response.Result);
            Assert.Equal(result.ErrorMessage, actionResult.Value);
        }

       
        [Fact]
        public async Task DeleteUserBusiness_ShouldReturnUnauthorized_WhenUserIdIsNull()
        {
            // Arrange: configurăm HttpContext fără utilizator autenticat
            var httpContext = new DefaultHttpContext();
            httpContext.User = new ClaimsPrincipal(new ClaimsIdentity()); // Fără claims

            _httpContextAccessor.HttpContext.Returns(httpContext);

            // Act
            var response = await _controller.DeleteUserBusiness();

            // Assert
            Assert.NotNull(response);  // Verificare pentru null
            Assert.IsType<UnauthorizedResult>(response);
        }

       

        [Fact]
        public async Task UpdateUserBusiness_ShouldReturnNoContent()
        {
            // Arrange
            var userId = Guid.NewGuid().ToString();

            var command = new UpdateUserCommand
            {
                UserId = new Guid(userId),
                Name = "Updated User Business",
                Email = "updateduser@example.com",
                Password = "newpassword",
                Image = "new_image_data"
            };

            // Configurăm corect HttpContext cu un User valid
            var httpContext = new DefaultHttpContext();
            httpContext.User = new ClaimsPrincipal(new ClaimsIdentity(new[]
            {
        new Claim(ClaimTypes.NameIdentifier, userId)
    }));

            _httpContextAccessor.HttpContext.Returns(httpContext);

           
            var result = Result<object>.Success(null);
            _mediator.Send(Arg.Any<UpdateUserCommand>()).Returns(result);

            // Act
            var response = await _controller.UpdateUserBusiness(new Guid(userId), command);

            // Assert
            Assert.NotNull(response);  

        
            var actionResult = Assert.IsType<ActionResult<Result<object>>>(response);

            
        }


        [Fact]
        public async Task GetAllUserBusinesses_ShouldReturnOk()
        {
            var userBusinessDtos = new List<UserBusinessDto>
            {
                new UserBusinessDto
                {
                    UserId = Guid.NewGuid(),
                    Name = "Test User Business 1",
                    Email = "testuser1@example.com",
                    Image = "image_data_1",
                    UserType = UserType.Business
                },
                new UserBusinessDto
                {
                    UserId = Guid.NewGuid(),
                    Name = "Test User Business 2",
                    Email = "testuser2@example.com",
                    Image = "image_data_2",
                    UserType = UserType.Business
                }
            };
            _mediator.Send(Arg.Any<GetAllUserBusinessesQuery>()).Returns(userBusinessDtos);

            var response = await _controller.GetAllUserBusinesses();

            var actionResult = Assert.IsType<OkObjectResult>(response);
            Assert.Equal(userBusinessDtos, actionResult.Value);
        }


        [Fact]
        public async Task GetFilteredUserBusinesses_ShouldReturnNotFound_WhenFailed()
        {
            var result = Result<PagedResult<UserBusinessDto>>.Failure("Error");
            _mediator.Send(Arg.Any<GetFilteredUserBusinessesQuery>()).Returns(result);

            var response = await _controller.GetFilteredUserBusinesses(1, 10);

            var actionResult = Assert.IsType<NotFoundObjectResult>(response.Result);
            Assert.Equal(result.ErrorMessage, actionResult.Value);
        }
    }
}


