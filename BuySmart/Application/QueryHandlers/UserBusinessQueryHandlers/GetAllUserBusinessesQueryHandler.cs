using Application.DTOs;
using Application.Queries.UserBusinessQueries;
using AutoMapper;
using Domain.Entities;
using Domain.Repositories;
using MediatR;

namespace Application.QueryHandlers.UserBusinessQueryHandlers
{
    public class GetAllUserBusinessesQueryHandler : IRequestHandler<GetAllUserBusinessesQuery, List<UserBusinessDto>>
    {
        private readonly IUserRepository<UserBusiness> repository;
        private readonly IMapper mapper;

        public GetAllUserBusinessesQueryHandler(IUserRepository<UserBusiness> repository, IMapper mapper)
        {
            this.repository = repository;
            this.mapper = mapper;
        }

        public async Task<List<UserBusinessDto>> Handle(GetAllUserBusinessesQuery request, CancellationToken cancellationToken)
        {
            var userBusinesses = await repository.GetAllAsync(request.pageNumber, request.pageSize);
            return mapper.Map<List<UserBusinessDto>>(userBusinesses);
        }
    }
}
