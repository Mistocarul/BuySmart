using Application.CommandHandlers.UserClientCommandHandlers;
using Application.Commands.UserClientCommands;
using AutoMapper;
using Domain.Common;
using Domain.Entities;
using Domain.Repositories;
using NSubstitute;

namespace Application.UnitTests.UserClientHandlersTests
{
    public class UpdateUserClientCommandHandlerTests
    {
        private readonly IUserClientRepository _userClientRepository;
        private readonly IMapper _mapper;
        private readonly UpdateUserClientCommandHandler _handler;

        public UpdateUserClientCommandHandlerTests()
        {
            _userClientRepository = Substitute.For<IUserClientRepository>();
            _mapper = Substitute.For<IMapper>();
            _handler = new UpdateUserClientCommandHandler(_userClientRepository, _mapper);
        }

        [Fact]
        public async Task Given_ValidUpdateUserClientCommand_When_HandleIsCalled_Then_ReturnsSuccessResult()
        {
            // Arrange
            var command = new UpdateUserClientCommand
            {
                UserId = new Guid("e23c48a1-222b-4530-bd7f-67f5c7a702af"),
                Name = "Updated User",
                Email = "updated@example.com",
                Password = "newpassword",
                UserType = UserType.Client,
                Image = "newimage.png"
            };

            var userClient = new UserClient();
            var result = Result<object>.Success(new object());

            _userClientRepository.GetByIdAsync(command.UserId).Returns(userClient);
            _mapper.Map<UserClient>(command).Returns(userClient);
            _userClientRepository.UpdateAsync(userClient).Returns(result);

            // Act
            var response = await _handler.Handle(command, CancellationToken.None);

            // Assert
            Assert.True(response.IsSuccess);
            Assert.IsType<object>(result.Data);
            Assert.Empty(result.Data.GetType().GetProperties());
            await _userClientRepository.Received(1).GetByIdAsync(command.UserId);
            _mapper.Received(1).Map<UserClient>(command);
            await _userClientRepository.Received(1).UpdateAsync(userClient);
        }

        [Fact]
        public async Task Given_InvalidUpdateUserClientCommand_When_HandleIsCalled_Then_ReturnsFailureResult()
        {
            // Arrange
            var command = new UpdateUserClientCommand
            {
                UserId = new Guid("e23c48a1-222b-4530-bd7f-67f5c7a702af"),
                Name = "Updated User",
                Email = "updated@example.com",
                Password = "newpassword",
                UserType = UserType.Client,
                Image = "newimage.png"
            };

            _userClientRepository.GetByIdAsync(command.UserId).Returns(Task.FromResult<UserClient>(null!));

            // Act
            var response = await _handler.Handle(command, CancellationToken.None);

            // Assert
            Assert.False(response.IsSuccess);
            Assert.Equal("User not found", response.ErrorMessage);
            await _userClientRepository.Received(1).GetByIdAsync(command.UserId);
            _mapper.DidNotReceive().Map<UserClient>(command);
            await _userClientRepository.DidNotReceive().UpdateAsync(Arg.Any<UserClient>());
        }

        [Fact]
        public async Task Given_ValidUpdateUserClientCommand_When_UpdateFails_Then_ReturnsFailureResult()
        {
            // Arrange
            var command = new UpdateUserClientCommand
            {
                UserId = new Guid("e23c48a1-222b-4530-bd7f-67f5c7a702af"),
                Name = "Updated User",
                Email = "updated@example.com",
                Password = "newpassword",
                UserType = UserType.Client,
                Image = "newimage.png"
            };

            var userClient = new UserClient();
            var result = Result<object>.Failure("Error updating user client");

            _userClientRepository.GetByIdAsync(command.UserId).Returns(userClient);
            _mapper.Map<UserClient>(command).Returns(userClient);
            _userClientRepository.UpdateAsync(userClient).Returns(result);

            // Act
            var response = await _handler.Handle(command, CancellationToken.None);

            // Assert
            Assert.False(response.IsSuccess);
            Assert.Equal(result.ErrorMessage, response.ErrorMessage);
            await _userClientRepository.Received(1).GetByIdAsync(command.UserId);
            _mapper.Received(1).Map<UserClient>(command);
            await _userClientRepository.Received(1).UpdateAsync(userClient);
        }
    }

}
