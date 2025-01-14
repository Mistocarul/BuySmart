using Application.Commands.ReviewBusinessCommands;
using Application.DTOs;
using Application.Queries.ReviewBusinessQueries;
using Application.Utils;
using BuySmart.Controllers;
using Domain.Common;
using MediatR;
using Microsoft.AspNetCore.Mvc;
using NSubstitute;

namespace BuySmart.UnitTests
{
    public class ReviewBusinessControllerTests
    {
        private readonly IMediator _mediator;
        private readonly ReviewBusinessController _controller;

        public ReviewBusinessControllerTests()
        {
            _mediator = Substitute.For<IMediator>();
            _controller = new ReviewBusinessController(_mediator);
        }

        [Fact]
        public async Task GetAllReviewBusinesses_ShouldReturnOk()
        {
            var reviews = new List<ReviewDto>
            {
                new ReviewDto { ReviewId = Guid.NewGuid(), UserClientId = Guid.NewGuid(), Rating = 5, Comment = "Great!" },
                new ReviewDto { ReviewId = Guid.NewGuid(), UserClientId = Guid.NewGuid(), Rating = 4, Comment = "Good!" }
            };
            _mediator.Send(Arg.Any<GetAllReviewBusinessesQuery>()).Returns(reviews);

            var response = await _controller.GetAllReviewBusinesses();

            var actionResult = Assert.IsType<OkObjectResult>(response);
            Assert.Equal(reviews, actionResult.Value);
        }


        [Fact]
        public async Task GetPaginatedReviewBusinesses_ShouldReturnNotFound_WhenFailed()
        {
            var result = Result<PagedResult<ReviewDto>>.Failure("Error");
            _mediator.Send(Arg.Any<GetFilteredReviewBusinessesQuery>()).Returns(result);

            var response = await _controller.GetFilteredReviewBusinesses(1, 10, "test");

            var actionResult = Assert.IsType<NotFoundObjectResult>(response.Result);
            Assert.Equal(result.ErrorMessage, actionResult.Value);
        }

       

        [Fact]
        public async Task CreateReview_ShouldReturnCreated()
        {
            var command = new CreateReviewBusinessCommand
            {
                UserClientId = Guid.NewGuid(),
                BusinessId = Guid.NewGuid(),
                Rating = 5,
                Comment = "Excellent!"
            };
            var result = Result<Guid>.Success(Guid.NewGuid());
            _mediator.Send(command).Returns(result);

            var response = await _controller.CreateReview(command);

            var actionResult = Assert.IsType<CreatedAtActionResult>(response.Result);
            Assert.Equal(result.Data, actionResult.Value);
        }

        [Fact]
        public async Task CreateReview_ShouldReturnBadRequest_WhenFailed()
        {
            var command = new CreateReviewBusinessCommand
            {
                UserClientId = Guid.NewGuid(),
                BusinessId = Guid.NewGuid(),
                Rating = 5,
                Comment = "Excellent!"
            };
            var result = Result<Guid>.Failure("Error");
            _mediator.Send(command).Returns(result);

            var response = await _controller.CreateReview(command);

            var actionResult = Assert.IsType<BadRequestObjectResult>(response.Result);
            Assert.Equal(result.ErrorMessage, actionResult.Value);
        }

        [Fact]
        public async Task UpdateReview_ShouldReturnNoContent()
        {
            var command = new UpdateReviewBusinessCommand
            {
                ReviewId = Guid.NewGuid(),
                UserClientId = Guid.NewGuid(),
                BusinessId = Guid.NewGuid(),
                Rating = 5,
                Comment = "Excellent!"
            };
            var result = Result<object>.Success(null);
            _mediator.Send(command).Returns(result);

            var response = await _controller.UpdateReview(command.ReviewId, command);
            var actionResult = Assert.IsType<ActionResult<Result<object>>>(response);
            Assert.IsType<NoContentResult>(actionResult.Result);

            
        }

        [Fact]
        public async Task UpdateReview_ShouldReturnBadRequest_WhenIdMismatch()
        {
            // Arrange
            var command = new UpdateReviewBusinessCommand
            {
                ReviewId = Guid.NewGuid(),
                UserClientId = Guid.NewGuid(),
                BusinessId = Guid.NewGuid(),
                Rating = 5,
                Comment = "Excellent!"
            };

            // Act
            var response = await _controller.UpdateReview(Guid.NewGuid(), command);

            // Assert
            var actionResult = Assert.IsType<ActionResult<Result<object>>>(response);
            Assert.IsType<BadRequestResult>(actionResult.Result);
        }



        [Fact]
        public async Task DeleteReviewById_ShouldReturnNoContent()
        {
            var reviewId = Guid.NewGuid();

            var response = await _controller.DeleteReviewById(reviewId);

            Assert.IsType<NoContentResult>(response);
        }
    }
}


