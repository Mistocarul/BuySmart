using Application.DTOs;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Queries.CategoryQueries
{
    public class GetAllCategoriesQuery : IRequest<List<CategoryDto>>
    {
        public GetAllCategoriesQuery()
        {
        }
    }
   
}
