using Application.Commands.BusinessCommands;
using AutoMapper;
using Domain.Common;
using Domain.Repositories;
using MediatR;

namespace Application.CommandHandlers.BusinessCommandHandlers
{
    public class CreateBusinessCommandHandler : IRequestHandler<CreateBusinessCommand, Result<Guid>>
    {
        private readonly IBusinessRepository businessRepository;
        private readonly IMapper mapper;

        public CreateBusinessCommandHandler(IBusinessRepository businessRepository, IMapper mapper)
        {
            this.businessRepository = businessRepository;
            this.mapper = mapper;
        }

        public async Task<Result<Guid>> Handle(CreateBusinessCommand request, CancellationToken cancellationToken)
        {
            var business = mapper.Map<Domain.Entities.Business>(request);
            var result = await businessRepository.AddAsync(business);

            if (result.IsSuccess)
            {
                return Result<Guid>.Success(result.Data);
            }

            return Result<Guid>.Failure(result.ErrorMessage);
        }
    }
}