using Application.DTOs;
using Application.Queries.ReviewBusinessQueries;
using Application.QueryHandlers.ReviewBusinessQueryHandlers;
using AutoMapper;
using Domain.Entities;
using Domain.Repositories;
using FluentAssertions;
using NSubstitute;

namespace Application.Tests.QueryHandlers.ReviewBusinessQueryHandlers
{
    public class GetFilteredReviewBusinessesQueryHandlerTests
    {
        private readonly IReviewBusinessRepository _repository;
        private readonly IMapper _mapper;
        private readonly GetFilteredReviewBusinessesQueryHandler _handler;

        public GetFilteredReviewBusinessesQueryHandlerTests()
        {
            _repository = Substitute.For<IReviewBusinessRepository>();
            _mapper = Substitute.For<IMapper>();
            _handler = new GetFilteredReviewBusinessesQueryHandler(_repository, _mapper);
        }

        [Fact]
        public async Task Handle_WithFilter_ShouldReturnFilteredPagedResult()
        {
            // Arrange
            var reviews = new List<Review>
            {
                new Review { ReviewId = Guid.NewGuid(), Rating = 5, Comment = "Great!" },
                new Review { ReviewId = Guid.NewGuid(), Rating = 4, Comment = "Good" }
            };
            _repository.GetAllAsync().Returns(reviews);

            var reviewDtos = new List<ReviewDto>
            {
                new ReviewDto { ReviewId = reviews[0].ReviewId, Rating = 5, Comment = "Great!" },
                new ReviewDto { ReviewId = reviews[1].ReviewId, Rating = 4, Comment = "Good" }
            };
            _mapper.Map<List<ReviewDto>>(Arg.Any<IEnumerable<Review>>()).Returns(reviewDtos);

            var query = new GetFilteredReviewBusinessesQuery
            {
                Page = 1,
                PageSize = 10,
                Filter = r => r.Rating >= 4
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
            var reviews = new List<Review>
            {
                new Review { ReviewId = Guid.NewGuid(), Rating = 5, Comment = "Great!" },
                new Review { ReviewId = Guid.NewGuid(), Rating = 4, Comment = "Good" }
            };
            _repository.GetAllAsync().Returns(reviews);

            var reviewDtos = new List<ReviewDto>
            {
                new ReviewDto { ReviewId = reviews[0].ReviewId, Rating = 5, Comment = "Great!" },
                new ReviewDto { ReviewId = reviews[1].ReviewId, Rating = 4, Comment = "Good" }
            };
            _mapper.Map<List<ReviewDto>>(Arg.Any<IEnumerable<Review>>()).Returns(reviewDtos);

            var query = new GetFilteredReviewBusinessesQuery
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

