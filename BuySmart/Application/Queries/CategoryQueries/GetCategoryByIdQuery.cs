using Application.DTOs;
using MediatR;

namespace Application.Queries.CategoryQueries
{
    public class GetCategoryByIdQuery : IRequest<CategoryDto>
    {
        public Guid CategoryId { get; set; }
    }
}
