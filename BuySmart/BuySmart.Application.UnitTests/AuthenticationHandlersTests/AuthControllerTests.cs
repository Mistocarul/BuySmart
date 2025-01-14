using System.Security.Claims;
using Application.Authentication;
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
    public class AuthControllerTests
    {
        private readonly IMediator _mediator;
        private readonly IHttpContextAccessor _httpContextAccessor;
        private readonly AuthController _controller;

        public AuthControllerTests()
        {
            _mediator = Substitute.For<IMediator>();
            _httpContextAccessor = Substitute.For<IHttpContextAccessor>();
            _controller = new AuthController(_mediator, _httpContextAccessor);
        }

        [Fact]
        public async Task Register_ShouldReturnCreated()
        {
            var command = new RegisterUserCommand { confirmationCode = "123456" };
            var result = Result<Guid>.Success(Guid.NewGuid());
            _mediator.Send(command).Returns(result);

            var response = await _controller.Register(command);

            var actionResult = Assert.IsType<CreatedAtActionResult>(response.Result);
            Assert.Equal(result.Data, actionResult.Value);
        }

        [Fact]
        public async Task Register_ShouldReturnBadRequest_WhenFailed()
        {
            var command = new RegisterUserCommand { confirmationCode = "123456" };
            var result = Result<Guid>.Failure("Error");
            _mediator.Send(command).Returns(result);

            var response = await _controller.Register(command);

            var actionResult = Assert.IsType<BadRequestObjectResult>(response.Result);
            Assert.Equal(result.ErrorMessage, actionResult.Value);
        }

        [Fact]
        public async Task Login_ShouldReturnUnauthorized_WhenFailed()
        {
            var command = new LoginUserCommand { Email = "test@example.com", Password = "password" };
            var result = Result<string>.Failure("Error");
            _mediator.Send(command).Returns(result);

            var response = await _controller.Login(command);

            var actionResult = Assert.IsType<UnauthorizedObjectResult>(response.Result);
            Assert.Equal(result.ErrorMessage, actionResult.Value);
        }

        [Fact]
        public async Task SendConfirmationCode_ShouldReturnOk()
        {
            var command = new SendVerificationCodeCommand { Email = "test@example.com", Name = "Test", Password = "password", UserType = UserType.Client, Image = "image_data" };
            var result = Result<string>.Success("Code sent");
            _mediator.Send(command).Returns(result);

            var response = await _controller.SendConfirmationCode(command);

            var actionResult = Assert.IsType<OkObjectResult>(response.Result);
            Assert.Equal(result.Data, actionResult.Value);
        }

        [Fact]
        public async Task SendConfirmationCode_ShouldReturnBadRequest_WhenFailed()
        {
            var command = new SendVerificationCodeCommand { Email = "test@example.com", Name = "Test", Password = "password", UserType = UserType.Client, Image = "image_data" };
            var result = Result<string>.Failure("Error");
            _mediator.Send(command).Returns(result);

            var response = await _controller.SendConfirmationCode(command);

            var actionResult = Assert.IsType<BadRequestObjectResult>(response.Result);
            Assert.Equal(result.ErrorMessage, actionResult.Value);
        }

        

        [Fact]
        public async Task VerifyPassword_ShouldReturnUnauthorized_WhenHttpContextIsNull()
        {
            _httpContextAccessor.HttpContext.Returns((HttpContext)null);

            var command = new VerifyPasswordCommand { Password = "password" };

            var response = await _controller.VerifyPassword(command);

            Assert.IsType<UnauthorizedResult>(response.Result);
        }

       

        [Fact]
        public async Task VerifyPassword_ShouldReturnUnauthorized_WhenFailed()
        {
            // Arrange
            var userId = Guid.NewGuid();
            var command = new VerifyPasswordCommand { Password = "password" };
            var result = Result<string>.Failure("Error");
            _mediator.Send(command).Returns(result);

            // 🔧 Creează un HttpContext valid cu un utilizator autentificat
            var httpContext = new DefaultHttpContext();
            httpContext.User = new ClaimsPrincipal(new ClaimsIdentity(new Claim[]
            {
        new Claim(ClaimTypes.NameIdentifier, userId.ToString())
            }));

            // 🔧 Returnează HttpContext-ul valid în IHttpContextAccessor
            _httpContextAccessor.HttpContext.Returns(httpContext);

            // ❌ Nu mai este nevoie să mock-uiești JwtHelper.GetUserIdFromJwt

            // Act
            var response = await _controller.VerifyPassword(command);

            // Assert
            var actionResult = Assert.IsType<UnauthorizedResult>(response.Result);
            Assert.Equal(401, actionResult.StatusCode);
        }

    }
}


