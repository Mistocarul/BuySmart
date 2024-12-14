using Application.Commands.UserClientCommands;
using Application.DTOs;
using Application.Queries.UserClientQueries;
using Domain.Common;
using MediatR;
using Microsoft.AspNetCore.Mvc;
using Application.Commands.CartCommands;
using Microsoft.AspNetCore.Authorization;
using BuySmart.JWT;

namespace BuySmart.Controllers
{
    [Route("api/v1/[controller]")]
    [ApiController]
    public class UserClientController : ControllerBase
    {
        private readonly IMediator mediator;
        private readonly IHttpContextAccessor httpContextAccessor;

        public UserClientController(IMediator mediator, IHttpContextAccessor httpContextAccessor)
        {
            this.mediator = mediator;
            this.httpContextAccessor = httpContextAccessor;
        }
        [HttpGet("GetAllUserClients")]
        public async Task<IActionResult> GetAllUsers(int pageNumber = 1, int pageSize = 10)
        {
            var users = await mediator.Send(new GetAllUserClientsQuery { pageNumber = pageNumber, pageSize = pageSize});
            return Ok(users);
        }

        [HttpGet("GetUserClientById/{id}")]
        public async Task<ActionResult<UserClientDto>> GetUserById(Guid id)
        {
            return await mediator.Send(new GetUserClientByIdQuery { Id = id });
        }

        [HttpPost("CreateUserClient_and_Cart")]
        public async Task<ActionResult<Result<Guid>>> CreateUserClient([FromBody] CreateUserClientCommand command)
        {
            command.Password = BCrypt.Net.BCrypt.HashPassword(command.Password);

            var result = await mediator.Send(command);
            if (!result.IsSuccess)
            {
                return BadRequest(result.ErrorMessage);
            }
            CreateCartCommand createCartCommand = new CreateCartCommand { UserClientId = result.Data };
            var cartResult = await mediator.Send(createCartCommand);
            if (!cartResult.IsSuccess)
            {
                await mediator.Send(new DeleteUserClientCommand { UserId = result.Data });
                return BadRequest(cartResult.ErrorMessage);
            }
            return CreatedAtAction(nameof(CreateUserClient), new { id = result.Data }, result.Data);
        }

        [HttpDelete("DeleteUserClient/{id:guid}")]
        public async Task<ActionResult> DeleteUserById(Guid id)
        {
            await mediator.Send(new DeleteUserClientCommand { UserId = id });
            return NoContent();
        }

        [Authorize]
        [HttpPut("UpdateUserClient")]
        public async Task<ActionResult<Result<object>>> UpdateUser([FromBody] UpdateUserClientCommand command)
        {
            var userId = JwtHelper.GetUserIdFromJwt(httpContextAccessor.HttpContext);
            if (userId == null)
            {
                return Unauthorized();
            }
            command.UserId = new Guid(userId);
            command.Password = BCrypt.Net.BCrypt.HashPassword(command.Password);
            var result = await mediator.Send(command);
            if (!result.IsSuccess)
            {
                return BadRequest(result.ErrorMessage);
            }
            return NoContent();
        }
    }
}
