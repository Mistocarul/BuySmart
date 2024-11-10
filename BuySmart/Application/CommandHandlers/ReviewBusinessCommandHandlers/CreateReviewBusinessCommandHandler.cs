using Application.Commands.ReviewBusinessCommands;
using AutoMapper;
using Domain.Common;
using Domain.Entities;
using Domain.Repositories;
using MediatR;

namespace Application.CommandHandlers.ReviewBusinessCommandHandler
{
    public class CreateReviewBusinessCommandHandler : IRequestHandler<CreateReviewBusinessCommand, Result<Guid>>
    {
        private readonly IMapper mapper;
        private readonly IReviewBusinessRepository reviewBusinessRepository;

        public CreateReviewBusinessCommandHandler(IReviewBusinessRepository ReviewBusinessRepository, IMapper mapper)
        {
            this.reviewBusinessRepository = ReviewBusinessRepository;
            this.mapper = mapper;
        }

        public async Task<Result<Guid>> Handle(CreateReviewBusinessCommand request, CancellationToken cancellationToken)
        {
            var reviewBusiness = mapper.Map<Review>(request);
            var result = await reviewBusinessRepository.AddAsync(reviewBusiness);

            if (result.IsSuccess)
            {
                return Result<Guid>.Success(result.Data);
            }

            return Result<Guid>.Failure(result.ErrorMessage);
        }
    }
}
