using System;
using System.Threading;
using System.Threading.Tasks;
using Application.CommandHandlers.ReviewBusinessCommandHandler;
using Application.Commands.ReviewBusinessCommands;
using AutoMapper;
using Domain.Common;
using Domain.Entities;
using Domain.Repositories;
using NSubstitute;
using Xunit;

namespace BuySmart.Application.UnitTests.CommandHandlersTests
{
    public class CreateReviewBusinessCommandHandlerTest
    {
        private readonly IMapper _mapper;
        private readonly IReviewBusinessRepository _reviewBusinessRepository;
        private readonly CreateReviewBusinessCommandHandler _handler;

        public CreateReviewBusinessCommandHandlerTest()
        {
            _mapper = Substitute.For<IMapper>();
            _reviewBusinessRepository = Substitute.For<IReviewBusinessRepository>();
            _handler = new CreateReviewBusinessCommandHandler(_reviewBusinessRepository, _mapper);
        }

        [Fact]
        public async Task Handle_ShouldReturnSuccessResult_WhenReviewIsAddedSuccessfully()
        {
            var command = new CreateReviewBusinessCommand
            {
                UserClientId = Guid.NewGuid(),
                BusinessId = Guid.NewGuid(),
                Rating = 5,
                Comment = "Great service!"
            };
            var review = new Review
            {
                ReviewId = Guid.NewGuid(),
                UserClientId = command.UserClientId,
                BusinessId = command.BusinessId,
                Rating = command.Rating,
                Comment = command.Comment
            };
            var result = Result<Guid>.Success(review.ReviewId);

            _mapper.Map<Review>(command).Returns(review);
            _reviewBusinessRepository.AddAsync(review).Returns(result);

            var response = await _handler.Handle(command, CancellationToken.None);

            Assert.True(response.IsSuccess);
            Assert.Equal(result.Data, response.Data);
            await _reviewBusinessRepository.Received(1).AddAsync(review);
        }

        [Fact]
        public async Task Handle_ShouldReturnFailureResult_WhenReviewAdditionFails()
        {
            var command = new CreateReviewBusinessCommand
            {
                UserClientId = Guid.NewGuid(),
                BusinessId = Guid.NewGuid(),
                Rating = 5,
                Comment = "Great service!"
            };
            var review = new Review
            {
                ReviewId = Guid.NewGuid(),
                UserClientId = command.UserClientId,
                BusinessId = command.BusinessId,
                Rating = command.Rating,
                Comment = command.Comment
            };
            var result = Result<Guid>.Failure("Error message");

            _mapper.Map<Review>(command).Returns(review);
            _reviewBusinessRepository.AddAsync(review).Returns(result);

            var response = await _handler.Handle(command, CancellationToken.None);

            Assert.False(response.IsSuccess);
            Assert.Equal(result.ErrorMessage, response.ErrorMessage);
            await _reviewBusinessRepository.Received(1).AddAsync(review);
        }
    }
}