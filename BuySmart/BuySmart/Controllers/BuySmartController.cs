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
        [HttpGet("GetAllUserClients")]
        public async Task<IActionResult> GetAllUsers()
        {
            var users = await mediator.Send(new GetAllUserClientsQuery());
            return Ok(users);
        }

        [HttpGet("GetUserClientById/{id}")]
        public async Task<ActionResult<UserClientDto>> GetUserById(Guid id)
        {
            return await mediator.Send(new GetUserClientByIdQuery { Id = id });
        }

        [HttpPost("CreateUserClient")]
        public async Task<ActionResult<Result<Guid>>> CreateUser([FromBody] CreateUserClientCommand command)
        {
            var result = await mediator.Send(command);
            return CreatedAtAction(nameof(CreateUser), new { id = result.Data }, result.Data);
        }

        [HttpDelete("{id:guid}")]
        public async Task<ActionResult> DeleteUserById(Guid id)
        {
            await mediator.Send(new DeleteUserClientCommand { UserId = id });
            return NoContent();
        }

        [HttpPut("UpdateUser/{id:guid}")]
        public async Task<ActionResult<Result<object>>> UpdateUser(Guid id, [FromBody] UpdateUserClientCommand command)
        {
            if (id != command.UserId)
            {
                return BadRequest();
            }
            var result = await mediator.Send(command);
            return NoContent();
        }

        [HttpPost("CreateUserBusiness")]
        public async Task<ActionResult<Result<Guid>>> CreateUserBusiness([FromBody] CreateUserBusinessCommand command)
        {
            var result = await mediator.Send(command);
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
            if (id != command.UserId)
            {
                return BadRequest();
            }
            var result = await mediator.Send(command);
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


    }
}