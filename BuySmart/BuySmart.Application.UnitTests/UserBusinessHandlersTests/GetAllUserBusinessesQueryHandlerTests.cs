using Application.DTOs;
using Application.Queries.UserBusinessQueries;
using Application.QueryHandlers.UserBusinessQueryHandlers;
using AutoMapper;
using Domain.Entities;
using Domain.Repositories;
using NSubstitute;

namespace BuySmart.Application.UnitTests.UserBusinessHandlersTests
{
    public class GetAllUserBusinessesQueryHandlerTests
    {
        private readonly IUserRepository<UserBusiness> _userBusinessRepository;
        private readonly IMapper _mapper;
        private readonly GetAllUserBusinessesQueryHandler _handler;

        public GetAllUserBusinessesQueryHandlerTests()
        {
            _userBusinessRepository = Substitute.For<IUserRepository<UserBusiness>>();
            _mapper = Substitute.For<IMapper>();
            _handler = new GetAllUserBusinessesQueryHandler(_userBusinessRepository, _mapper);
        }

        [Fact]
        public async Task Handle_UserBusinessesExist_ReturnsUserBusinessDtos()
        {
            // Arrange
            var userBusinesses = new List<UserBusiness>
        {
            new UserBusiness { UserId = Guid.NewGuid(), Name = "Business 1", Email = "business1@example.com", UserType = UserType.Business, Image = "image1.png" },
            new UserBusiness { UserId = Guid.NewGuid(), Name = "Business 2", Email = "business2@example.com", UserType = UserType.Business, Image = "image2.png" }
        };
            var userBusinessDtos = new List<UserBusinessDto>
        {
            new UserBusinessDto { UserId = userBusinesses[0].UserId, Name = "Business 1", Email = "business1@example.com", UserType = UserType.Business, Image = "image1.png" },
            new UserBusinessDto { UserId = userBusinesses[1].UserId, Name = "Business 2", Email = "business2@example.com", UserType = UserType.Business, Image = "image2.png" }
        };


        _userBusinessRepository.GetAllAsync(1, 10).Returns(userBusinesses);
        _mapper.Map<List<UserBusinessDto>>(userBusinesses).Returns(userBusinessDtos);


            // Act
            var result = await _handler.Handle(new GetAllUserBusinessesQuery(), CancellationToken.None);

            // Assert
            Assert.Equal(userBusinessDtos, result);
        }

        [Fact]
        public async Task Handle_NoUserBusinessesExist_ReturnsEmptyList()
        {
            // Arrange
            var userBusinesses = new List<UserBusiness>();
            var userBusinessDtos = new List<UserBusinessDto>();


        _userBusinessRepository.GetAllAsync(1, 10).Returns(userBusinesses);
        _mapper.Map<List<UserBusinessDto>>(userBusinesses).Returns(userBusinessDtos);


            // Act
            var result = await _handler.Handle(new GetAllUserBusinessesQuery(), CancellationToken.None);

            // Assert
            Assert.Empty(result);
        }
    }
}

