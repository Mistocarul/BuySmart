using Application.DTOs;
using Application.Queries.ReviewBusinessQueries;
using Application.QueryHandlers.ReviewBusinessQueryHandlers;
using AutoMapper;
using Domain.Entities;
using Domain.Repositories;
using NSubstitute;

namespace BuySmart.Application.UnitTests.QueryHandlersTests
{
    public class GetReviewBusinessByIdQueryHandlerTest
    {
        private readonly IReviewBusinessRepository reviewBusinessRepository;
        private readonly IMapper mapper;
        private readonly GetReviewBusinessByIdQueryHandler handler;

        public GetReviewBusinessByIdQueryHandlerTest()
        {
            reviewBusinessRepository = Substitute.For<IReviewBusinessRepository>();
            mapper = Substitute.For<IMapper>();
            handler = new GetReviewBusinessByIdQueryHandler(reviewBusinessRepository, mapper);
        }

        [Fact]
        public async Task Handle_ShouldReturnReviewDto_WhenReviewExists()
        {
            // Arrange
            var query = new GetReviewBusinessByIdQuery { Id = Guid.NewGuid() };
            var review = new Review
            {
                ReviewId = query.Id,
                UserClientId = Guid.NewGuid(),
                BusinessId = Guid.NewGuid(),
                Rating = 5,
                Comment = "Great service!",
                ReviewDate = DateTime.UtcNow
            };

            var reviewDto = new ReviewDto
            {
                ReviewId = review.ReviewId,
                UserClientId = review.UserClientId,
                BusinessId = review.BusinessId,
                Rating = review.Rating,
                Comment = review.Comment
            };

            reviewBusinessRepository.GetByIdAsync(query.Id).Returns(review);
            mapper.Map<ReviewDto>(review).Returns(reviewDto);

            // Act
            var result = await handler.Handle(query, CancellationToken.None);

            // Assert
            Assert.Equal(reviewDto, result);
        }

        [Fact]
        public async Task Handle_ShouldReturnNull_WhenReviewDoesNotExist()
        {
            // Arrange
            var query = new GetReviewBusinessByIdQuery { Id = Guid.NewGuid() };
            reviewBusinessRepository.GetByIdAsync(query.Id).Returns((Review)null);

            // Act
            var result = await handler.Handle(query, CancellationToken.None);

            // Assert
            Assert.Null(result);
        }
    }
}