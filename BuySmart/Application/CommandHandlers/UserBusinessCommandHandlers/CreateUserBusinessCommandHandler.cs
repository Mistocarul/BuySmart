using Application.Commands.UserBusinessCommands;
using AutoMapper;
using Domain.Common;
using Domain.Entities;
using Domain.Repositories;
using MediatR;

namespace Application.CommandHandlers.UserBusinessCommandHandlers
{
    public class CreateUserBusinessCommandHandler : IRequestHandler<CreateUserBusinessCommand, Result<Guid>>
    {
        private readonly IUserRepository<UserBusiness> userRepository;
        private readonly IMapper mapper;

        public CreateUserBusinessCommandHandler(IUserRepository<UserBusiness> userRepository, IMapper mapper)
        {
            this.userRepository = userRepository;
            this.mapper = mapper;
        }
        public async Task<Result<Guid>> Handle(CreateUserBusinessCommand request, CancellationToken cancellationToken)
        {
            var userBusiness = mapper.Map<UserBusiness>(request);
            var result = await userRepository.AddAsync(userBusiness);

            if (result.IsSuccess)
            {
                return Result<Guid>.Success(result.Data);
            }

            return Result<Guid>.Failure(result.ErrorMessage);
        }
    }
}
