using Application.DTOs;
using MediatR;

namespace Application.Queries.CategoryQueries
{
    public class GetAllCategoriesQuery : IRequest<List<CategoryDto>>
    {
        public GetAllCategoriesQuery()
        {
        }

    }
   
}
