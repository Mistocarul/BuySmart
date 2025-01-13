using Application.DTOs;
using MediatR;

namespace Application.Queries.BusinessQueries
{
    public class GetBusinessByUserBusinessIdQuery : IRequest<BusinessDto>
    {
        public Guid UserBusinessId { get; set; }
    }
}
