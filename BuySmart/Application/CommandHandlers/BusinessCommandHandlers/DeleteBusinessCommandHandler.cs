using Application.Commands.BusinessCommands;
using AutoMapper;
using Domain.Common;
using Domain.Repositories;
using MediatR;

namespace Application.CommandHandlers.BusinessCommandHandlers
{
    public class DeleteBusinessCommandHandler : IRequestHandler<DeleteBusinessCommand, Result<object>>
    {
        private readonly IBusinessRepository businessRepository;

        public DeleteBusinessCommandHandler(IBusinessRepository businessRepository)
        {
            this.businessRepository = businessRepository;
        }
        public async Task<Result<object>> Handle(DeleteBusinessCommand request, CancellationToken cancellationToken)
        {
            var business = await businessRepository.GetByIdAsync(request.BusinessID);
            if (business == null)
            {
                return Result<object>.Failure("Business not found");
            }

            await businessRepository.DeleteAsync(request.BusinessID);
            return Result<object>.Success(new object());
        }
    }
}
