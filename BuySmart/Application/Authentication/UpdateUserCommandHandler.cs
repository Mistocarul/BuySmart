using Application.Authentication;
using AutoMapper;
using Domain.Common;
using Domain.Entities;
using Domain.Repositories;
using MediatR;

namespace Application.CommandHandlers.UserClientCommandHandlers
{
    public class UpdateUserCommandHandler : IRequestHandler<UpdateUserCommand, Result<object>>
    {
        private readonly IUserAuthRepository<User> userAuthRepository;
        private readonly IMapper mapper;

        public UpdateUserCommandHandler(IUserAuthRepository<User> userAuthRepository, IMapper mapper)
        {
            this.userAuthRepository = userAuthRepository;
            this.mapper = mapper;
        }

        public async Task<Result<object>> Handle(UpdateUserCommand request, CancellationToken cancellationToken)
        {
            var user = await userAuthRepository.GetByIdAsync(request.UserId);
            if (user == null)
            {
                return Result<object>.Failure("User not found");
            }

            user = mapper.Map<User>(request);

            var result = await userAuthRepository.UpdateUserAsync(user);
            if (result.IsSuccess)
            {
                return Result<object>.Success(result.Data);
            }

            return Result<object>.Failure(result.ErrorMessage);
        }
    }
}
