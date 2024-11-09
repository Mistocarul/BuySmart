using Domain.Common;
using Domain.Entities;
using MediatR;

namespace Application.Commands
{
    public class CreateUserBusinessCommand : IRequest<Result<Guid>>
    {
        public string Name { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public UserType UserType { get; set; }
        public string Image { get; set; }
    }
}
