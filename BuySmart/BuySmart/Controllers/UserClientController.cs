using Application.Commands.UserClientCommands;
using Application.DTOs;
using Application.Queries.UserClientQueries;
using Domain.Common;
using MediatR;
using Microsoft.AspNetCore.Mvc;
using Application.Commands.CartCommands;
using Application.Utils;

namespace BuySmart.Controllers
{
    [Route("api/v1/[controller]")]
    [ApiController]
    public class UserClientController : ControllerBase
    {
        private readonly IMediator mediator;
        public UserClientController(IMediator mediator)
        {
            this.mediator = mediator;
        }
        [HttpGet("GetAllUserClients")]
        public async Task<IActionResult> GetAllUsers()
        {
<<<<<<< Updated upstream
            var users = await mediator.Send(new GetAllUserClientsQuery());
=======
            var users = await mediator.Send(new GetAllUserClientsQuery ());
>>>>>>> Stashed changes
            return Ok(users);
        }

        [HttpGet("GetPaginatedUserClients")]
        public async Task<ActionResult<PagedResult<UserClientDto>>> GetFilteredUserClients([FromQuery] int page, [FromQuery] int pageSize)
        {
            var query = new GetFilteredUserClientsQuery
            {
                Page = page,
                PageSize = pageSize,
                Filter=null
            };

            var result=await mediator.Send(query);
            if (result.IsSuccess)
            {
                return Ok(result.Data);
            }
            return NotFound(result.ErrorMessage);

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

        [HttpPut("UpdateUserClient/{id:guid}")]
        public async Task<ActionResult<Result<object>>> UpdateUser(Guid id, [FromBody] UpdateUserClientCommand command)
        {
            if (id != command.UserId)
            {
                return BadRequest();
            }
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
