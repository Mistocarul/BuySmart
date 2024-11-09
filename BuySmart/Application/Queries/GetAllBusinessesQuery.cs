using Application.DTOs;
using MediatR;

namespace Application.Queries
{
    public class GetAllBusinessesQuery : IRequest<List<BusinessDto>>
    {

        public GetAllBusinessesQuery() 
        {
            
        }
    }
}
