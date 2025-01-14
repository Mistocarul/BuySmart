using Application.Authentication;
using Application.Commands.UserBusinessCommands;
using Application.DTOs;
using Application.Queries.UserBusinessQueries;
using Application.Utils;
using BuySmart.JWT;
using Domain.Common;
using MediatR;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace BuySmart.Controllers
{
    [Route("api/v1/[controller]")]
    [ApiController]
    public class UserBusinessController : ControllerBase
    {
        private readonly IMediator mediator;
        public readonly IHttpContextAccessor httpContextAccessor;

        public UserBusinessController(IMediator mediator, IHttpContextAccessor httpContextAccessor)
        {
            this.mediator = mediator;
            this.httpContextAccessor = httpContextAccessor;
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

        [Authorize]
        [HttpDelete("DeleteUserBusiness")]
        public async Task<ActionResult> DeleteUserBusiness()
        {
            
            var userId = JwtHelper.GetUserIdFromJwt(httpContextAccessor.HttpContext);
            if (userId == null)
            {
                return Unauthorized();
            }
            var id = new Guid(userId);
            await mediator.Send(new DeleteUserCommand { UserId = id });
            return NoContent();
        }

        [Authorize]
        [HttpPut("UpdateUserBusiness/{id:guid}")]
        public async Task<ActionResult<Result<object>>> UpdateUserBusiness(Guid id, [FromBody] UpdateUserCommand command)
        {
            var userId = JwtHelper.GetUserIdFromJwt(httpContextAccessor.HttpContext);
            if (userId == null)
            {
                return Unauthorized();
            }
            command.UserId = new Guid(userId);
            command.Password = BCrypt.Net.BCrypt.HashPassword(command.Password);
            if (id != command.UserId)
            {
                return BadRequest();
            }
            await mediator.Send(command);
            return NoContent();

        }
        [Authorize]
        [HttpGet("GetUserBusinessById")]

        public async Task<ActionResult<UserBusinessDto>> GetUserBusinessById()
        {
            var userId = JwtHelper.GetUserIdFromJwt(httpContextAccessor.HttpContext);
            if (userId == null)
            {
                return Unauthorized();
            }
            GetUserBusinessByIdQuery query = new GetUserBusinessByIdQuery { Id = new Guid(userId) };
            return await mediator.Send(query);
        }

        [Authorize]
        [HttpGet("GetAllUserBusinesses")]
        public async Task<ActionResult> GetAllUserBusinesses()
        {
            var users = await mediator.Send(new GetAllUserBusinessesQuery());
            return Ok(users);
        }

        [Authorize]
        [HttpGet("GetPaginatedUserBusinesses")]
        public async Task<ActionResult<PagedResult<UserBusinessDto>>> GetFilteredUserBusinesses([FromQuery] int page, [FromQuery] int pageSize)
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
