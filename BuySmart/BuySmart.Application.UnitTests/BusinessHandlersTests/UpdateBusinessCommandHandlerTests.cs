using Application.CommandHandlers.BusinessCommandHandlers;
using Application.Commands.BusinessCommands;
using AutoMapper;
using Domain.Common;
using Domain.Entities;
using Domain.Repositories;
using NSubstitute;

public class UpdateBusinessCommandHandlerTests
{
    private readonly IBusinessRepository businessRepository;
    private readonly IMapper mapper;
    private readonly UpdateBusinessCommandHandler handler;

    public UpdateBusinessCommandHandlerTests()
    {
        businessRepository = Substitute.For<IBusinessRepository>();
        mapper = Substitute.For<IMapper>();
        handler = new UpdateBusinessCommandHandler(businessRepository, mapper);
    }

    [Fact]
    public async Task Handle_ShouldReturnSuccessResult_WhenBusinessIsUpdated()
    {
        // Arrange
        var command = new UpdateBusinessCommand
        {
            BusinessID = Guid.NewGuid(),
            Name = "Updated Business",
            Description = "Updated Description",
            Address = "Updated Address",
            PhoneNumber = "0987654321"
        };

        var business = new Business
        {
            BusinessID = command.BusinessID,
            Name = command.Name,
            Description = command.Description,
            Address = command.Address,
            PhoneNumber = command.PhoneNumber,
            UserBusinessId = Guid.NewGuid()
        };

        var result = Result<object>.Success(new object());

        mapper.Map<Business>(command).Returns(business);
        businessRepository.UpdateAsync(business).Returns(result);

        // Act
        var response = await handler.Handle(command, CancellationToken.None);

        // Assert
        Assert.True(response.IsSuccess);
        Assert.Equal(result.Data, response.Data);
    }

    [Fact]
    public async Task Handle_ShouldReturnFailureResult_WhenBusinessUpdateFails()
    {
        // Arrange
        var command = new UpdateBusinessCommand
        {
            BusinessID = Guid.NewGuid(),
            Name = "Updated Business",
            Description = "Updated Description",
            Address = "Updated Address",
            PhoneNumber = "0987654321"
        };

        var business = new Business
        {
            BusinessID = command.BusinessID,
            Name = command.Name,
            Description = command.Description,
            Address = command.Address,
            PhoneNumber = command.PhoneNumber,
            UserBusinessId = Guid.NewGuid()
        };

        var result = Result<object>.Failure("Error updating business");

        mapper.Map<Business>(command).Returns(business);
        businessRepository.UpdateAsync(business).Returns(result);

        // Act
        var response = await handler.Handle(command, CancellationToken.None);

        // Assert
        Assert.False(response.IsSuccess);
        Assert.Equal(result.ErrorMessage, response.ErrorMessage);
    }
}
