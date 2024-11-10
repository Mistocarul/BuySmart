using Application.DTOs;
using Application.Queries.UserClientQueries;
using Application.QueryHandlers.UserClientQueryHandlers;
using AutoMapper;
using Domain.Entities;
using Domain.Repositories;
using NSubstitute;
using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;
using Xunit;

public class GetAllUserClientsQueryHandlerTests
{
    private readonly IUserClientRepository _userClientRepository;
    private readonly IMapper _mapper;
    private readonly GetAllUserClientsQueryHandler _handler;

    public GetAllUserClientsQueryHandlerTests()
    {
        _userClientRepository = Substitute.For<IUserClientRepository>();
        _mapper = Substitute.For<IMapper>();
        _handler = new GetAllUserClientsQueryHandler(_userClientRepository, _mapper);
    }

    [Fact]
    public async Task Given_ValidRequest_When_HandleIsCalled_Then_ReturnsListOfUserClientDtos()
    {
        // Arrange
        var query = new GetAllUserClientsQuery();

        var userClients = new List<UserClient>
        {
            new UserClient { /* Initialize properties */ },
            new UserClient { /* Initialize properties */ }
        };

        var userClientDtos = new List<UserClientDto>
        {
            new UserClientDto { /* Initialize properties */ },
            new UserClientDto { /* Initialize properties */ }
        };

        _userClientRepository.GetAllAsync().Returns(userClients);
        _mapper.Map<List<UserClientDto>>(userClients).Returns(userClientDtos);

        // Act
        var response = await _handler.Handle(query, CancellationToken.None);

        // Assert
        Assert.NotNull(response);
        Assert.Equal(userClientDtos.Count, response.Count);
        _userClientRepository.Received(1).GetAllAsync();
        _mapper.Received(1).Map<List<UserClientDto>>(userClients);
    }

    [Fact]
    public async Task Given_EmptyUserClients_When_HandleIsCalled_Then_ReturnsEmptyList()
    {
        // Arrange
        var query = new GetAllUserClientsQuery();

        var userClients = new List<UserClient>();
        var userClientDtos = new List<UserClientDto>();

        _userClientRepository.GetAllAsync().Returns(userClients);
        _mapper.Map<List<UserClientDto>>(userClients).Returns(userClientDtos);

        // Act
        var response = await _handler.Handle(query, CancellationToken.None);

        // Assert
        Assert.NotNull(response);
        Assert.Empty(response);
        _userClientRepository.Received(1).GetAllAsync();
        _mapper.Received(1).Map<List<UserClientDto>>(userClients);
    }
}
