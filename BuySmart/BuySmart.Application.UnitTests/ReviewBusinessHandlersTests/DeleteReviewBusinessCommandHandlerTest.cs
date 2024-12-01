using Application.CommandHandlers.ReviewBusinessCommandHandlers;
using Application.Commands.ReviewBusinessCommands;
using Domain.Entities;
using Domain.Repositories;
using NSubstitute;

namespace BuySmart.Application.UnitTests.ReviewBusinessHandlersTests
{
    public class DeleteReviewBusinessCommandHandlerTest
    {
        private readonly IReviewBusinessRepository _reviewBusinessRepository;
        private readonly DeleteReviewBusinessCommandHandler _handler;

        public DeleteReviewBusinessCommandHandlerTest()
        {
            _reviewBusinessRepository = Substitute.For<IReviewBusinessRepository>();
            _handler = new DeleteReviewBusinessCommandHandler(_reviewBusinessRepository);
        }

        [Fact]
        public async Task Handle_ShouldReturnSuccessResult_WhenReviewIsDeletedSuccessfully()
        {
            var command = new DeleteReviewBusinessCommand
            {
                ReviewId = Guid.NewGuid()
            };
            var review = new Review
            {
                ReviewId = command.ReviewId,
                UserClientId = Guid.NewGuid(),
                BusinessId = Guid.NewGuid(),
                Rating = 5,
                Comment = "Great service!"
            };

            _reviewBusinessRepository.GetByIdAsync(command.ReviewId).Returns(review);

            var response = await _handler.Handle(command, CancellationToken.None);

            Assert.True(response.IsSuccess);
            Assert.IsType<object>(response.Data);
            Assert.Empty(response.Data.GetType().GetProperties());
            await _reviewBusinessRepository.Received(1).GetByIdAsync(command.ReviewId);
            await _reviewBusinessRepository.Received(1).DeleteAsync(command.ReviewId);
        }

        [Fact]
        public async Task Handle_ShouldReturnFailureResult_WhenReviewNotFound()
        {
            var command = new DeleteReviewBusinessCommand
            {
                ReviewId = Guid.NewGuid()
            };

            _reviewBusinessRepository.GetByIdAsync(command.ReviewId).Returns(Task.FromResult<Review>(null!));

            var response = await _handler.Handle(command, CancellationToken.None);

            Assert.False(response.IsSuccess);
            Assert.Equal("Review not found", response.ErrorMessage);
            await _reviewBusinessRepository.Received(1).GetByIdAsync(command.ReviewId);
        }
    }
}

