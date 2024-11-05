using Application.DTOs;
using MediatR;

namespace Application.Queries
{
    public class GetAllUserClientsQuery : IRequest<List<UserClientDto>>
    {
    }
}
