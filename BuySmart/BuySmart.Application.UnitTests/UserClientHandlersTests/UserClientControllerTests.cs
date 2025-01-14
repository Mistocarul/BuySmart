using System.Security.Claims;
using Application.Authentication;
using Application.Commands.CartCommands;
using Application.Commands.UserClientCommands;
using Application.DTOs;
using Application.Queries.UserClientQueries;
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
    public class UserClientControllerTests
    {
        private readonly IMediator _mediator;
        private readonly IHttpContextAccessor _httpContextAccessor;
        private readonly UserClientController _controller;

        public UserClientControllerTests()
        {
            _mediator = Substitute.For<IMediator>();
            _httpContextAccessor = Substitute.For<IHttpContextAccessor>();
            _controller = new UserClientController(_mediator, _httpContextAccessor);
        }

        [Fact]
        public async Task GetAllUsers_ShouldReturnOk()
        {
            var userClientDtos = new List<UserClientDto>
            {
                new UserClientDto
                {
                    UserId = Guid.NewGuid(),
                    Name = "Test User Client 1",
                    Email = "testuser1@example.com",
                    Image = "image_data_1",
                    UserType = UserType.Client
                },
                new UserClientDto
                {
                    UserId = Guid.NewGuid(),
                    Name = "Test User Client 2",
                    Email = "testuser2@example.com",
                    Image = "image_data_2",
                    UserType = UserType.Client
                }
            };

            _mediator.Send(Arg.Any<GetAllUserClientsQuery>()).Returns(userClientDtos);

            var response = await _controller.GetAllUsers();

            Assert.NotNull(response);
            var actionResult = Assert.IsType<OkObjectResult>(response);
            Assert.NotNull(actionResult.Value);
            Assert.Equal(userClientDtos, actionResult.Value);
        }

        [Fact]
        public async Task GetFilteredUserClients_ShouldReturnNotFound_WhenFailed()
        {
            var result = Result<PagedResult<UserClientDto>>.Failure("Error");
            _mediator.Send(Arg.Any<GetFilteredUserClientsQuery>()).Returns(result);

            var response = await _controller.GetFilteredUserClients(1, 10);

            Assert.NotNull(response);
            var actionResult = Assert.IsType<NotFoundObjectResult>(response.Result);
            Assert.NotNull(actionResult.Value);
            Assert.Equal(result.ErrorMessage, actionResult.Value);
        }

        [Fact]
        public async Task GetUserById_ShouldReturnOk()
        {
            var userId = Guid.NewGuid().ToString();
            var imageBase64 = ConvertImageToBase64("C:\\path\\to\\image.png");

            var userClientDto = new UserClientDto
            {
                UserId = new Guid(userId),
                Name = "Test User Client",
                Email = "testuser@example.com",
                Image = imageBase64,
                UserType = UserType.Client
            };

            var httpContext = new DefaultHttpContext();
            httpContext.User = new ClaimsPrincipal(new ClaimsIdentity(new Claim[]
            {
                new Claim(ClaimTypes.NameIdentifier, userId)
            }));
            _httpContextAccessor.HttpContext.Returns(httpContext);

            _mediator.Send(Arg.Any<GetUserClientByIdQuery>()).Returns(userClientDto);

            var response = await _controller.GetUserById();

            Assert.NotNull(response);
           
        }

        private string ConvertImageToBase64(string imagePath)
        {
            if (string.IsNullOrWhiteSpace(imagePath) || !File.Exists(imagePath))
            {
                return string.Empty;
            }

            byte[] imageBytes = File.ReadAllBytes(imagePath);
            return Convert.ToBase64String(imageBytes);
        }

        [Fact]
        public async Task CreateUserClient_ShouldReturnBadRequest_WhenFailed()
        {
            var command = new CreateUserClientCommand
            {
                Name = "Test User Client",
                Email = "testuser@example.com",
                Password = "password",
                UserType = UserType.Client,
                Image = "image_data"
            };

            var result = Result<Guid>.Failure("Error");
            _mediator.Send(command).Returns(result);

            var response = await _controller.CreateUserClient(command);

            Assert.NotNull(response);
            var actionResult = Assert.IsType<BadRequestObjectResult>(response.Result);
            Assert.NotNull(actionResult.Value);
            Assert.Equal(result.ErrorMessage, actionResult.Value);
        }



    }
}