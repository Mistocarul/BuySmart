using Application.DTOs;
using Application.QueryHandlers.UserBusinessQueryHandlers;
using Application.Queries.UserBusinessQueries;
using AutoMapper;
using Domain.Entities;
using Domain.Repositories;
using NSubstitute;

namespace BuySmart.Application.UnitTests.UserBusinessHandlersTests
{
    public class GetAllUserBusinessesQueryHandlerTests
    {
        private readonly IUserRepository<UserBusiness> userBusinessRepository;
        private readonly IMapper mapper;
        private readonly GetAllUserBusinessesQueryHandler handler;

        public GetAllUserBusinessesQueryHandlerTests()
        {
            userBusinessRepository = Substitute.For<IUserRepository<UserBusiness>>();
            mapper = Substitute.For<IMapper>();
            handler = new GetAllUserBusinessesQueryHandler(userBusinessRepository, mapper);
        }

        [Fact]
        public async Task Handle_ShouldReturnMappedUserBusinesses_WhenUserBusinessesExist()
        {
            // Arrange
            var query = new GetAllUserBusinessesQuery();
            var userBusinesses = new List<UserBusiness>
            {
                new UserBusiness { UserId = Guid.NewGuid(), Name = "UserBusiness1", Email = "user1@example.com" },
                new UserBusiness { UserId = Guid.NewGuid(), Name = "UserBusiness2", Email = "user2@example.com" }
            };
            var userBusinessDtos = new List<UserBusinessDto>
            {
                new UserBusinessDto { UserId = userBusinesses[0].UserId, Name = "UserBusiness1", Email = "user1@example.com" },
                new UserBusinessDto { UserId = userBusinesses[1].UserId, Name = "UserBusiness2", Email = "user2@example.com" }
            };

            userBusinessRepository.GetAllAsync().Returns(userBusinesses);
            mapper.Map<List<UserBusinessDto>>(userBusinesses).Returns(userBusinessDtos);

            // Act
            var result = await handler.Handle(query, CancellationToken.None);

            // Assert
            Assert.Equal(userBusinessDtos.Count, result.Count);
            Assert.Equal(userBusinessDtos[0].UserId, result[0].UserId);
            Assert.Equal(userBusinessDtos[1].UserId, result[1].UserId);
            await userBusinessRepository.Received(1).GetAllAsync();
        }

        [Fact]
        public async Task Handle_ShouldReturnEmptyList_WhenNoUserBusinessesExist()
        {
            // Arrange
            var query = new GetAllUserBusinessesQuery();
            var userBusinesses = new List<UserBusiness>();
            var userBusinessDtos = new List<UserBusinessDto>();

            userBusinessRepository.GetAllAsync().Returns(userBusinesses);
            mapper.Map<List<UserBusinessDto>>(userBusinesses).Returns(userBusinessDtos);

            // Act
            var result = await handler.Handle(query, CancellationToken.None);

            // Assert
            Assert.Empty(result);
            await userBusinessRepository.Received(1).GetAllAsync();
        }
    }
}



