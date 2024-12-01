using Application.DTOs;
using MediatR;

namespace Application.Queries.ReviewBusinessQueries
{
    public class GetAllReviewBusinessesQuery : IRequest<List<ReviewDto>>
    {
    
    
    public int PageNumber { get; set; }
    public int PageSize { get; set; }
    }
}
