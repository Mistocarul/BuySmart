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

        [HttpPost("CreateUserClient_and_Cart")]
        public async Task<ActionResult<Result<Guid>>> CreateUserClient([FromBody] CreateUserClientCommand command)
        {
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


        [HttpPost("CreateBusiness")]
        public async Task<ActionResult<Result<Guid>>> CreateBusiness([FromBody] CreateBusinessCommand command)
        {
            var result = await mediator.Send(command);
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