using Application.Commands.ProductCommands;
using Application.DTOs;
using Application.Queries.ProductQueries;
using Application.Utils;
using Domain.Common;
using Domain.Entities;
using MediatR;
using Microsoft.AspNetCore.Mvc;
using System.Linq.Expressions;

namespace BuySmart.Controllers
{
    [Route("api/v1/[controller]")]
    [ApiController]
    public class ProductController : ControllerBase
    {
        private readonly IMediator mediator;
        public ProductController(IMediator mediator)
        {
            this.mediator = mediator;
        }

        [HttpGet("GetAllProducts")]
        public async Task<IActionResult> GetAllProducts()
        {

            var products = await mediator.Send(new GetAllProductsQuery());
            return Ok(products);
        }

        [HttpGet("GetPaginatedProducts")]
        public async Task<ActionResult<PagedResult<ProductDto>>> GetFilteredProducts([FromQuery] int page, [FromQuery] int pageSize, [FromQuery] string? name, [FromQuery] Guid? categoryId, [FromQuery] decimal? minPrice, [FromQuery] decimal? maxPrice, [FromQuery]  string? sortbyPriceDirection)
        {
            //expresii lambda care iau un produs si ret un bool
            //practic imi definesc predicate pt filtrare 

            Expression<Func<Product, bool>> filterByProductName = m =>
            string.IsNullOrEmpty(name) || m.Name.Contains(name);

            Expression<Func<Product, bool>> filterByCategoryId = p =>
            !categoryId.HasValue || p.Categories.Any(c => c.CategoryId == categoryId);

            Expression<Func<Product, bool>> filterByMinPrice = m =>
            !minPrice.HasValue || m.Price >= minPrice;

            Expression<Func<Product, bool>> filterByMaxPrice = m =>
            !maxPrice.HasValue || m.Price <= maxPrice;


            var query = new GetFilteredProductsQuery
            {
                Page = page,
                PageSize = pageSize,
                Filter = null,
                SortDirection = sortbyPriceDirection,

            };

            if (!string.IsNullOrEmpty(name))
            {
                query.Filter = filterByProductName;
            }

            if (categoryId.HasValue)
            {
                query.Filter = filterByCategoryId;
            }
            if (minPrice.HasValue)
            {
                query.Filter = filterByMinPrice;
            }
            if (maxPrice.HasValue)
            {
                query.Filter = filterByMaxPrice;
            }


            var result = await mediator.Send(query);
            if (result.IsSuccess)
            {
                return Ok(result.Data);
            }
            return NotFound(result.ErrorMessage);
        }      

        [HttpGet("GetProductById/{id}")]
        public async Task<ActionResult<ProductDto>> GetProductById(Guid id)
        {
            return await mediator.Send(new GetProductByIdQuery { ProductId = id });
        }

        [HttpPost("CreateProduct")]
        public async Task<ActionResult<Result<Guid>>> CreateProduct([FromBody] CreateProductCommand command)
        {
            var result = await mediator.Send(command);
            if (!result.IsSuccess)
            {
                return BadRequest(result.ErrorMessage);
            }
            return CreatedAtAction(nameof(CreateProduct), new { id = result.Data }, result.Data);
        }

        [HttpPut("UpdateProduct/{id:guid}")]
        public async Task<ActionResult<Result<object>>> UpdateProduct(Guid id, [FromBody] UpdateProductCommand command)
        {
            if (id != command.ProductId)
            {
                return BadRequest();
            }
            var result = await mediator.Send(command);

            if (!result.IsSuccess)
            {
                return BadRequest(result.ErrorMessage);
            }

            return NoContent();
        }

        [HttpDelete("DeleteProduct/{id:guid}")]
        public async Task<ActionResult> DeleteProductById(Guid id)
        {
            await mediator.Send(new DeleteProductCommand { ProductId = id });
            return NoContent();
        }
    }
}



