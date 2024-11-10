using MediatR;
using Domain.Common;
using Domain.Entities;

namespace Application.Commands.UserClientCommands
{
    public class CreateUserClientCommand : IRequest<Result<Guid>>
    {
        public string Name { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public UserType UserType { get; set; }
        public string Image { get; set; }
    }
}
