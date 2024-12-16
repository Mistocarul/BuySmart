using Application.Authentication;
using AutoMapper;
using Domain.Common;
using Domain.Entities;
using Domain.Repositories;
using NSubstitute;

namespace BuySmart.Application.UnitTests.Authentication
{
    public class SendVerificationCodeCommandHandlerTests
    {
        private readonly IUserAuthRepository<User> userRepository;
        private readonly IMapper mapper;
        private readonly SendVerificationCodeCommandHandler handler;

        public SendVerificationCodeCommandHandlerTests()
        {
            userRepository = Substitute.For<IUserAuthRepository<User>>();
            mapper = Substitute.For<IMapper>();
            handler = new SendVerificationCodeCommandHandler(userRepository, mapper);
        }

        [Fact]
        public async Task Handle_ShouldReturnSuccessResult_WhenVerificationCodeIsSentSuccessfully()
        {
            // Arrange
            var command = new SendVerificationCodeCommand { Name = "User", Email = "user@example.com", Password = "password", UserType = UserType.Client, Image = "image.png" };
            var user = new User { Name = command.Name, Email = command.Email, Password = BCrypt.Net.BCrypt.HashPassword(command.Password), UserType = command.UserType, Image = command.Image };
            var verificationResult = Result<string>.Success("Verification code sent");

            mapper.Map<User>(command).Returns(user);
            userRepository.SendVerificationCode(user, Arg.Any<CancellationToken>()).Returns(verificationResult);

            // Act
            var result = await handler.Handle(command, CancellationToken.None);

            // Assert
            Assert.True(result.IsSuccess);
            Assert.Equal("Verification code sent", result.Data);
            await userRepository.Received(1).SendVerificationCode(user, Arg.Any<CancellationToken>());
        }

        [Fact]
        public async Task Handle_ShouldReturnFailureResult_WhenVerificationCodeSendingFails()
        {
            // Arrange
            var command = new SendVerificationCodeCommand { Name = "User", Email = "user@example.com", Password = "password", UserType = UserType.Client, Image = "image.png" };
            var user = new User { Name = command.Name, Email = command.Email, Password = BCrypt.Net.BCrypt.HashPassword(command.Password), UserType = command.UserType, Image = command.Image };
            var verificationResult = Result<string>.Failure("Failed to send verification code");

            mapper.Map<User>(command).Returns(user);
            userRepository.SendVerificationCode(user, Arg.Any<CancellationToken>()).Returns(verificationResult);

            // Act
            var result = await handler.Handle(command, CancellationToken.None);

            // Assert
            Assert.False(result.IsSuccess);
            Assert.Equal("Failed to send verification code", result.ErrorMessage);
            await userRepository.Received(1).SendVerificationCode(user, Arg.Any<CancellationToken>());
        }
    }
}





