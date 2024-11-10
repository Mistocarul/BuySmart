using Application.CommandHandlers.BusinessCommandHandlers;
using Application.Commands;
using Application.Commands.BusinessCommands;
using AutoMapper;
using Domain.Entities;
using Domain.Repositories;
using NSubstitute;

public class DeleteBusinessCommandHandlerTests
{
    private readonly IBusinessRepository businessRepository;
    private readonly DeleteBusinessCommandHandler handler;
    private readonly IMapper mapper;

    public DeleteBusinessCommandHandlerTests()
    {
        businessRepository = Substitute.For<IBusinessRepository>();
        handler = new DeleteBusinessCommandHandler(businessRepository, mapper);
    }

    [Fact]
    public async Task Handle_ShouldReturnSuccessResult_WhenBusinessIsDeleted()
    {
        // Arrange
        var command = new DeleteBusinessCommand
        {
            BusinessID = Guid.NewGuid()
        };

        businessRepository.GetByIdAsync(command.BusinessID).Returns(new Business { BusinessID = command.BusinessID });
        businessRepository.DeleteAsync(command.BusinessID).Returns(Task.CompletedTask);

        // Act
        var response = await handler.Handle(command, CancellationToken.None);

        // Assert
        Assert.True(response.IsSuccess);
        Assert.Null(response.ErrorMessage);
    }

    [Fact]
    public async Task Handle_ShouldReturnFailureResult_WhenBusinessDoesNotExist()
    {
        // Arrange
        var command = new DeleteBusinessCommand
        {
            BusinessID = Guid.NewGuid()
        };

        businessRepository.GetByIdAsync(command.BusinessID).Returns((Business)null);

        // Act
        var response = await handler.Handle(command, CancellationToken.None);

        // Assert
        Assert.False(response.IsSuccess);
        Assert.Equal("Business not found", response.ErrorMessage);
    }
}
