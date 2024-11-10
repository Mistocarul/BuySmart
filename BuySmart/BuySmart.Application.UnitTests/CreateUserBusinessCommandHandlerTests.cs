using Application.CommandHandlers;
using Application.Commands;
using AutoMapper;
using Domain.Common;
using Domain.Entities;
using Domain.Repositories;
using NSubstitute;

public class CreateUserBusinessCommandHandlerTests
{
    private readonly IUserBusinessRepository _userBusinessRepository;
    private readonly IMapper _mapper;
    private readonly CreateUserBusinessCommandHandler _handler;

    public CreateUserBusinessCommandHandlerTests()
    {
        _userBusinessRepository = Substitute.For<IUserBusinessRepository>();
        _mapper = Substitute.For<IMapper>();
        _handler = new CreateUserBusinessCommandHandler(_userBusinessRepository, _mapper);
    }

    [Fact]
    public async Task Handle_ValidCommand_AddsUserBusiness()
    {
        // Arrange
        var command = new CreateUserBusinessCommand
        {
            Name = "Test Business",
            Email = "test@business.com",
            Password = "password123",
            UserType = UserType.Business,
            Image = "image.png"
        };
        var userBusiness = new UserBusiness { UserId = Guid.NewGuid() };

        _mapper.Map<UserBusiness>(command).Returns(userBusiness);
        _userBusinessRepository.AddAsync(userBusiness).Returns(Result<Guid>.Success(userBusiness.UserId));

        // Act
        var result = await _handler.Handle(command, CancellationToken.None);

        // Assert
        await _userBusinessRepository.Received(1).AddAsync(userBusiness);
        Assert.True(result.IsSuccess);
        Assert.Equal(userBusiness.UserId, result.Data);
    }

    [Fact]
    public async Task Handle_AddAsyncFails_ReturnsFailure()
    {
        // Arrange
        var command = new CreateUserBusinessCommand
        {
            Name = "Test Business",
            Email = "test@business.com",
            Password = "password123",
            UserType = UserType.Business,
            Image = "image.png"
        };
        var userBusiness = new UserBusiness { UserId = Guid.NewGuid() };

        _mapper.Map<UserBusiness>(command).Returns(userBusiness);
        _userBusinessRepository.AddAsync(userBusiness).Returns(Result<Guid>.Failure("Error adding user business"));

        // Act
        var result = await _handler.Handle(command, CancellationToken.None);

        // Assert
        await _userBusinessRepository.Received(1).AddAsync(userBusiness);
        Assert.False(result.IsSuccess);
        Assert.Equal("Error adding user business", result.ErrorMessage);
    }
}
