using Domain.Common;
using MediatR;

namespace Application.Authentication
{
    public class LoginUserCommand : IRequest<Result<string>>
    {
        public string Email { get; set; } = string.Empty;
        public string Password { get; set; } = string.Empty;
    }
}