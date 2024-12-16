using Application.Authentication;
using AutoMapper;
using Domain.Common;
using Domain.Entities;
using Domain.Repositories;
using NSubstitute;

namespace BuySmart.Application.UnitTests.Authentication
{
    public class LoginUserCommandHandlerTests
    {
        private readonly IUserAuthRepository<User> userRepository;
        private readonly IMapper mapper;
        private readonly LoginUserCommandHandler handler;

        public LoginUserCommandHandlerTests()
        {
            userRepository = Substitute.For<IUserAuthRepository<User>>();
            mapper = Substitute.For<IMapper>();
            handler = new LoginUserCommandHandler(userRepository, mapper);
        }

        [Fact]
        public async Task Handle_ShouldReturnSuccessResult_WhenLoginIsSuccessful()
        {
            // Arrange
            var command = new LoginUserCommand { Email = "user@example.com", Password = "password" };
            var user = new User { Email = command.Email, Password = command.Password };
            var loginResult = Result<string>.Success("token");

            mapper.Map<User>(command).Returns(user);
            userRepository.Login(user).Returns(loginResult);

            // Act
            var result = await handler.Handle(command, CancellationToken.None);

            // Assert
            Assert.True(result.IsSuccess);
            Assert.Equal("token", result.Data);
            await userRepository.Received(1).Login(user);
        }

        [Fact]
        public async Task Handle_ShouldReturnFailureResult_WhenLoginFails()
        {
            // Arrange
            var command = new LoginUserCommand { Email = "user@example.com", Password = "password" };
            var user = new User { Email = command.Email, Password = command.Password };
            var loginResult = Result<string>.Failure("Invalid credentials");

            mapper.Map<User>(command).Returns(user);
            userRepository.Login(user).Returns(loginResult);

            // Act
            var result = await handler.Handle(command, CancellationToken.None);

            // Assert
            Assert.False(result.IsSuccess);
            Assert.Equal("Invalid credentials", result.ErrorMessage);
            await userRepository.Received(1).Login(user);
        }
    }
}





