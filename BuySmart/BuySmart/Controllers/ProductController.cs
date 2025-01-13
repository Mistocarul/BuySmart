using Application.Commands.ProductCommands;
using Application.DTOs;
using Application.Queries.ProductQueries;
using Application.Utils;
using Domain.Common;
using Domain.Entities;
using MediatR;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using LinqKit;

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

        //[Authorize]
        [HttpGet("GetAllProducts")]
        public async Task<IActionResult> GetAllProducts()
        {

            var products = await mediator.Send(new GetAllProductsQuery());
            return Ok(products);
        }

        [Authorize]
        [HttpGet("GetAllProductsByBusinessId/{businessId}")]
        public async Task<IActionResult> GetAllProductsByBusinessId(Guid businessId)
        {
            var products = await mediator.Send(new GetAllProductsByBusinessIdQuery { BusinessId = businessId });
            return Ok(products);
        }

        [Authorize]
        [HttpGet("GetPaginatedProducts")]
        public async Task<ActionResult<PagedResult<ProductDto>>> GetFilteredProducts([FromQuery] int page, [FromQuery] int pageSize, [FromQuery] string? name, [FromQuery] Guid? categoryId, [FromQuery] decimal? minPrice, [FromQuery] decimal? maxPrice, [FromQuery] string? sortbyPriceDirection)
        {
            var filter = PredicateBuilder.New<Product>(true);

            if (!string.IsNullOrEmpty(name))
            {
                filter = filter.And(p => p.Name.Contains(name));
            }

            if (categoryId.HasValue)
            {
                filter = filter.And(p => p.Categories.Any(c => c.CategoryId == categoryId));
            }

            if (minPrice.HasValue)
            {
                filter = filter.And(p => p.Price >= minPrice);
            }

            if (maxPrice.HasValue)
            {
                filter = filter.And(p => p.Price <= maxPrice);
            }

            var query = new GetFilteredProductsQuery
            {
                Page = page,
                PageSize = pageSize,
                Filter = filter,
                SortDirection = sortbyPriceDirection,
            };

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

        //[Authorize(Roles = "Business")]
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