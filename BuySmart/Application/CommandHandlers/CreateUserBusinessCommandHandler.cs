using Application.Commands;
using AutoMapper;
using Domain.Common;
using Domain.Entities;
using Domain.Repositories;
using MediatR;

namespace Application.CommandHandlers
{
    public class CreateUserBusinessCommandHandler : IRequestHandler<CreateUserBusinessCommand, Result<Guid>>
    {
        private readonly IUserBusinessRepository userBusinessRepository;
        private readonly IMapper mapper;

        public CreateUserBusinessCommandHandler(IUserBusinessRepository userBusinessRepository, IMapper mapper)
        {
            this.userBusinessRepository = userBusinessRepository;
            this.mapper = mapper;
        }
        public async Task<Result<Guid>> Handle(CreateUserBusinessCommand request, CancellationToken cancellationToken)
        {
            var userBusiness = mapper.Map<UserBusiness>(request);
            var result = await userBusinessRepository.AddAsync(userBusiness);

            if (result.IsSuccess)
            {
                return Result<Guid>.Success(result.Data);
            }

            return Result<Guid>.Failure(result.ErrorMessage);
        }
    }
}
