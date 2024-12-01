using Application.DTOs;
using MediatR;

namespace Application.Queries.BusinessQueries
{
    public class GetAllBusinessesQuery : IRequest<List<BusinessDto>>
    {

        public GetAllBusinessesQuery()
        {

        }

        public int PageNumber { get; set; }
        public int PageSize { get; set; }
    }
}
