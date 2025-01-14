using Application.DTOs;
using Application.Queries.UserClientQueries;
using Application.QueryHandlers.UserClientQueryHandlers;
using AutoMapper;
using Domain.Entities;
using Domain.Repositories;
using FluentAssertions;
using NSubstitute;

namespace Application.Tests.QueryHandlers.UserClientQueryHandlers
{
    public class GetFilteredUserClientsQueryHandlerTests
    {
        private readonly IUserRepository<UserClient> _repository;
        private readonly IMapper _mapper;
        private readonly GetFilteredUserClientsQueryHandler _handler;

        public GetFilteredUserClientsQueryHandlerTests()
        {
            _repository = Substitute.For<IUserRepository<UserClient>>();
            _mapper = Substitute.For<IMapper>();
            _handler = new GetFilteredUserClientsQueryHandler(_repository, _mapper);
        }

        [Fact]
        public async Task Handle_WithFilter_ShouldReturnFilteredPagedResult()
        {
            // Arrange
            var userClients = new List<UserClient>
            {
                new UserClient { UserId = Guid.NewGuid(), Name = "John Doe", Email = "john@example.com" },
                new UserClient { UserId = Guid.NewGuid(), Name = "Jane Doe", Email = "jane@example.com" }
            };
            _repository.GetAllAsync().Returns(userClients);

            var userClientDtos = new List<UserClientDto>
            {
                new UserClientDto { UserId = userClients[0].UserId, Name = "John Doe", Email = "john@example.com" },
                new UserClientDto { UserId = userClients[1].UserId, Name = "Jane Doe", Email = "jane@example.com" }
            };
            _mapper.Map<List<UserClientDto>>(Arg.Any<IEnumerable<UserClient>>()).Returns(userClientDtos);

            var query = new GetFilteredUserClientsQuery
            {
                Page = 1,
                PageSize = 10,
                Filter = u => u.Name.Contains("Doe")
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
            var userClients = new List<UserClient>
            {
                new UserClient { UserId = Guid.NewGuid(), Name = "John Doe", Email = "john@example.com" },
                new UserClient { UserId = Guid.NewGuid(), Name = "Jane Doe", Email = "jane@example.com" }
            };
            _repository.GetAllAsync().Returns(userClients);

            var userClientDtos = new List<UserClientDto>
            {
                new UserClientDto { UserId = userClients[0].UserId, Name = "John Doe", Email = "john@example.com" },
                new UserClientDto { UserId = userClients[1].UserId, Name = "Jane Doe", Email = "jane@example.com" }
            };
            _mapper.Map<List<UserClientDto>>(Arg.Any<IEnumerable<UserClient>>()).Returns(userClientDtos);

            var query = new GetFilteredUserClientsQuery
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
