using Application.Commands.ProductCommands;
using Application.DTOs;
using Application.Queries.ProductQueries;
using Domain.Common;
using Domain.Entities;
using MediatR;
using Microsoft.AspNetCore.Mvc;

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
        public async Task<IActionResult> GetAllProducts([FromQuery] string? name, [FromQuery] Guid? categoryId, [FromQuery] decimal? minPrice, [FromQuery] decimal? maxPrice, ProductOrder order, int pageNumber = 1, int pageSize = 10)
        {
            var query = new GetAllProductsQuery
            {
                Name = name,
                CategoryId = categoryId,
                MinPrice = minPrice,
                MaxPrice = maxPrice,
                pageNumber = pageNumber,
                pageSize = pageSize,
                order = order
            };
            var products = await mediator.Send(query);
            return Ok(products);
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
