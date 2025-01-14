using Application.Authentication;
using Domain.Entities;
using Domain.Repositories;
using FluentAssertions;
using NSubstitute;

namespace Application.CommandHandlers.UserClientCommandHandlers.Tests
{
    public class DeleteUserCommandHandlerTests
    {
        private readonly IUserAuthRepository<User> _userAuthRepository;
        private readonly DeleteUserCommandHandler _handler;

        public DeleteUserCommandHandlerTests()
        {
            _userAuthRepository = Substitute.For<IUserAuthRepository<User>>();
            _handler = new DeleteUserCommandHandler(_userAuthRepository);
        }

        [Fact]
        public async Task Handle_UserExists_ShouldDeleteUser()
        {
            // Arrange
            var userId = Guid.NewGuid();
            var user = new User { UserId = userId };
            _userAuthRepository.GetByIdAsync(userId).Returns(user);

            var command = new DeleteUserCommand { UserId = userId };
            var cancellationToken = CancellationToken.None;

            // Act
            var result = await _handler.Handle(command, cancellationToken);

            // Assert
            result.IsSuccess.Should().BeTrue();
            await _userAuthRepository.Received(1).DeleteUserAsync(userId);
        }

        [Fact]
        public async Task Handle_UserDoesNotExist_ShouldReturnFailure()
        {
            // Arrange
            var userId = Guid.NewGuid();
            _userAuthRepository.GetByIdAsync(userId).Returns((User)null);

            var command = new DeleteUserCommand { UserId = userId };
            var cancellationToken = CancellationToken.None;

            // Act
            var result = await _handler.Handle(command, cancellationToken);

            // Assert
            result.IsSuccess.Should().BeFalse();
            result.ErrorMessage.Should().Be("User not found");
            await _userAuthRepository.DidNotReceive().DeleteUserAsync(Arg.Any<Guid>());
        }
    }
}
