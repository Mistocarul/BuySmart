using Application.DTOs;
using MediatR;

namespace Application.Queries.UserBusinessQueries
{
    public class GetAllUserBusinessesQuery : IRequest<List<UserBusinessDto>>
    {
    }
}