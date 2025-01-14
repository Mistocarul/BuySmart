using Application.Authentication;
using Domain.Common;
using Domain.Entities;
using Domain.Repositories;
using FluentAssertions;
using NSubstitute;

namespace Application.Tests.Authentication
{
    public class VerifyPasswordCommandHandlerTests
    {
        private readonly IUserAuthRepository<User> _userRepository;
        private readonly VerifyPasswordCommandHandler _handler;

        public VerifyPasswordCommandHandlerTests()
        {
            _userRepository = Substitute.For<IUserAuthRepository<User>>();
            _handler = new VerifyPasswordCommandHandler(_userRepository);
        }

        [Fact]
        public async Task Handle_PasswordIsCorrect_ShouldReturnSuccess()
        {
            // Arrange
            var userId = Guid.NewGuid();
            var password = "correct_password";
            var expectedResult = Result<string>.Success("Password verified");

            _userRepository.VerifyPassword(userId, password).Returns(expectedResult);

            var command = new VerifyPasswordCommand { UserId = userId, Password = password };
            var cancellationToken = CancellationToken.None;

            // Act
            var result = await _handler.Handle(command, cancellationToken);

            // Assert
            result.IsSuccess.Should().BeTrue();
            result.Data.Should().Be("Password verified");
        }

        [Fact]
        public async Task Handle_PasswordIsIncorrect_ShouldReturnFailure()
        {
            // Arrange
            var userId = Guid.NewGuid();
            var password = "incorrect_password";
            var expectedResult = Result<string>.Failure("Invalid password");

            _userRepository.VerifyPassword(userId, password).Returns(expectedResult);

            var command = new VerifyPasswordCommand { UserId = userId, Password = password };
            var cancellationToken = CancellationToken.None;

            // Act
            var result = await _handler.Handle(command, cancellationToken);

            // Assert
            result.IsSuccess.Should().BeFalse();
            result.ErrorMessage.Should().Be("Invalid password");
        }
    }
}

