using Application.DTOs;
using Application.Queries.UserBusinessQueries;
using Application.QueryHandlers.UserBusinessQueryHandlers;
using AutoMapper;
using Domain.Entities;
using Domain.Repositories;
using FluentAssertions;
using NSubstitute;

namespace Application.Tests.QueryHandlers.UserBusinessQueryHandlers
{
    public class GetFilteredUserBusinessesQueryHandlerTests
    {
        private readonly IUserRepository<UserBusiness> _repository;
        private readonly IMapper _mapper;
        private readonly GetFilteredUserBusinessesQueryHandler _handler;

        public GetFilteredUserBusinessesQueryHandlerTests()
        {
            _repository = Substitute.For<IUserRepository<UserBusiness>>();
            _mapper = Substitute.For<IMapper>();
            _handler = new GetFilteredUserBusinessesQueryHandler(_repository, _mapper);
        }

        [Fact]
        public async Task Handle_WithFilter_ShouldReturnFilteredPagedResult()
        {
            // Arrange
            var userBusinesses = new List<UserBusiness>
            {
                new UserBusiness { UserId = Guid.NewGuid(), Name = "Business1", UserType = UserType.Business },
                new UserBusiness { UserId = Guid.NewGuid(), Name = "Business2", UserType = UserType.Business }
            };
            _repository.GetAllAsync().Returns(userBusinesses);

            var userBusinessDtos = new List<UserBusinessDto>
            {
                new UserBusinessDto { UserId = userBusinesses[0].UserId, Name = "Business1", UserType = UserType.Business },
                new UserBusinessDto { UserId = userBusinesses[1].UserId, Name = "Business2", UserType = UserType.Business }
            };
            _mapper.Map<List<UserBusinessDto>>(Arg.Any<IEnumerable<UserBusiness>>()).Returns(userBusinessDtos);

            var query = new GetFilteredUserBusinessesQuery
            {
                Page = 1,
                PageSize = 10,
                Filter = ub => ub.UserType == UserType.Business
            };
            var cancellationToken = CancellationToken.None;

            // Act
            var result = await _handler.Handle(query, cancellationToken);

            // Assert
            result.IsSuccess.Should().BeTrue();
            result.Data.TotalCount.Should().Be(2);
            result.Data.Data.Should().HaveCount(2);
        }

        [Fact]
        public async Task Handle_WithoutFilter_ShouldReturnPagedResult()
        {
            // Arrange
            var userBusinesses = new List<UserBusiness>
            {
                new UserBusiness { UserId = Guid.NewGuid(), Name = "Business1", UserType = UserType.Business },
                new UserBusiness { UserId = Guid.NewGuid(), Name = "Business2", UserType = UserType.Business }
            };
            _repository.GetAllAsync().Returns(userBusinesses);

            var userBusinessDtos = new List<UserBusinessDto>
            {
                new UserBusinessDto { UserId = userBusinesses[0].UserId, Name = "Business1", UserType = UserType.Business },
                new UserBusinessDto { UserId = userBusinesses[1].UserId, Name = "Business2", UserType = UserType.Business }
            };
            _mapper.Map<List<UserBusinessDto>>(Arg.Any<IEnumerable<UserBusiness>>()).Returns(userBusinessDtos);

            var query = new GetFilteredUserBusinessesQuery
            {
                Page = 1,
                PageSize = 10,
                Filter = null
            };
            var cancellationToken = CancellationToken.None;

            // Act
            var result = await _handler.Handle(query, cancellationToken);

            // Assert
            result.IsSuccess.Should().BeTrue();
            result.Data.TotalCount.Should().Be(2);
            result.Data.Data.Should().HaveCount(2);
        }
    }
}
