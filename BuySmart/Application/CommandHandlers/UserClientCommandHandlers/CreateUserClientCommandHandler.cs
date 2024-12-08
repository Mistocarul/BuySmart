using Application.Commands.UserClientCommands;
using AutoMapper;
using Domain.Common;
using Domain.Entities;
using Domain.Repositories;
using MediatR;

namespace Application.CommandHandlers.UserClientCommandHandlers
{
    public class CreateUserClientCommandHandler : IRequestHandler<CreateUserClientCommand, Result<Guid>>
    {
        private readonly IUserRepository<UserClient> userRepository;
        private readonly IMapper mapper;

        public CreateUserClientCommandHandler(IUserRepository<UserClient> userRepository, IMapper mapper)
        {
            this.userRepository = userRepository;
            this.mapper = mapper;
        }

        public async Task<Result<Guid>> Handle(CreateUserClientCommand request, CancellationToken cancellationToken)
        {
            var userClient = mapper.Map<UserClient>(request);
            var result = await userRepository.AddAsync(userClient);

            if (result.IsSuccess)
            {
                return Result<Guid>.Success(result.Data);
            }

            return Result<Guid>.Failure(result.ErrorMessage);
        }
    }
}
