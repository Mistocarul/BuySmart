using Application.DTOs;
using MediatR;

namespace Application.Queries
{
    public class GetUserClientByIdQuery : IRequest<UserClientDto>
    {
        public Guid Id { get; set; }
    }
}
