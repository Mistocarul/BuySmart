using Application.DTOs;
using MediatR;

namespace Application.Queries.ReviewBusinessQueries
{
    public class GetReviewBusinessByIdQuery : IRequest<ReviewDto>
    {
        public Guid Id { get; set; }
    }
}
