using Application.DTOs;
using MediatR;

namespace Application.Queries.ReviewBusinessQueries
{
    public class GetAllReviewBusinessesQuery : IRequest<List<ReviewDto>>
    {
    }
}
