using AutoMapper;
using Domain.Common;
using Domain.Entities;
using Domain.Repositories;
using MediatR;

namespace Application.Authentication
{
    public class RegisterUserCommandHandler : IRequestHandler<RegisterUserCommand, Result<Guid>>
    {
        private readonly IUserAuthRepository<User> repository;

        public RegisterUserCommandHandler(IUserAuthRepository<User> repository)
        {
            this.repository = repository;
        }

        public async Task<Result<Guid>> Handle(RegisterUserCommand request, CancellationToken cancellationToken)
        {
            int confirmationCode = int.Parse(request.confirmationCode);
            var result = await repository.Register(confirmationCode, cancellationToken);
            if (result.IsSuccess)
            {
                return Result<Guid>.Success(result.Data);
            }
            return Result<Guid>.Failure(result.ErrorMessage);
        }
    }
}
