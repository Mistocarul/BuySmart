using Application.DTOs;
using MediatR;

namespace Application.Queries.UserBusinessQueries
{
    public class GetAllUserBusinessesQuery : IRequest<List<UserBusinessDto>>
    {
        public int pageNumber { get; set; }
        public int pageSize { get; set; }
    }
}
