using Application.CommandHandlers.ReviewBusinessCommandHandler;
using Application.Commands.ReviewBusinessCommands;
using AutoMapper;
using Domain.Common;
using Domain.Entities;
using Domain.Repositories;
using NSubstitute;
using Xunit;

namespace BuySmart.Application.UnitTests.ReviewBusinessHandlersTests
{
    public class UpdateReviewBusinessCommandHandlerTest
    {
        private readonly IMapper _mapper;
        private readonly IReviewBusinessRepository _reviewBusinessRepository;
        private readonly UpdateReviewBusinessCommandHandler _handler;

        public UpdateReviewBusinessCommandHandlerTest()
        {
            _mapper = Substitute.For<IMapper>();
            _reviewBusinessRepository = Substitute.For<IReviewBusinessRepository>();
            _handler = new UpdateReviewBusinessCommandHandler(_reviewBusinessRepository, _mapper);
        }

        [Fact]
        public async Task Handle_ShouldReturnSuccessResult_WhenReviewIsUpdatedSuccessfully()
        {
            var command = new UpdateReviewBusinessCommand
            {
                ReviewId = Guid.NewGuid(),
                UserClientId = Guid.NewGuid(),
                BusinessId = Guid.NewGuid(),
                Rating = 4,
                Comment = "Updated review"
            };
            var review = new Review
            {
                ReviewId = command.ReviewId,
                UserClientId = command.UserClientId,
                BusinessId = command.BusinessId,
                Rating = command.Rating,
                Comment = command.Comment
            };
            var result = Result<object>.Success(new object());

            _reviewBusinessRepository.GetByIdAsync(command.ReviewId).Returns(review);
            _mapper.Map<Review>(command).Returns(review);
            _reviewBusinessRepository.UpdateAsync(review).Returns(result);

            var response = await _handler.Handle(command, CancellationToken.None);

            Assert.True(response.IsSuccess);
            Assert.Equal(result.Data, response.Data);
            await _reviewBusinessRepository.Received(1).GetByIdAsync(command.ReviewId);
            await _reviewBusinessRepository.Received(1).UpdateAsync(review);
        }

        [Fact]
        public async Task Handle_ShouldReturnFailureResult_WhenReviewNotFound()
        {
            var command = new UpdateReviewBusinessCommand
            {
                ReviewId = Guid.NewGuid(),
                UserClientId = Guid.NewGuid(),
                BusinessId = Guid.NewGuid(),
                Rating = 4,
                Comment = "Updated review"
            };

            _reviewBusinessRepository.GetByIdAsync(command.ReviewId).Returns((Review)null);

            var response = await _handler.Handle(command, CancellationToken.None);

            Assert.False(response.IsSuccess);
            Assert.Equal("Review not found", response.ErrorMessage);
            await _reviewBusinessRepository.Received(1).GetByIdAsync(command.ReviewId);
        }

        [Fact]
        public async Task Handle_ShouldReturnFailureResult_WhenReviewUpdateFails()
        {
            var command = new UpdateReviewBusinessCommand
            {
                ReviewId = Guid.NewGuid(),
                UserClientId = Guid.NewGuid(),
                BusinessId = Guid.NewGuid(),
                Rating = 4,
                Comment = "Updated review"
            };
            var review = new Review
            {
                ReviewId = command.ReviewId,
                UserClientId = command.UserClientId,
                BusinessId = command.BusinessId,
                Rating = command.Rating,
                Comment = command.Comment
            };
            var result = Result<object>.Failure("Error message");

            _reviewBusinessRepository.GetByIdAsync(command.ReviewId).Returns(review);
            _mapper.Map<Review>(command).Returns(review);
            _reviewBusinessRepository.UpdateAsync(review).Returns(result);

            var response = await _handler.Handle(command, CancellationToken.None);

            Assert.False(response.IsSuccess);
            Assert.Equal(result.ErrorMessage, response.ErrorMessage);
            await _reviewBusinessRepository.Received(1).GetByIdAsync(command.ReviewId);
            await _reviewBusinessRepository.Received(1).UpdateAsync(review);
        }
    }
}