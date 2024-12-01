using Application.DTOs;
using Application.Queries.UserClientQueries;
using Application.QueryHandlers.UserClientQueryHandlers;
using AutoMapper;
using Domain.Entities;
using Domain.Repositories;
using NSubstitute;
using Xunit;

namespace BuySmart.Application.UnitTests.UserClientHandlersTests
{
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
            var query = new GetAllUserClientsQuery { pageNumber = 1, pageSize = 10 };

            var userClients = new List<UserClient>
            {
                new UserClient
                {
                    UserId = Guid.NewGuid(),
                    Name = "John Doe",
                    Email = "john.doe@example.com",
                    Password = "password123",
                    UserType = UserType.Client,
                    Image = "image1.png",
                    Orders = new List<Order>(),
                    Reviews = new List<Review>(),
                    Histories = new List<History>(),
                    Recommendations = new List<Recommendation>(),
                    Cart = null
                },
                new UserClient
                {
                    UserId = Guid.NewGuid(),
                    Name = "Jane Smith",
                    Email = "jane.smith@example.com",
                    Password = "password456",
                    UserType = UserType.Client,
                    Image = "image2.png",
                    Orders = new List<Order>(),
                    Reviews = new List<Review>(),
                    Histories = new List<History>(),
                    Recommendations = new List<Recommendation>(),
                    Cart = null
                }
            };

            var userClientDtos = new List<UserClientDto>
            {
                new UserClientDto
                {
                    UserId = userClients[0].UserId,
                    Name = userClients[0].Name,
                    Email = userClients[0].Email,
                    UserType = userClients[0].UserType,
                    Image = userClients[0].Image
                },
                new UserClientDto
                {
                    UserId = userClients[1].UserId,
                    Name = userClients[1].Name,
                    Email = userClients[1].Email,
                    UserType = userClients[1].UserType,
                    Image = userClients[1].Image
                }
            };

            _userClientRepository.GetAllAsync(query.pageNumber, query.pageSize).Returns(userClients);
            _mapper.Map<List<UserClientDto>>(userClients).Returns(userClientDtos);

            // Act
            var response = await _handler.Handle(query, CancellationToken.None);

            // Assert
            Assert.NotNull(response);
            Assert.Equal(userClientDtos.Count, response.Count);
            await _userClientRepository.Received(1).GetAllAsync(query.pageNumber, query.pageSize);
            _mapper.Received(1).Map<List<UserClientDto>>(userClients);
        }

        [Fact]
        public async Task Given_EmptyUserClients_When_HandleIsCalled_Then_ReturnsEmptyList()
        {
            // Arrange
            var query = new GetAllUserClientsQuery { pageNumber = 1, pageSize = 10 };

            var userClients = new List<UserClient>();
            var userClientDtos = new List<UserClientDto>();

            _userClientRepository.GetAllAsync(query.pageNumber, query.pageSize).Returns(userClients);
            _mapper.Map<List<UserClientDto>>(userClients).Returns(userClientDtos);

            // Act
            var response = await _handler.Handle(query, CancellationToken.None);

            // Assert
            Assert.NotNull(response);
            Assert.Empty(response);
            await _userClientRepository.Received(1).GetAllAsync(query.pageNumber, query.pageSize);
            _mapper.Received(1).Map<List<UserClientDto>>(userClients);
        }
    }
}
