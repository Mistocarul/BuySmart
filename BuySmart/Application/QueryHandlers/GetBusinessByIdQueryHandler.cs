using Application.DTOs;
using Application.Queries;
using AutoMapper;
using Domain.Repositories;
using MediatR;

namespace Application.QueryHandlers
{
    public class GetBusinessByIdQueryHandler : IRequestHandler<GetBusinessByIdQuery, BusinessDto>
    {
        private readonly IBusinessRepository businessRepository;
        private readonly IMapper mapper;

        public GetBusinessByIdQueryHandler(IBusinessRepository businessRepository,IMapper mapper)
        {
            this.businessRepository = businessRepository;
            this.mapper = mapper;
        }

        public async Task<BusinessDto> Handle(GetBusinessByIdQuery request, CancellationToken cancellationToken)
        {
            var business = await businessRepository.GetByIdAsync(request.Id);
            return mapper.Map<BusinessDto>(business);
        }
    }
}
