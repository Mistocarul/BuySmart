using Application.DTOs;
using Application.Queries.UserBusinessQueries;
using AutoMapper;
using Domain.Repositories;
using MediatR;

namespace Application.QueryHandlers.UserBusinessQueryHandlers
{
    public class GetUserBusinessByIdQueryHandler : IRequestHandler<GetUserBusinessByIdQuery, UserBusinessDto>
    {
        private readonly IUserBusinessRepository repository;
        private readonly IMapper mapper;
        public GetUserBusinessByIdQueryHandler(IUserBusinessRepository repository, IMapper mapper)
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
