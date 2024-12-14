using Application.Commands.UserBusinessCommands;
using Application.DTOs;
using Application.Queries.CategoryQueries;
using Application.Queries.UserBusinessQueries;
using Application.Utils;
using Domain.Common;
using Domain.Entities;
using MediatR;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System.Linq.Expressions;

namespace BuySmart.Controllers
{
    [Route("api/v1/[controller]")]
    [ApiController]
    public class UserBusinessController : ControllerBase
    {
        private readonly IMediator mediator;
        public UserBusinessController(IMediator mediator)
        {
            this.mediator = mediator;
        }
        [HttpPost("CreateUserBusiness")]
        public async Task<ActionResult<Result<Guid>>> CreateUserBusiness([FromBody] CreateUserBusinessCommand command)
        {
            command.Password = BCrypt.Net.BCrypt.HashPassword(command.Password);
            var result = await mediator.Send(command);
            if (!result.IsSuccess)
            {
                return BadRequest(result.ErrorMessage);
            }
            return CreatedAtAction(nameof(CreateUserBusiness), new { id = result.Data }, result.Data);
        }

        [HttpDelete("DeleteUserBusiness/{id:guid}")]
        public async Task<ActionResult> DeleteUserBusiness(Guid id)
        {
            await mediator.Send(new DeleteUserBusinessCommand { UserId = id });
            return NoContent();
        }
        [HttpPut("UpdateUserBusiness/{id:guid}")]

        public async Task<ActionResult<Result<object>>> UpdateUserBusiness(Guid id, [FromBody] UpdateUserBusinessCommand command)
        {
            command.Password = BCrypt.Net.BCrypt.HashPassword(command.Password);
            if (id != command.UserId)
            {
                return BadRequest();
            }
            await mediator.Send(command);
            return NoContent();

        }
        [HttpGet("GetUserBusinessById/{id:guid}")]

        public async Task<ActionResult<UserBusinessDto>> GetUserBusinessById(Guid id)
        {
            return await mediator.Send(new GetUserBusinessByIdQuery { Id = id });
        }

        [HttpGet("GetAllUserBusinesses")]
        public async Task<ActionResult> GetAllUserBusinesses()
        {
            var users = await mediator.Send(new GetAllUserBusinessesQuery());
            return Ok(users);
        }

        [HttpGet("GetPaginatedUserBusinesses")]
        public async Task<ActionResult<PagedResult<UserBusinessDto>>> GetFilteredUserBusinesses ([FromQuery] int page, [FromQuery] int pageSize)
        {
              var query = new GetFilteredUserBusinessesQuery
               {
                Page = page,
                PageSize = pageSize,
                Filter = null
               };
              var result = await mediator.Send(query);
              if (result.IsSuccess)
               {
                return Ok(result.Data);
    }
              return NotFound(result.ErrorMessage);
}
    }
}
