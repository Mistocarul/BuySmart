using Application.Commands;
using Application.DTOs;
using Application.Queries;
using Domain.Common;
using MediatR;
using Microsoft.AspNetCore.Mvc;

namespace BuySmartController.Controllers
{
    [Route("api/v1/[controller]")]
    [ApiController]
    public class BuySmartController : ControllerBase
    {
        private readonly IMediator mediator;
        public BuySmartController(IMediator mediator)
        {
            this.mediator = mediator;
        }
        [HttpGet("GetAllUsers")]
        public async Task<IActionResult> GetAllUsers()
        {
            var users = await mediator.Send(new GetAllUsersQuery());
            return Ok(users);
        }

        [HttpGet("GetUserById/{id}")]
        public async Task<ActionResult<UserDto>> GetUserById(Guid id)
        {
            return await mediator.Send(new GetUserByIdQuery { Id = id });
        }

        [HttpPost("CreateUser")]
        public async Task<ActionResult<Result<Guid>>> CreateUser([FromBody] CreateUserCommand command)
        {
            var result = await mediator.Send(command);
            return CreatedAtAction(nameof(CreateUser), new { id = result.Data }, result.Data);
        }

        [HttpDelete("{id:guid}")]
        public async Task<ActionResult> DeleteUserById(Guid id)
        {
            await mediator.Send(new DeleteUserByIdCommand { Id = id });
            return NoContent();
        }

        [HttpPut("UpdateUser/{id:guid}")]
        public async Task<ActionResult<Result<object>>> UpdateUser(Guid id, [FromBody] UpdateUserCommand command)
        {
            if (id != command.UserId)
            {
                return BadRequest();
            }
            var result = await mediator.Send(command);
            return NoContent();
        }


    }
}