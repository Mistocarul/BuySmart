using Application.DTOs;
using Application.QueryHandlers.ReviewBusinessQueryHandlers;
using Application.Queries.ReviewBusinessQueries;
using AutoMapper;
using Domain.Entities;
using Domain.Repositories;
using NSubstitute;

namespace BuySmart.Application.UnitTests.ReviewBusinessHandlersTests
{
    public class GetAllReviewBusinessesQueryTest
    {
        private readonly IReviewBusinessRepository repository;
        private readonly IMapper mapper;
        private readonly GetAllReviewBusinessesQueryHandler handler;

        public GetAllReviewBusinessesQueryTest()
        {
            repository = Substitute.For<IReviewBusinessRepository>();
            mapper = Substitute.For<IMapper>();
            handler = new GetAllReviewBusinessesQueryHandler(repository, mapper);
        }

        [Fact]
        public async Task Handle_ShouldReturnListOfReviewDtos_WhenReviewsExist()
        {
            // Arrange
            var reviews = new List<Review>
            {
                new Review { ReviewId = Guid.NewGuid(), UserClientId = Guid.NewGuid(), Rating = 4.5, Comment = "Great!", BusinessId = Guid.NewGuid() },
                new Review { ReviewId = Guid.NewGuid(), UserClientId = Guid.NewGuid(), Rating = 3.0, Comment = "Average", BusinessId = Guid.NewGuid() }
            };

            var reviewDtos = new List<ReviewDto>
            {
                new ReviewDto { ReviewId = reviews[0].ReviewId, UserClientId = reviews[0].UserClientId, Rating = reviews[0].Rating, Comment = reviews[0].Comment, BusinessId = reviews[0].BusinessId },
                new ReviewDto { ReviewId = reviews[1].ReviewId, UserClientId = reviews[1].UserClientId, Rating = reviews[1].Rating, Comment = reviews[1].Comment, BusinessId = reviews[1].BusinessId }
            };

            repository.GetAllAsync(1, 10).Returns(reviews);
            mapper.Map<List<ReviewDto>>(reviews).Returns(reviewDtos);

            var query = new GetAllReviewBusinessesQuery();

            // Act
            var result = await handler.Handle(query, CancellationToken.None);

            // Assert
            Assert.NotNull(result);
            Assert.Equal(2, result.Count);
            Assert.Equal(reviewDtos, result);
        }

        [Fact]
        public async Task Handle_ShouldReturnEmptyList_WhenNoReviewsExist()
        {
            // Arrange
            var reviews = new List<Review>();
            var reviewDtos = new List<ReviewDto>();

            repository.GetAllAsync(1, 10).Returns(reviews);
            mapper.Map<List<ReviewDto>>(reviews).Returns(reviewDtos);

            var query = new GetAllReviewBusinessesQuery();

            // Act
            var result = await handler.Handle(query, CancellationToken.None);

            // Assert
            Assert.NotNull(result);
            Assert.Empty(result);
        }
    }
}
