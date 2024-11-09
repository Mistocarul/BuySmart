using Application.Commands;
using AutoMapper;
using Domain.Common;
using Domain.Entities;
using Domain.Repositories;
using MediatR;

namespace Application.CommandHandlers
{
    public class UpdateBusinessCommandHandler : IRequestHandler<UpdateBusinessCommand, Result<object>>
    {

        private readonly IBusinessRepository businessRepository;
        private readonly IMapper mapper;
        public UpdateBusinessCommandHandler(IBusinessRepository businessRepository,IMapper mapper)
        {
            this.businessRepository = businessRepository;
            this.mapper = mapper;
        }

        public async Task<Result<object>> Handle(UpdateBusinessCommand request, CancellationToken cancellationToken)
        {
            var business = mapper.Map<Business>(request);
            var result = await businessRepository.UpdateAsync(business);

            if (result.IsSuccess)
            {
                return Result<object>.Success(result.Data);
            }

            return Result<object>.Failure(result.ErrorMessage);
        }
    }
}
