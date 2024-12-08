using AutoMapper;
using Domain.Common;
using Domain.Entities;
using Domain.Repositories;
using MediatR;

namespace Application.Authentication
{
    public class SendVerificationCodeCommandHandler : IRequestHandler<SendVerificationCodeCommand, Result<string>>
    {
        private readonly IUserAuthRepository<User> repository;
        private readonly IMapper mapper;

        public SendVerificationCodeCommandHandler(IUserAuthRepository<User> repository, IMapper mapper)
        {
            this.repository = repository;
            this.mapper = mapper;
        }
        public async Task<Result<string>> Handle(SendVerificationCodeCommand request, CancellationToken cancellationToken)
        {
            var user = mapper.Map<User>(request);
            user.Password = BCrypt.Net.BCrypt.HashPassword(request.Password);
            var result = await repository.SendVerificationCode(user, cancellationToken);
            if (result.IsSuccess)
            {
                return Result<string>.Success(result.Data);
            }
            return Result<string>.Failure(result.ErrorMessage);
        }
    }
}
