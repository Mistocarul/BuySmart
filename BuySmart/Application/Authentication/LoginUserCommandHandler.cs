using AutoMapper;
using Domain.Common;
using Domain.Entities;
using Domain.Repositories;
using MediatR;

namespace Application.Authentication
{
    public class LoginUserCommandHandler : IRequestHandler<LoginUserCommand, Result<string>>
    {
        private readonly IUserAuthRepository<User> userRepository;
        private readonly IMapper mapper;

        public LoginUserCommandHandler(IUserAuthRepository<User> userRepository, IMapper mapper)
        {
            this.userRepository = userRepository;
            this.mapper = mapper;
        }

        public async Task<Result<string>> Handle(LoginUserCommand request, CancellationToken cancellationToken)
        {
            var user = mapper.Map<User>(request);
            var result = await userRepository.Login(user);

            if (result.IsSuccess)
            {
                return Result<string>.Success(result.Data);
            }

            return Result<string>.Failure(result.ErrorMessage);
        }
    }
}

