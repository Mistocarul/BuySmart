using Application.DTOs;
using Application.Queries.ReviewBusinessQueries;
using AutoMapper;
using Domain.Repositories;
using MediatR;

namespace Application.QueryHandlers.ReviewBusinessQueryHandlers
{
    public class GetAllReviewBusinessesQueryHandler : IRequestHandler<GetAllReviewBusinessesQuery, List<ReviewDto>>
    {
        private readonly IReviewBusinessRepository repository;
        private readonly IMapper mapper;

        public GetAllReviewBusinessesQueryHandler(IReviewBusinessRepository repository, IMapper mapper)
        {
            this.repository = repository;
            this.mapper = mapper;
        }
        public async Task<List<ReviewDto>> Handle(GetAllReviewBusinessesQuery request, CancellationToken cancellationToken)
        {
            var reviewBusinesses = await repository.GetAllAsync();
            return mapper.Map<List<ReviewDto>>(reviewBusinesses);
        }
    }
}
