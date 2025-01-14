using System.Linq.Expressions;
using Application.DTOs;
using Application.Queries.BusinessQueries;
using Application.QueryHandlers.BusinessQueryHandlers;
using AutoMapper;
using Domain.Entities;
using Domain.Repositories;
using FluentAssertions;
using NSubstitute;

namespace Application.UnitTests.QueryHandlers.BusinessQueryHandlers
{
    public class GetFilteredBusinessesQueryHandlerTests
    {
        private readonly IBusinessRepository _businessRepository;
        private readonly IMapper _mapper;
        private readonly GetFilteredBusinessesQueryHandler _handler;

        public GetFilteredBusinessesQueryHandlerTests()
        {
            _businessRepository = Substitute.For<IBusinessRepository>();
            _mapper = Substitute.For<IMapper>();
            _handler = new GetFilteredBusinessesQueryHandler(_businessRepository, _mapper);
        }

        [Fact]
        public async Task Handle_WithFilter_ShouldReturnFilteredBusinesses()
        {
            // Arrange
            var businesses = new List<Business>
            {
                new Business { BusinessID = Guid.NewGuid(), Name = "Business 1" },
                new Business { BusinessID = Guid.NewGuid(), Name = "Business 2" }
            };
            _businessRepository.GetAllAsync().Returns(businesses);

            Expression<Func<Business, bool>> filter = b => b.Name.Contains("1");
            var query = new GetFilteredBusinessesQuery
            {
                Page = 1,
                PageSize = 10,
                Filter = filter
            };

            var filteredBusinesses = businesses.AsQueryable().Where(filter).ToList();
            var businessDtos = new List<BusinessDto>
            {
                new BusinessDto { Name = "Business 1" }
            };
            _mapper.Map<List<BusinessDto>>(Arg.Any<IEnumerable<Business>>()).Returns(businessDtos);

            // Act
            var result = await _handler.Handle(query, CancellationToken.None);

            // Assert
            result.IsSuccess.Should().BeTrue();
            result.Data.TotalCount.Should().Be(filteredBusinesses.Count);
            result.Data.Data.Should().BeEquivalentTo(businessDtos);
        }

        [Fact]
        public async Task Handle_WithoutFilter_ShouldReturnAllBusinesses()
        {
            // Arrange
            var businesses = new List<Business>
            {
                new Business { BusinessID = Guid.NewGuid(), Name = "Business 1" },
                new Business { BusinessID = Guid.NewGuid(), Name = "Business 2" }
            };
            _businessRepository.GetAllAsync().Returns(businesses);

            var query = new GetFilteredBusinessesQuery
            {
                Page = 1,
                PageSize = 10,
                Filter = null
            };

            var businessDtos = new List<BusinessDto>
            {
                new BusinessDto { Name = "Business 1" },
                new BusinessDto { Name = "Business 2" }
            };
            _mapper.Map<List<BusinessDto>>(Arg.Any<IEnumerable<Business>>()).Returns(businessDtos);

            // Act
            var result = await _handler.Handle(query, CancellationToken.None);

            // Assert
            result.IsSuccess.Should().BeTrue();
            result.Data.TotalCount.Should().Be(businesses.Count);
            result.Data.Data.Should().BeEquivalentTo(businessDtos);
        }

        [Fact]
        public async Task Handle_WithPaging_ShouldReturnPagedBusinesses()
        {
            // Arrange
            var businesses = new List<Business>
            {
                new Business { BusinessID = Guid.NewGuid(), Name = "Business 1" },
                new Business { BusinessID = Guid.NewGuid(), Name = "Business 2" },
                new Business { BusinessID = Guid.NewGuid(), Name = "Business 3" }
            };
            _businessRepository.GetAllAsync().Returns(businesses);

            var query = new GetFilteredBusinessesQuery
            {
                Page = 1,
                PageSize = 2,
                Filter = null
            };

            var pagedBusinesses = businesses.Take(2).ToList();
            var businessDtos = new List<BusinessDto>
            {
                new BusinessDto { Name = "Business 1" },
                new BusinessDto { Name = "Business 2" }
            };
            _mapper.Map<List<BusinessDto>>(Arg.Any<IEnumerable<Business>>()).Returns(businessDtos);

            // Act
            var result = await _handler.Handle(query, CancellationToken.None);

            // Assert
            result.IsSuccess.Should().BeTrue();
            result.Data.TotalCount.Should().Be(businesses.Count);
            result.Data.Data.Should().BeEquivalentTo(businessDtos);
        }
    }
}
