using Application.DTOs;
using Application.Queries.UserBusinessQueries;
using AutoMapper;
using Domain.Entities;
using Domain.Repositories;
using MediatR;

namespace Application.QueryHandlers.UserBusinessQueryHandlers
{
    public class GetUserBusinessByIdQueryHandler : IRequestHandler<GetUserBusinessByIdQuery, UserBusinessDto>
    {
        private readonly IUserRepository<UserBusiness> repository;
        private readonly IMapper mapper;
        public GetUserBusinessByIdQueryHandler(IUserRepository<UserBusiness> repository, IMapper mapper)
        {
            this.repository = repository;
            this.mapper = mapper;
        }

        public async Task<UserBusinessDto> Handle(GetUserBusinessByIdQuery request, CancellationToken cancellationToken)
        {
            var userBusiness = await repository.GetByIdAsync(request.Id);
            return mapper.Map<UserBusinessDto>(userBusiness);
        }
    }
}
