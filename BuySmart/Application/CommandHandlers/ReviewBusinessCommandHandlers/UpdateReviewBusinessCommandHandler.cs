using Application.Commands.ReviewBusinessCommands;
using AutoMapper;
using Domain.Common;
using Domain.Entities;
using Domain.Repositories;
using MediatR;

namespace Application.CommandHandlers.ReviewBusinessCommandHandler
{
    public class UpdateReviewBusinessCommandHandler : IRequestHandler<UpdateReviewBusinessCommand, Result<object>>
    {
        private readonly IReviewBusinessRepository reviewBusinessRepository;
        private readonly IMapper mapper;
        public UpdateReviewBusinessCommandHandler(IReviewBusinessRepository reviewBusinessRepository, IMapper mapper)
        {
            this.reviewBusinessRepository = reviewBusinessRepository;
            this.mapper = mapper;
        }

        public async Task<Result<object>> Handle(UpdateReviewBusinessCommand request, CancellationToken cancellationToken)
        {

            var reviewBusiness = await reviewBusinessRepository.GetByIdAsync(request.ReviewId);
            if (reviewBusiness == null)
            {
                return Result<object>.Failure("Review not found");
            }
            reviewBusiness = mapper.Map<Review>(request);
            var result = await reviewBusinessRepository.UpdateAsync(reviewBusiness);

            if (result.IsSuccess)
            {
                return Result<object>.Success(result.Data);
            }

            return Result<object>.Failure(result.ErrorMessage);
        }
    }
}
