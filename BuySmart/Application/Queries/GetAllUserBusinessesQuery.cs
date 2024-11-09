using Application.DTOs;
using MediatR;

namespace Application.Queries
{
    public class GetAllUserBusinessesQuery : IRequest<List<UserBusinessDto>>
    {
    }
}
