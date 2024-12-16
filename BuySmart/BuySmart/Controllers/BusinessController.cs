using Application.Commands.BusinessCommands;
using Application.DTOs;
using Application.Queries.BusinessQueries;
using Application.Utils;
using Domain.Common;
using Domain.Entities;
using MediatR;
using Microsoft.AspNetCore.Mvc;
using System.Linq.Expressions;

namespace BuySmart.Controllers
{
    [Route("api/v1/[controller]")]
    [ApiController]
    public class BusinessController : ControllerBase
    {
        private readonly IMediator mediator;
        public BusinessController(IMediator mediator)
        {
            this.mediator = mediator;
        }
        [HttpGet("GetAllBusinesses")]
        public async Task<IActionResult> GetAllBusinesses()
        {
            var businesses = await mediator.Send(new GetAllBusinessesQuery());
            return Ok(businesses);
        }

        [HttpGet("GetPaginatedBusinesses")]
        public async Task<ActionResult<PagedResult<BusinessDto>>> GetFilteredBusinesses([FromQuery] int page, [FromQuery] int pageSize, [FromQuery] string? keyword)
        {
            Expression<Func<Business, bool>> filter = m =>
            string.IsNullOrEmpty(keyword) || m.Description.Contains(keyword);
            var query = new GetFilteredBusinessesQuery
            {
                Page = page,
                PageSize = pageSize,
                Filter = null
            };
            if (!string.IsNullOrEmpty(keyword))
            {
                query.Filter = filter;
            }
            var result = await mediator.Send(query);
            if (result.IsSuccess)
            {
                return Ok(result.Data);
            }
            return NotFound(result.ErrorMessage);
        }

        [HttpGet("GetBusinessById/{id}")]
        public async Task<ActionResult<BusinessDto>> GetBusinessById(Guid id)
        {
            return await mediator.Send(new GetBusinessByIdQuery { Id = id });
        }

        [HttpPost("CreateBusiness")]
        public async Task<ActionResult<Result<Guid>>> CreateBusiness([FromBody] CreateBusinessCommand command)
        {
            var result = await mediator.Send(command);
            if (!result.IsSuccess)
            {
                return BadRequest(result.ErrorMessage);
            }
            return CreatedAtAction(nameof(CreateBusiness), new { id = result.Data }, result.Data);
        }

        [HttpDelete("DeleteBusiness/{id:guid}")]
        public async Task<ActionResult> DeleteBusinessById(Guid id)
        {
            await mediator.Send(new DeleteBusinessCommand { BusinessID = id });
            return NoContent();
        }

        [HttpPut("UpdateBusiness/{id:guid}")]
        public async Task<ActionResult<Result<object>>> UpdateBusiness(Guid id, [FromBody] UpdateBusinessCommand command)
        {
            if (id != command.BusinessID)
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
