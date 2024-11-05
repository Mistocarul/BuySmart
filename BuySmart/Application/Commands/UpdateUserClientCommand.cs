using MediatR;
using Domain.Common;
using Domain.Entities;

namespace Application.Commands
{
    public class UpdateUserClientCommand : IRequest<Result<object>>
    {
        public Guid UserId { get; set; }
        public string Name { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public UserType UserType { get; set; }
        public string Image { get; set; }
    }
}
