using Application.Authentication;
using AutoMapper;
using Domain.Common;
using Domain.Entities;
using Domain.Repositories;
using NSubstitute;

namespace BuySmart.Application.UnitTests.Authentication
{
    public class RegisterUserCommandHandlerTests
    {
        private readonly IUserAuthRepository<User> userRepository;
        private readonly IMapper mapper;
        private readonly RegisterUserCommandHandler handler;

        public RegisterUserCommandHandlerTests()
        {
            userRepository = Substitute.For<IUserAuthRepository<User>>();
            mapper = Substitute.For<IMapper>();
            handler = new RegisterUserCommandHandler(userRepository, mapper);
        }

        [Fact]
        public async Task Handle_ShouldReturnSuccessResult_WhenRegistrationIsSuccessful()
        {
            // Arrange
            var command = new RegisterUserCommand { confirmationCode = "123456" };
            var registrationResult = Result<Guid>.Success(Guid.NewGuid());

            userRepository.Register(Arg.Any<int>(), Arg.Any<CancellationToken>()).Returns(registrationResult);

            // Act
            var result = await handler.Handle(command, CancellationToken.None);

            // Assert
            Assert.True(result.IsSuccess);
            Assert.Equal(registrationResult.Data, result.Data);
            await userRepository.Received(1).Register(Arg.Any<int>(), Arg.Any<CancellationToken>());
        }

        [Fact]
        public async Task Handle_ShouldReturnFailureResult_WhenRegistrationFails()
        {
            // Arrange
            var command = new RegisterUserCommand { confirmationCode = "123456" };
            var registrationResult = Result<Guid>.Failure("Registration failed");

            userRepository.Register(Arg.Any<int>(), Arg.Any<CancellationToken>()).Returns(registrationResult);

            // Act
            var result = await handler.Handle(command, CancellationToken.None);

            // Assert
            Assert.False(result.IsSuccess);
            Assert.Equal("Registration failed", result.ErrorMessage);
            await userRepository.Received(1).Register(Arg.Any<int>(), Arg.Any<CancellationToken>());
        }
    }
}




