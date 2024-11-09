using Domain.Common;
using Domain.Entities;
using MediatR;

namespace Application.Commands
{
    public class UpdateUserBusinessCommand : IRequest<Result<object>>
    {
        public Guid UserId { get; set; } 
        public string Name { get; set; } = string.Empty;
        public string Email { get; set; } = string.Empty;
        public string Password { get; set; } = string.Empty;
        public UserType UserType { get; set; } = UserType.Business;
        public string Image { get; set; } = string.Empty;

    }
}
