using Application.CommandHandlers.UserClientCommandHandlers;
using Application.Commands.UserClientCommands;
using Domain.Entities;
using Domain.Repositories;
using NSubstitute;

namespace Application.UnitTests.UserClientHandlersTests
{
    public class DeleteUserClientCommandHandlerTests
    {
        private readonly IUserRepository<UserClient> _userClientRepository;
        private readonly DeleteUserClientCommandHandler _handler;

        public DeleteUserClientCommandHandlerTests()
        {
            _userClientRepository = Substitute.For<IUserRepository<UserClient>>();
            _handler = new DeleteUserClientCommandHandler(_userClientRepository);
        }

        [Fact]
        public async Task Given_ValidDeleteUserClientCommand_When_HandleIsCalled_Then_ReturnsSuccessResult()
        {
            // Arrange
            var command = new DeleteUserClientCommand
            {
                UserId = new Guid("e23c48a1-222b-4530-bd7f-67f5c7a702af")
            };

            var userClient = new UserClient();

            _userClientRepository.GetByIdAsync(command.UserId).Returns(userClient);

            // Act
            var response = await _handler.Handle(command, CancellationToken.None);

            // Assert
            Assert.True(response.IsSuccess);
            Assert.IsType<object>(response.Data);
            Assert.Empty(response.Data.GetType().GetProperties());
            await _userClientRepository.Received(1).GetByIdAsync(command.UserId);
            await _userClientRepository.Received(1).DeleteAsync(command.UserId);
        }

        [Fact]
        public async Task Given_InvalidDeleteUserClientCommand_When_HandleIsCalled_Then_ReturnsFailureResult()
        {
            // Arrange
            var command = new DeleteUserClientCommand
            {
                UserId = new Guid("e23c48a1-222b-4530-bd7f-67f5c7a702af")
            };

            _userClientRepository.GetByIdAsync(command.UserId).Returns(Task.FromResult<UserClient>(null!));

            // Act
            var response = await _handler.Handle(command, CancellationToken.None);

            // Assert
            Assert.False(response.IsSuccess);
            Assert.Equal("User not found", response.ErrorMessage);
            await _userClientRepository.Received(1).GetByIdAsync(command.UserId);
            await _userClientRepository.DidNotReceive().DeleteAsync(command.UserId);
        }
    }

}
