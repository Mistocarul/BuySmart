using Application.DTOs;
using Application.QueryHandlers.UserClientQueryHandlers;
using Application.Queries.UserClientQueries;
using AutoMapper;
using Domain.Entities;
using Domain.Repositories;
using NSubstitute;

namespace BuySmart.Application.UnitTests.UserClientHandlersTests
{
    public class GetAllUserClientsQueryHandlerTests
    {
        private readonly IUserRepository<UserClient> userClientRepository;
        private readonly IMapper mapper;
        private readonly GetAllUserClientsQueryHandler handler;

        public GetAllUserClientsQueryHandlerTests()
        {
            userClientRepository = Substitute.For<IUserRepository<UserClient>>();
            mapper = Substitute.For<IMapper>();
            handler = new GetAllUserClientsQueryHandler(userClientRepository, mapper);
        }

        [Fact]
        public async Task Handle_ShouldReturnMappedUserClients_WhenUserClientsExist()
        {
            // Arrange
            var query = new GetAllUserClientsQuery();
            var userClients = new List<UserClient>
            {
                new UserClient { UserId = Guid.NewGuid(), Name = "UserClient1", Email = "user1@example.com" },
                new UserClient { UserId = Guid.NewGuid(), Name = "UserClient2", Email = "user2@example.com" }
            };
            var userClientDtos = new List<UserClientDto>
            {
                new UserClientDto { UserId = userClients[0].UserId, Name = "UserClient1", Email = "user1@example.com" },
                new UserClientDto { UserId = userClients[1].UserId, Name = "UserClient2", Email = "user2@example.com" }
            };

            userClientRepository.GetAllAsync().Returns(userClients);
            mapper.Map<List<UserClientDto>>(userClients).Returns(userClientDtos);

            // Act
            var result = await handler.Handle(query, CancellationToken.None);

            // Assert
            Assert.Equal(userClientDtos.Count, result.Count);
            Assert.Equal(userClientDtos[0].UserId, result[0].UserId);
            Assert.Equal(userClientDtos[1].UserId, result[1].UserId);
            await userClientRepository.Received(1).GetAllAsync();
        }

        [Fact]
        public async Task Handle_ShouldReturnEmptyList_WhenNoUserClientsExist()
        {
            // Arrange
            var query = new GetAllUserClientsQuery();
            var userClients = new List<UserClient>();
            var userClientDtos = new List<UserClientDto>();

            userClientRepository.GetAllAsync().Returns(userClients);
            mapper.Map<List<UserClientDto>>(userClients).Returns(userClientDtos);

            // Act
            var result = await handler.Handle(query, CancellationToken.None);

            // Assert
            Assert.Empty(result);
            await userClientRepository.Received(1).GetAllAsync();
        }
    }
}




