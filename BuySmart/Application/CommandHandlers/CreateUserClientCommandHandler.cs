using Application.Commands;
using AutoMapper;
using Domain.Common;
using Domain.Entities;
using Domain.Repositories;
using MediatR;

namespace Application.CommandHandlers
{
    public class CreateUserClientCommandHandler : IRequestHandler<CreateUserClientCommand, Result<Guid>>
    {
        private readonly IUserClientRepository userClientRepository;
        private readonly IMapper mapper;

        public CreateUserClientCommandHandler(IUserClientRepository userClientRepository, IMapper mapper)
        {
            this.userClientRepository = userClientRepository;
            this.mapper = mapper;
        }

        public async Task<Result<Guid>> Handle(CreateUserClientCommand request, CancellationToken cancellationToken)
        {
            var userClient = mapper.Map<UserClient>(request);
            var result = await userClientRepository.AddAsync(userClient);

            if (result.IsSuccess)
            {
                return Result<Guid>.Success(result.Data);
            }

            return Result<Guid>.Failure(result.ErrorMessage);
        }
    }
}
