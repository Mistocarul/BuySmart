using Application.DTOs;
using Application.QueryHandlers.ReviewBusinessQueryHandlers;
using Application.Queries.ReviewBusinessQueries;
using AutoMapper;
using Domain.Entities;
using Domain.Repositories;
using NSubstitute;

namespace BuySmart.Application.UnitTests.QueryHandlersTests
{
    public class GetAllReviewBusinessesQueryHandlerTest
    {
        private readonly IMapper _mapper;
        private readonly IReviewBusinessRepository _reviewBusinessRepository;
        private readonly GetAllReviewBusinessesQueryHandler _handler;

        public GetAllReviewBusinessesQueryHandlerTest()
        {
            _mapper = Substitute.For<IMapper>();
            _reviewBusinessRepository = Substitute.For<IReviewBusinessRepository>();
            _handler = new GetAllReviewBusinessesQueryHandler(_reviewBusinessRepository, _mapper);
        }

        [Fact]
        public async Task Handle_ShouldReturnListOfReviewDtos_WhenReviewsExist()
        {
            var reviews = new List<Review>
            {
                new Review
                {
                    ReviewId = Guid.NewGuid(),
                    UserClientId = Guid.NewGuid(),
                    BusinessId = Guid.NewGuid(),
                    Rating = 5,
                    Comment = "Great service!"
                },
                new Review
                {
                    ReviewId = Guid.NewGuid(),
                    UserClientId = Guid.NewGuid(),
                    BusinessId = Guid.NewGuid(),
                    Rating = 4,
                    Comment = "Good service!"
                }
            };

            var reviewDtos = new List<ReviewDto>
            {
                new ReviewDto
                {
                    ReviewId = reviews[0].ReviewId,
                    UserClientId = reviews[0].UserClientId,
                    BusinessId = reviews[0].BusinessId,
                    Rating = reviews[0].Rating,
                    Comment = reviews[0].Comment
                },
                new ReviewDto
                {
                    ReviewId = reviews[1].ReviewId,
                    UserClientId = reviews[1].UserClientId,
                    BusinessId = reviews[1].BusinessId,
                    Rating = reviews[1].Rating,
                    Comment = reviews[1].Comment
                }
            };

            _reviewBusinessRepository.GetAllAsync().Returns(reviews);
            _mapper.Map<List<ReviewDto>>(reviews).Returns(reviewDtos);

            var query = new GetAllReviewBusinessesQuery();
            var response = await _handler.Handle(query, CancellationToken.None);

            Assert.Equal(reviewDtos.Count, response.Count);
            Assert.Equal(reviewDtos[0].ReviewId, response[0].ReviewId);
            Assert.Equal(reviewDtos[1].ReviewId, response[1].ReviewId);
            await _reviewBusinessRepository.Received(1).GetAllAsync();
        }

        [Fact]
        public async Task Handle_ShouldReturnEmptyList_WhenNoReviewsExist()
        {
            var reviews = new List<Review>();
            var reviewDtos = new List<ReviewDto>();

            _reviewBusinessRepository.GetAllAsync().Returns(reviews);
            _mapper.Map<List<ReviewDto>>(reviews).Returns(reviewDtos);

            var query = new GetAllReviewBusinessesQuery();
            var response = await _handler.Handle(query, CancellationToken.None);

            Assert.Empty(response);
            await _reviewBusinessRepository.Received(1).GetAllAsync();
        }
    }
}