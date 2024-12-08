using Application.DTOs;
using Application.Queries.UserClientQueries;
using AutoMapper;
using Domain.Entities;
using Domain.Repositories;
using MediatR;

namespace Application.QueryHandlers.UserClientQueryHandlers
{
    public class GetUserClientByIdQueryHandler : IRequestHandler<GetUserClientByIdQuery, UserClientDto>
    {
        private readonly IUserRepository<UserClient> repository;
        private readonly IMapper mapper;

        public GetUserClientByIdQueryHandler(IUserRepository<UserClient> repository, IMapper mapper)
        {
            this.repository = repository;
            this.mapper = mapper;
        }
        public async Task<UserClientDto> Handle(GetUserClientByIdQuery request, CancellationToken cancellationToken)
        {
            var userClient = await repository.GetByIdAsync(request.Id);
            return mapper.Map<UserClientDto>(userClient);
        }
    }
}
