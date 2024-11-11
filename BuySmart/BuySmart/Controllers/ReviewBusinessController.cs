using Application.Commands.ReviewBusinessCommands;
using Application.DTOs;
using Application.Queries.ReviewBusinessQueries;
using Domain.Common;
using MediatR;
using Microsoft.AspNetCore.Mvc;

namespace BuySmart.Controllers
{
    [Route("api/v1/[controller]")]
    [ApiController]
    public class ReviewBusinessController : ControllerBase
    {
        private readonly IMediator mediator;
        public ReviewBusinessController(IMediator mediator)
        {
            this.mediator = mediator;
        }

        [HttpGet("GetAllReviewBusinesses")]
        public async Task<IActionResult> GetAllReviewBusinesses()
        {
            var reviews = await mediator.Send(new GetAllReviewBusinessesQuery());
            return Ok(reviews);
        }

        [HttpGet("GetReviewBusinessById/{id}")]
        public async Task<ActionResult<ReviewDto>> GetReviewById(Guid id)
        {
            return await mediator.Send(new GetReviewBusinessByIdQuery { Id = id });
        }

        [HttpPost("CreateReviewBusiness")]
        public async Task<ActionResult<Result<Guid>>> CreateReview([FromBody] CreateReviewBusinessCommand command)
        {
            var result = await mediator.Send(command);
            if (!result.IsSuccess)
            {
                return BadRequest(result.ErrorMessage);
            }
            return CreatedAtAction(nameof(CreateReview), new { id = result.Data }, result.Data);
        }

        [HttpPut("UpdateReviewBusiness/{id:guid}")]
        public async Task<ActionResult<Result<object>>>UpdateReview(Guid id, [FromBody] UpdateReviewBusinessCommand command)
        {
            if (id != command.ReviewId)
            {
                return BadRequest();
            }
            var result = await mediator.Send(command);
            if (!result.IsSuccess)
            {
                return BadRequest(result.ErrorMessage);
            }
            return NoContent();
        }

        [HttpDelete("{id:guid}")]
        public async Task<ActionResult> DeleteReviewById(Guid id)
        {
            await mediator.Send(new DeleteReviewBusinessCommand { ReviewId = id });
            return NoContent();
        }
    }
}
