using Application.DTOs;
using MediatR;

namespace Application.Queries
{
    public class GetUserBusinessByIdQuery : IRequest<UserBusinessDto>
    {
        public Guid Id { get; set; }
    }
}
