using Application.DTOs;
using Application.Queries.UserClientQueries;
using AutoMapper;
using Domain.Repositories;
using MediatR;

namespace Application.QueryHandlers.UserClientQueryHandlers
{
    public class GetAllUserClientsQueryHandler : IRequestHandler<GetAllUserClientsQuery, List<UserClientDto>>
    {
        private readonly IUserClientRepository repository;
        private readonly IMapper mapper;

        public GetAllUserClientsQueryHandler(IUserClientRepository repository, IMapper mapper)
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
