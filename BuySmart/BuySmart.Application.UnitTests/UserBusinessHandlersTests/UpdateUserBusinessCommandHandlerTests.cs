using Application.CommandHandlers.UserBusinessCommandHandlers;
using Application.Commands.UserBusinessCommands;
using AutoMapper;
using Domain.Common;
using Domain.Entities;
using Domain.Repositories;
using NSubstitute;

namespace Application.UnitTests.UserBusinessHandlersTests
{
    public class UpdateUserBusinessCommandHandlerTests
    {
        private readonly IUserBusinessRepository _userBusinessRepository;
        private readonly IMapper _mapper;
        private readonly UpdateUserBusinessCommandHandler _handler;

        public UpdateUserBusinessCommandHandlerTests()
        {
            _userBusinessRepository = Substitute.For<IUserBusinessRepository>();
            _mapper = Substitute.For<IMapper>();
            _handler = new UpdateUserBusinessCommandHandler(_userBusinessRepository, _mapper);
        }

        [Fact]
        public async Task Handle_UserBusinessExists_UpdatesUserBusiness()
        {
            // Arrange
            var userId = Guid.NewGuid();
            var command = new UpdateUserBusinessCommand
            {
                UserId = userId,
                Name = "Updated Business",
                Email = "updated@business.com",
                Password = "newpassword123",
                UserType = UserType.Business,
                Image = "newimage.png"
            };
            var userBusiness = new UserBusiness { UserId = userId };

            _userBusinessRepository.GetByIdAsync(userId).Returns(userBusiness);
            _mapper.Map<UserBusiness>(command).Returns(userBusiness);
            _userBusinessRepository.UpdateAsync(userBusiness).Returns(Result<object>.Success(new object()));

            // Act
            var result = await _handler.Handle(command, CancellationToken.None);

            // Assert
            await _userBusinessRepository.Received(1).UpdateAsync(userBusiness);
            Assert.True(result.IsSuccess);
            Assert.IsType<object>(result.Data);
            Assert.Empty(result.Data.GetType().GetProperties());
        }

        [Fact]
        public async Task Handle_UserBusinessDoesNotExist_ReturnsFailure()
        {
            // Arrange
            var userId = Guid.NewGuid();
            var command = new UpdateUserBusinessCommand
            {
                UserId = userId,
                Name = "Updated Business",
                Email = "updated@business.com",
                Password = "newpassword123",
                UserType = UserType.Business,
                Image = "newimage.png"
            };

            _userBusinessRepository.GetByIdAsync(userId).Returns(Task.FromResult<UserBusiness>(null!));

            // Act
            var result = await _handler.Handle(command, CancellationToken.None);

            // Assert
            await _userBusinessRepository.DidNotReceive().UpdateAsync(Arg.Any<UserBusiness>());
            Assert.False(result.IsSuccess);
            Assert.Equal("User not found", result.ErrorMessage);
        }

        [Fact]
        public async Task Handle_UpdateAsyncFails_ReturnsFailure()
        {
            // Arrange
            var userId = Guid.NewGuid();
            var command = new UpdateUserBusinessCommand
            {
                UserId = userId,
                Name = "Updated Business",
                Email = "updated@business.com",
                Password = "newpassword123",
                UserType = UserType.Business,
                Image = "newimage.png"
            };
            var userBusiness = new UserBusiness { UserId = userId };

            _userBusinessRepository.GetByIdAsync(userId).Returns(userBusiness);
            _mapper.Map<UserBusiness>(command).Returns(userBusiness);
            _userBusinessRepository.UpdateAsync(userBusiness).Returns(Result<object>.Failure("Error updating user business"));

            // Act
            var result = await _handler.Handle(command, CancellationToken.None);

            // Assert
            await _userBusinessRepository.Received(1).UpdateAsync(userBusiness);
            Assert.False(result.IsSuccess);
            Assert.Equal("Error updating user business", result.ErrorMessage);
        }
    }
}

