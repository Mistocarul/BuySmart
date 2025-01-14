using Application.Authentication;
using Application.CommandHandlers.UserClientCommandHandlers;
using AutoMapper;
using Domain.Common;
using Domain.Entities;
using Domain.Repositories;
using FluentAssertions;
using NSubstitute;

namespace Application.Tests.CommandHandlers.UserClientCommandHandlers
{
    public class UpdateUserCommandHandlerTests
    {
        private readonly IUserAuthRepository<User> _userAuthRepository;
        private readonly IMapper _mapper;
        private readonly UpdateUserCommandHandler _handler;

        public UpdateUserCommandHandlerTests()
        {
            _userAuthRepository = Substitute.For<IUserAuthRepository<User>>();
            _mapper = Substitute.For<IMapper>();
            _handler = new UpdateUserCommandHandler(_userAuthRepository, _mapper);
        }

        [Fact]
        public async Task Handle_UserNotFound_ShouldReturnFailure()
        {
            // Arrange
            var command = new UpdateUserCommand { UserId = Guid.NewGuid() };
            _userAuthRepository.GetByIdAsync(command.UserId).Returns((User)null);

            // Act
            var result = await _handler.Handle(command, CancellationToken.None);

            // Assert
            result.IsSuccess.Should().BeFalse();
            result.ErrorMessage.Should().Be("User not found");
        }

        [Fact]
        public async Task Handle_UserFound_ShouldReturnSuccess()
        {
            // Arrange
            var command = new UpdateUserCommand
            {
                UserId = Guid.NewGuid(),
                Name = "Updated Name",
                Email = "updated@example.com",
                Password = "newpassword",
                Image = "newimage"
            };

            var user = new User { UserId = command.UserId };
            _userAuthRepository.GetByIdAsync(command.UserId).Returns(user);
            _mapper.Map<User>(command).Returns(user);
            _userAuthRepository.UpdateUserAsync(user).Returns(Result<object>.Success(user));

            // Act
            var result = await _handler.Handle(command, CancellationToken.None);

            // Assert
            result.IsSuccess.Should().BeTrue();
            result.Data.Should().Be(user);
        }

        [Fact]
        public async Task Handle_UpdateUserFailed_ShouldReturnFailure()
        {
            // Arrange
            var command = new UpdateUserCommand
            {
                UserId = Guid.NewGuid(),
                Name = "Updated Name",
                Email = "updated@example.com",
                Password = "newpassword",
                Image = "newimage"
            };

            var user = new User { UserId = command.UserId };
            _userAuthRepository.GetByIdAsync(command.UserId).Returns(user);
            _mapper.Map<User>(command).Returns(user);
            _userAuthRepository.UpdateUserAsync(user).Returns(Result<object>.Failure("Update failed"));

            // Act
            var result = await _handler.Handle(command, CancellationToken.None);

            // Assert
            result.IsSuccess.Should().BeFalse();
            result.ErrorMessage.Should().Be("Update failed");
        }
    }
}
