using Application.CommandHandlers;
using Application.Commands;
using AutoMapper;
using Domain.Common;
using Domain.Entities;
using Domain.Repositories;
using NSubstitute;
using System;
using System.Threading;
using System.Threading.Tasks;
using Xunit;

public class DeleteUserClientCommandHandlerTests
{
    private readonly IUserClientRepository _userClientRepository;
    private readonly IMapper _mapper;
    private readonly DeleteUserClientCommandHandler _handler;

    public DeleteUserClientCommandHandlerTests()
    {
        _userClientRepository = Substitute.For<IUserClientRepository>();
        _mapper = Substitute.For<IMapper>();
        _handler = new DeleteUserClientCommandHandler(_userClientRepository, _mapper);
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
        Assert.Null(response.Data);
        _userClientRepository.Received(1).GetByIdAsync(command.UserId);
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

        _userClientRepository.GetByIdAsync(command.UserId).Returns((UserClient)null);

        // Act
        var response = await _handler.Handle(command, CancellationToken.None);

        // Assert
        Assert.False(response.IsSuccess);
        Assert.Equal("User not found", response.ErrorMessage);
        _userClientRepository.Received(1).GetByIdAsync(command.UserId);
        await _userClientRepository.DidNotReceive().DeleteAsync(command.UserId);
    }
}
