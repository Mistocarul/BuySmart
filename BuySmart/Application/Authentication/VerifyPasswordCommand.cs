using Domain.Common;
using MediatR;

namespace Application.Authentication
{
    public class VerifyPasswordCommand : IRequest<Result<string>>
    {
        public Guid UserId { get; set; }
        public string Password { get; set; } = string.Empty;
    }
}
