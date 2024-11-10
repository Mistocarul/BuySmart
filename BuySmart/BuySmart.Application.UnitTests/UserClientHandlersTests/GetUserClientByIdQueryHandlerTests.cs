using Application.DTOs;
using Application.Queries.UserClientQueries;
using Application.QueryHandlers.UserClientQueryHandlers;
using AutoMapper;
using Domain.Entities;
using Domain.Repositories;
using NSubstitute;
using System;
using System.Threading;
using System.Threading.Tasks;
using Xunit;

public class GetUserClientByIdQueryHandlerTests
{
    private readonly IUserClientRepository _userClientRepository;
    private readonly IMapper _mapper;
    private readonly GetUserClientByIdQueryHandler _handler;

    public GetUserClientByIdQueryHandlerTests()
    {
        _userClientRepository = Substitute.For<IUserClientRepository>();
        _mapper = Substitute.For<IMapper>();
        _handler = new GetUserClientByIdQueryHandler(_userClientRepository, _mapper);
    }

    [Fact]
    public async Task Given_ValidUserId_When_HandleIsCalled_Then_ReturnsUserClientDto()
    {
        // Arrange
        var query = new GetUserClientByIdQuery
        {
            Id = new Guid("e23c48a1-222b-4530-bd7f-67f5c7a702af")
        };

        var userClient = new UserClient();
        var userClientDto = new UserClientDto
        {
            UserId = query.Id,
            Name = "Test User",
            Email = "test@example.com",
            UserType = UserType.Client,
            Image = "image.png"
        };

        _userClientRepository.GetByIdAsync(query.Id).Returns(userClient);
        _mapper.Map<UserClientDto>(userClient).Returns(userClientDto);

        // Act
        var response = await _handler.Handle(query, CancellationToken.None);

        // Assert
        Assert.NotNull(response);
        Assert.Equal(userClientDto.UserId, response.UserId);
        _userClientRepository.Received(1).GetByIdAsync(query.Id);
        _mapper.Received(1).Map<UserClientDto>(userClient);
    }

    [Fact]
    public async Task Given_InvalidUserId_When_HandleIsCalled_Then_ReturnsNull()
    {
        // Arrange
        var query = new GetUserClientByIdQuery
        {
            Id = new Guid("e23c48a1-222b-4530-bd7f-67f5c7a702af")
        };

        _userClientRepository.GetByIdAsync(query.Id).Returns((UserClient)null);

        // Act
        var response = await _handler.Handle(query, CancellationToken.None);

        // Assert
        Assert.Null(response);
        _userClientRepository.Received(1).GetByIdAsync(query.Id);
        _mapper.DidNotReceive().Map<UserClientDto>(Arg.Any<UserClient>());
    }
}
