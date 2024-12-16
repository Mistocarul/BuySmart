using Application.DTOs;
using Application.QueryHandlers.ReviewBusinessQueryHandlers;
using Application.Queries.ReviewBusinessQueries;
using AutoMapper;
using Domain.Entities;
using Domain.Repositories;
using NSubstitute;

namespace BuySmart.Application.UnitTests.ReviewBusinessHandlersTests
{
    public class GetAllReviewBusinessesQueryHandlerTests
    {
        private readonly IReviewBusinessRepository reviewBusinessRepository;
        private readonly IMapper mapper;
        private readonly GetAllReviewBusinessesQueryHandler handler;

        public GetAllReviewBusinessesQueryHandlerTests()
        {
            reviewBusinessRepository = Substitute.For<IReviewBusinessRepository>();
            mapper = Substitute.For<IMapper>();
            handler = new GetAllReviewBusinessesQueryHandler(reviewBusinessRepository, mapper);
        }

        [Fact]
        public async Task Handle_ShouldReturnMappedReviewBusinesses_WhenReviewBusinessesExist()
        {
            // Arrange
            var query = new GetAllReviewBusinessesQuery();
            var reviewBusinesses = new List<Review>
            {
                new Review { ReviewId = Guid.NewGuid(), Comment = "Review1", Rating = 4.5 },
                new Review { ReviewId = Guid.NewGuid(), Comment = "Review2", Rating = 3.5 }
            };
            var reviewBusinessDtos = new List<ReviewDto>
            {
                new ReviewDto { ReviewId = reviewBusinesses[0].ReviewId, Comment = "Review1", Rating = 4.5 },
                new ReviewDto { ReviewId = reviewBusinesses[1].ReviewId, Comment = "Review2", Rating = 3.5 }
            };

            reviewBusinessRepository.GetAllAsync().Returns(reviewBusinesses);
            mapper.Map<List<ReviewDto>>(reviewBusinesses).Returns(reviewBusinessDtos);

            // Act
            var result = await handler.Handle(query, CancellationToken.None);

            // Assert
            Assert.Equal(reviewBusinessDtos.Count, result.Count);
            Assert.Equal(reviewBusinessDtos[0].ReviewId, result[0].ReviewId);
            Assert.Equal(reviewBusinessDtos[1].ReviewId, result[1].ReviewId);
            await reviewBusinessRepository.Received(1).GetAllAsync();
        }

        [Fact]
        public async Task Handle_ShouldReturnEmptyList_WhenNoReviewBusinessesExist()
        {
            // Arrange
            var query = new GetAllReviewBusinessesQuery();
            var reviewBusinesses = new List<Review>();
            var reviewBusinessDtos = new List<ReviewDto>();

            reviewBusinessRepository.GetAllAsync().Returns(reviewBusinesses);
            mapper.Map<List<ReviewDto>>(reviewBusinesses).Returns(reviewBusinessDtos);

            // Act
            var result = await handler.Handle(query, CancellationToken.None);

            // Assert
            Assert.Empty(result);
            await reviewBusinessRepository.Received(1).GetAllAsync();
        }
    }
}



