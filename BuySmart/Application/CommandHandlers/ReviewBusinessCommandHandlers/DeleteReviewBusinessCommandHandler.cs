using Application.Commands.ReviewBusinessCommands;
using AutoMapper;
using Domain.Common;
using Domain.Repositories;
using MediatR;

namespace Application.CommandHandlers.ReviewBusinessCommandHandlers
{
    public class DeleteReviewBusinessCommandHandler : IRequestHandler<DeleteReviewBusinessCommand, Result<object>>
    {
        private readonly IMapper mapper;
        private readonly IReviewBusinessRepository reviewBusinessRepository;

        public DeleteReviewBusinessCommandHandler(IReviewBusinessRepository ReviewBusinessRepository, IMapper mapper)
        {
            this.reviewBusinessRepository = ReviewBusinessRepository;
            this.mapper = mapper;
        }

        public async Task<Result<object>> Handle(DeleteReviewBusinessCommand request, CancellationToken cancellationToken)
        {
            var reviewBusiness = await reviewBusinessRepository.GetByIdAsync(request.ReviewId);

            if (reviewBusiness == null)
            {
                return Result<object>.Failure("Review not found");
            }
            await reviewBusinessRepository.DeleteAsync(request.ReviewId);
            return Result<object>.Success(null);
        }
    }
}
