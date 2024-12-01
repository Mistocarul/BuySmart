using Application.DTOs;
using Application.Queries.UserBusinessQueries;
using Application.QueryHandlers.UserBusinessQueryHandlers;
using AutoMapper;
using Domain.Entities;
using Domain.Repositories;
using NSubstitute;

namespace BuySmart.Application.UnitTests.UserBusinessHandlersTests
{
    public class GetUserBusinessByIdQueryHandlerTests
    {
        private readonly IUserBusinessRepository _userBusinessRepository;
        private readonly IMapper _mapper;
        private readonly GetUserBusinessByIdQueryHandler _handler;

        public GetUserBusinessByIdQueryHandlerTests()
        {
            _userBusinessRepository = Substitute.For<IUserBusinessRepository>();
            _mapper = Substitute.For<IMapper>();
            _handler = new GetUserBusinessByIdQueryHandler(_userBusinessRepository, _mapper);
        }

        [Fact]
        public async Task Handle_UserBusinessExists_ReturnsUserBusinessDto()
        {
            // Arrange
            var userId = Guid.NewGuid();
            var query = new GetUserBusinessByIdQuery { Id = userId };
            var userBusiness = new UserBusiness { UserId = userId, Name = "Business", Email = "business@example.com", UserType = UserType.Business, Image = "image.png" };
            var userBusinessDto = new UserBusinessDto { UserId = userId, Name = "Business", Email = "business@example.com", UserType = UserType.Business, Image = "image.png" };

            _userBusinessRepository.GetByIdAsync(userId).Returns(userBusiness);
            _mapper.Map<UserBusinessDto>(userBusiness).Returns(userBusinessDto);

            // Act
            var result = await _handler.Handle(query, CancellationToken.None);

            // Assert
            Assert.Equal(userBusinessDto, result);
        }

        [Fact]
        public async Task Handle_UserBusinessDoesNotExist_ReturnsNull()
        {
            // Arrange
            var userId = Guid.NewGuid();
            var query = new GetUserBusinessByIdQuery { Id = userId };

            _userBusinessRepository.GetByIdAsync(userId).Returns(Task.FromResult<UserBusiness>(null!));

            // Act
            var result = await _handler.Handle(query, CancellationToken.None);

            // Assert
            Assert.Null(result);
        }
    }
}

