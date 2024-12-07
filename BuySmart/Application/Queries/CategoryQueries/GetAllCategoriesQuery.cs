using Application.DTOs;
using MediatR;

namespace Application.Queries.CategoryQueries
{
    public class GetAllCategoriesQuery : IRequest<List<CategoryDto>>
    {
        public GetAllCategoriesQuery()
        {
        }

        public int PageNumber { get; set; }
        public int PageSize { get; set; }

        public string?keyWord { get; set; }
    }
   
}
