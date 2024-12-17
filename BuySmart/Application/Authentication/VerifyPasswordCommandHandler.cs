using AutoMapper;
using Domain.Common;
using Domain.Entities;
using Domain.Repositories;
using MediatR;

namespace Application.Authentication
{
    public class VerifyPasswordCommandHandler : IRequestHandler<VerifyPasswordCommand, Result<string>>
    {
        private readonly IUserAuthRepository<User> userRepository;
        private readonly IMapper mapper;

        public VerifyPasswordCommandHandler(IUserAuthRepository<User> userRepository, IMapper mapper)
        {
            this.userRepository = userRepository;
            this.mapper = mapper;
        }
        public async Task<Result<string>> Handle(VerifyPasswordCommand request, CancellationToken cancellationToken)
        {
            var result = await userRepository.VerifyPassword(request.UserId, request.Password);
            if (result.IsSuccess)
            {
                return Result<string>.Success(result.Data);
            }
            return Result<string>.Failure(result.ErrorMessage);
        }
    }
}
