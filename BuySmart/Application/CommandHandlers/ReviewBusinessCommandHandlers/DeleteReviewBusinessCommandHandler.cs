using Application.Commands.ReviewBusinessCommands;
using Domain.Common;
using Domain.Repositories;
using MediatR;

namespace Application.CommandHandlers.ReviewBusinessCommandHandlers
{
    public class DeleteReviewBusinessCommandHandler : IRequestHandler<DeleteReviewBusinessCommand, Result<object>>
    {
        private readonly IReviewBusinessRepository reviewBusinessRepository;

        public DeleteReviewBusinessCommandHandler(IReviewBusinessRepository ReviewBusinessRepository)
        {
            this.reviewBusinessRepository = ReviewBusinessRepository;
        }

        public async Task<Result<object>> Handle(DeleteReviewBusinessCommand request, CancellationToken cancellationToken)
        {
            var reviewBusiness = await reviewBusinessRepository.GetByIdAsync(request.ReviewId);

            if (reviewBusiness == null)
            {
                return Result<object>.Failure("Review not found");
            }
            await reviewBusinessRepository.DeleteAsync(request.ReviewId);
            return Result<object>.Success(new object());
        }
    }
}
