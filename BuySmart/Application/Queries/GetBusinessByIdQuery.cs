using Application.DTOs;
using MediatR;

namespace Application.Queries
{
    public class GetBusinessByIdQuery : IRequest<BusinessDto>
    {
        public Guid Id { get; set; }
    }
}
