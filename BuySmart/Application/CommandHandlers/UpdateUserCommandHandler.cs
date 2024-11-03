using Application.Commands;
using AutoMapper;
using Domain.Common;
using Domain.Entities;
using Domain.Repositories;
using MediatR;

namespace Application.CommandHandlers
{
    public class UpdateUserCommandHandler : IRequestHandler<UpdateUserCommand, Result<object>>
    {
        private readonly IUserRepository userRepository;
        private readonly IMapper mapper;
        public UpdateUserCommandHandler(IUserRepository userRepository, IMapper mapper)
        {
            this.userRepository = userRepository;
            this.mapper = mapper;
        }
        public async Task<Result<object>> Handle(UpdateUserCommand request, CancellationToken cancellationToken)
        {
            var User = mapper.Map<User>(request);
            var result =  await userRepository.UpdateAsync(User);
            if (result.IsSuccess)
            {
                return Result<object>.Success(result.Data);
            }
            return Result<object>.Failure(result.ErrorMessage);
        }
    }
}
