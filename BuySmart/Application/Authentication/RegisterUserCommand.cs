using Domain.Common;
using Domain.Entities;
using MediatR;

namespace Application.Authentication
{
    public class RegisterUserCommand : IRequest<Result<Guid>>
    {
        public string confirmationCode { get; set; } = string.Empty;
    }
}
