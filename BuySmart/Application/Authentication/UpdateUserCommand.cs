using Domain.Common;
using MediatR;


namespace Application.Authentication
{
    public class UpdateUserCommand : IRequest<Result<object>>
    {
        public Guid UserId { get; set; }
        public string Name { get; set; } = string.Empty;
        public string Email { get; set; } = string.Empty;
        public string Password { get; set; } = string.Empty;
        public string Image { get; set; } = string.Empty;

    }
}
