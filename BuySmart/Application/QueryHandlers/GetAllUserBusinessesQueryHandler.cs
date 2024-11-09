using Application.DTOs;
using Application.Queries;
using AutoMapper;
using Domain.Repositories;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.QueryHandlers
{
    public class GetAllUserBusinessesQueryHandler : IRequestHandler<GetAllUserBusinessesQuery, List<UserBusinessDto>>
    {
        private readonly IUserBusinessRepository repository;
        private readonly IMapper mapper;

        public GetAllUserBusinessesQueryHandler(IUserBusinessRepository repository, IMapper mapper)
        {
            this.repository = repository;
            this.mapper = mapper;
        }

        public async Task<List<UserBusinessDto>> Handle(GetAllUserBusinessesQuery request, CancellationToken cancellationToken)
        {
            var userBusinesses = await repository.GetAllAsync();
            return mapper.Map<List<UserBusinessDto>>(userBusinesses);
        }
    }
}
