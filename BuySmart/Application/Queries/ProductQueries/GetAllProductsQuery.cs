using Application.DTOs;
using Domain.Entities;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Queries.ProductQueries
{
    public class GetAllProductsQuery : IRequest<List<ProductDto>>
    {

    }
}