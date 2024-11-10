using Application.DTOs;
using MediatR;

namespace Application.Queries.UserBusinessQueries
{
    public class GetUserBusinessByIdQuery : IRequest<UserBusinessDto>
    {
        public Guid Id { get; set; }
    }
}
