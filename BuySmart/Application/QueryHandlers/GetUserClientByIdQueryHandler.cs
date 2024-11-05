using Application.DTOs;
using Application.Queries;
using AutoMapper;
using Domain.Repositories;
using MediatR;

namespace Application.QueryHandlers
{
    public class GetUserClientByIdQueryHandler : IRequestHandler<GetUserClientByIdQuery, UserClientDto>
    {
        private readonly IUserClientRepository repository;
        private readonly IMapper mapper;

        public GetUserClientByIdQueryHandler(IUserClientRepository repository, IMapper mapper)
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
