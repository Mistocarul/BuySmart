using Application.Commands.CategoryCommands;
using Application.DTOs;
using Application.Queries.CategoryQueries;
using Domain.Common;
using MediatR;
using Microsoft.AspNetCore.Mvc;

namespace BuySmart.Controllers
{
    [Route("api/v1/[controller]")]
    [ApiController]
    public class CategoryController : ControllerBase
    {
        private readonly IMediator mediator;
        public CategoryController(IMediator mediator)
        {
            this.mediator = mediator;
        }

        [HttpGet("GetAllCategories")]
        public async Task<IActionResult> GetAllCategories()
        {
            var categories = await mediator.Send(new GetAllCategoriesQuery());
            return Ok(categories);
        }

        [HttpGet("GetCategoryById/{id}")]
        public async Task<ActionResult<CategoryDto>> GetCategoryById(Guid id)
        {
            return await mediator.Send(new GetCategoryByIdQuery { Id = id });
        }

        [HttpPost("CreateCategory")]
        public async Task<ActionResult<Result<Guid>>> CreateCategory([FromBody] CreateCategoryCommand command)
        {
            var result = await mediator.Send(command);
            if (!result.IsSuccess)
            {
                return BadRequest(result.ErrorMessage);
            }
            return CreatedAtAction(nameof(CreateCategory), new { id = result.Data }, result.Data);
        }

        [HttpDelete("DeleteCategory/{id:guid}")]
        public async Task<ActionResult> DeleteCategoryById(Guid id)
        {
            await mediator.Send(new DeleteCategoryCommand { Id = id });
            return NoContent();
        }

        [HttpPut("UpdateCategory/{id:guid}")]
        public async Task<ActionResult<Result<object>>> UpdateCategory(Guid id, [FromBody] UpdateCategoryCommand command)
        {
            if (id != command.CategoryId)
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

    }
}
