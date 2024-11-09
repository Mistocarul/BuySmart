using Application.DTOs;
using Application.Queries;
using AutoMapper;
using Domain.Repositories;
using MediatR;

namespace Application.QueryHandlers
{
    public class GetAllBusinessQueryHandler : IRequestHandler<GetAllBusinessesQuery, List<BusinessDto>>
    {
        private readonly IBusinessRepository businessRepository;
        private readonly IMapper mapper;

        public GetAllBusinessQueryHandler(IBusinessRepository businessRepository, IMapper mapper)
        {
            this.businessRepository = businessRepository;
            this.mapper = mapper;
        }

        public async Task<List<BusinessDto>> Handle(GetAllBusinessesQuery request, CancellationToken cancellationToken)
        {
            var businesses = await businessRepository.GetAllAsync();
            return mapper.Map<List<BusinessDto>>(businesses);
        }
    }
}