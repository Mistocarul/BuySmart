using Application.CommandHandlers.UserBusinessCommandHandlers;
using Application.Commands;
using Application.Commands.UserBusinessCommands;
using AutoMapper;
using Domain.Entities;
using Domain.Repositories;
using NSubstitute;

public class DeleteUserBusinessCommandHandlerTests
{
    private readonly IUserBusinessRepository _userBusinessRepository;
    private readonly IMapper _mapper;
    private readonly DeleteUserBusinessCommandHandler _handler;

    public DeleteUserBusinessCommandHandlerTests()
    {
        _userBusinessRepository = Substitute.For<IUserBusinessRepository>();
        _mapper = Substitute.For<IMapper>();
        _handler = new DeleteUserBusinessCommandHandler(_userBusinessRepository, _mapper);
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
        Assert.Null(result.Data);
    }

    [Fact]
    public async Task Handle_UserBusinessDoesNotExist_ReturnsFailure()
    {
        // Arrange
        var userId = Guid.NewGuid();
        var command = new DeleteUserBusinessCommand { UserId = userId };

        _userBusinessRepository.GetByIdAsync(userId).Returns((UserBusiness)null);

        // Act
        var result = await _handler.Handle(command, CancellationToken.None);

        // Assert
        await _userBusinessRepository.DidNotReceive().DeleteAsync(Arg.Any<Guid>());
        Assert.False(result.IsSuccess);
        Assert.Equal("User not found", result.ErrorMessage);
    }
}
