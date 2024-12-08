using Application.Authentication;
using Domain.Common;
using MediatR;
using Microsoft.AspNetCore.Mvc;

namespace BuySmart.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class AuthController : ControllerBase
    {
        private readonly IMediator _mediator;

        public AuthController(IMediator mediator)
        {
            _mediator = mediator;
        }

        [HttpPost("register")]
        public async Task<ActionResult<Result<Guid>>> Register([FromBody] RegisterUserCommand command)
        {
            var result = await _mediator.Send(command);
            if (!result.IsSuccess)
            {
                return BadRequest(result.ErrorMessage);
            }
            return CreatedAtAction(nameof(Register), new { id = result.Data }, result.Data);
        }

        [HttpPost("login")]
        public async Task<ActionResult<Result<string>>> Login(LoginUserCommand command)
        {
            var token = await _mediator.Send(command);
            return Ok(new { Token = token });
        }
    }
}
