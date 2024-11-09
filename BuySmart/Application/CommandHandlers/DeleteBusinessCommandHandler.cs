using Application.Commands;
using AutoMapper;
using Domain.Common;
using Domain.Repositories;
using MediatR;

namespace Application.CommandHandlers
{
    public class DeleteBusinessCommandHandler : IRequestHandler<DeleteBusinessCommand, Result<object>>
    {
        private readonly IBusinessRepository businessRepository;
        private readonly IMapper mapper;

        public DeleteBusinessCommandHandler(IBusinessRepository businessRepository, IMapper mapper)
        {
            this.businessRepository = businessRepository;
            this.mapper = mapper;
        }
        public async Task<Result<object>> Handle(DeleteBusinessCommand request, CancellationToken cancellationToken)
        {
            var business = await businessRepository.GetByIdAsync(request.BusinessID);
            if (business == null)
            {
                return Result<object>.Failure("Business not found");
            }

            await businessRepository.DeleteAsync(request.BusinessID);
            return Result<object>.Success(null);
        }
    }
}
