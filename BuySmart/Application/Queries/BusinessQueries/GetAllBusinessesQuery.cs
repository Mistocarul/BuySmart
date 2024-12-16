using Application.DTOs;
using MediatR;

namespace Application.Queries.BusinessQueries
{
    public class GetAllBusinessesQuery : IRequest<List<BusinessDto>>
    {

        public GetAllBusinessesQuery()
        {

        }

    }
}
