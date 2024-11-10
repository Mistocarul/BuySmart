using Application.DTOs;
using MediatR;

namespace Application.Queries.BusinessQueries
{
    public class GetBusinessByIdQuery : IRequest<BusinessDto>
    {
        public Guid Id { get; set; }
    }
}
