using Application.Authentication;
using BuySmart.JWT;
using Domain.Common;
using MediatR;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace BuySmart.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class AuthController : ControllerBase
    {
        private readonly IMediator _mediator;
        private readonly IHttpContextAccessor httpContextAccessor;

        public AuthController(IMediator mediator, IHttpContextAccessor httpContextAccessor)
        {
            _mediator = mediator;
            this.httpContextAccessor = httpContextAccessor;
        }

        [HttpPost("SendConfirmationCode")]
        public async Task<ActionResult<Result<Guid>>> Register([FromBody] RegisterUserCommand command)
        {
            var result = await _mediator.Send(command);
            if (!result.IsSuccess)
            {
                return BadRequest(result.ErrorMessage);
            }
            return CreatedAtAction(nameof(Register), new { id = result.Data }, result.Data);
        }

        [HttpPost("Login")]
        public async Task<ActionResult<Result<string>>> Login(LoginUserCommand command)
        {
            var token = await _mediator.Send(command);
            if (!token.IsSuccess)
            {
                return Unauthorized(token.ErrorMessage);
            }
            return Ok(new { Token = token });
        }

        [HttpPost("Register")]
        public async Task<ActionResult<Result<string>>> SendConfirmationCode(SendVerificationCodeCommand command)
        {
            var result = await _mediator.Send(command);
            if (!result.IsSuccess)
            {
                return BadRequest(result.ErrorMessage);
            }
            return Ok(result.Data);
        }

        [Authorize]
        [HttpPost("VerifyPassword")]
        public async Task<ActionResult<Result<string>>> VerifyPassword(VerifyPasswordCommand command)
        {
            var userId = JwtHelper.GetUserIdFromJwt(httpContextAccessor.HttpContext);
            if (userId == null)
            {
                return Unauthorized();
            }
            command.UserId = new Guid(userId);
            var result = await _mediator.Send(command);
            if (!result.IsSuccess)
            {
                return Unauthorized(result.ErrorMessage);
            }
            return Ok(result.Data);
        }
    }
}
