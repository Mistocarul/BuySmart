using Application.DTOs;
using MediatR;

namespace Application.Queries.UserClientQueries
{
    public class GetAllUserClientsQuery : IRequest<List<UserClientDto>>
    {
        public int pageNumber { get; set; }
        public int pageSize { get; set; }
    }
}
