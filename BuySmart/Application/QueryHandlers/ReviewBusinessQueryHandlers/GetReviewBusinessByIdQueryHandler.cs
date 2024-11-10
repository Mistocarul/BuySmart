using Application.DTOs;
using Application.Queries.ReviewBusinessQueries;
using AutoMapper;
using Domain.Repositories;
using MediatR;

namespace Application.QueryHandlers.ReviewBusinessQueryHandlers
{
    public class GetReviewBusinessByIdQueryHandler : IRequestHandler<GetReviewBusinessByIdQuery, ReviewDto>
    {
        private readonly IReviewBusinessRepository repository;
        private readonly IMapper mapper;
        public GetReviewBusinessByIdQueryHandler(IReviewBusinessRepository repository, IMapper mapper)
        {
            this.repository = repository;
            this.mapper = mapper;
        }
        public async Task<ReviewDto> Handle(GetReviewBusinessByIdQuery request, CancellationToken cancellationToken)
        {
            var reviewBusiness = await repository.GetByIdAsync(request.Id);
            return mapper.Map<ReviewDto>(reviewBusiness);
        }
    }
}
