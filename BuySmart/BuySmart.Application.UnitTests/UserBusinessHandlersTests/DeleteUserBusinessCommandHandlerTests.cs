using Application.CommandHandlers.UserBusinessCommandHandlers;
using Application.Commands.UserBusinessCommands;
using Domain.Entities;
using Domain.Repositories;
using NSubstitute;

namespace Application.UnitTests.UserBusinessHandlersTests
{
    public class DeleteUserBusinessCommandHandlerTests
    {
        private readonly IUserBusinessRepository _userBusinessRepository;
        private readonly DeleteUserBusinessCommandHandler _handler;

        public DeleteUserBusinessCommandHandlerTests()
        {
            _userBusinessRepository = Substitute.For<IUserBusinessRepository>();
            _handler = new DeleteUserBusinessCommandHandler(_userBusinessRepository);
        }

        [Fact]
        public async Task Handle_UserBusinessExists_DeletesUserBusiness()
        {
            // Arrange
            var userId = Guid.NewGuid();
            var command = new DeleteUserBusinessCommand { UserId = userId };
            var userBusiness = new UserBusiness { UserId = userId };

            _userBusinessRepository.GetByIdAsync(userId).Returns(userBusiness);

            // Act
            var result = await _handler.Handle(command, CancellationToken.None);

            // Assert
            await _userBusinessRepository.Received(1).DeleteAsync(userId);
            Assert.True(result.IsSuccess);
            Assert.IsType<object>(result.Data);
            Assert.Empty(result.Data.GetType().GetProperties());
        }

        [Fact]
        public async Task Handle_UserBusinessDoesNotExist_ReturnsFailure()
        {
            // Arrange
            var userId = Guid.NewGuid();
            var command = new DeleteUserBusinessCommand { UserId = userId };

            _userBusinessRepository.GetByIdAsync(userId).Returns(Task.FromResult<UserBusiness>(null!));

            // Act
            var result = await _handler.Handle(command, CancellationToken.None);

            // Assert
            await _userBusinessRepository.DidNotReceive().DeleteAsync(Arg.Any<Guid>());
            Assert.False(result.IsSuccess);
            Assert.Equal("User not found", result.ErrorMessage);
        }
    }
}
