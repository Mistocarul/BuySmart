using Application.DTOs;
using Application.Queries.BusinessQueries;
using AutoMapper;
using Domain.Repositories;
using MediatR;

namespace Application.QueryHandlers.BusinessQueryHandlers
{
    public class GetBusinessByUserBusinessIdQueryHandler : IRequestHandler<GetBusinessByUserBusinessIdQuery, BusinessDto>
    {
        private readonly IBusinessRepository repository;
        private readonly IMapper mapper;

        public GetBusinessByUserBusinessIdQueryHandler(IBusinessRepository repository, IMapper mapper)
        {
            this.repository = repository;
            this.mapper = mapper;
        }
        public async Task<BusinessDto> Handle(GetBusinessByUserBusinessIdQuery request, CancellationToken cancellationToken)
        {
            var business = await repository.GetByUserBusinessIdAsync(request.UserBusinessId);
            return mapper.Map<BusinessDto>(business);
        }
    }
}
