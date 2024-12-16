using Application.DTOs;
using Application.Queries.UserClientQueries;
using AutoMapper;
using Domain.Entities;
using Domain.Repositories;
using MediatR;

namespace Application.QueryHandlers.UserClientQueryHandlers
{
    public class GetAllUserClientsQueryHandler : IRequestHandler<GetAllUserClientsQuery, List<UserClientDto>>
    {
        private readonly IUserRepository<UserClient> repository;
        private readonly IMapper mapper;

        public GetAllUserClientsQueryHandler(IUserRepository<UserClient> repository, IMapper mapper)
        {
            this.repository = repository;
            this.mapper = mapper;
        }
        public async Task<List<UserClientDto>> Handle(GetAllUserClientsQuery request, CancellationToken cancellationToken)
        {
            var userClients = await repository.GetAllAsync();
            return mapper.Map<List<UserClientDto>>(userClients);
        }
    }
}