using Domain.Entities;
using Infrastructure.Persistence;
using Domain.Repositories;
using Microsoft.EntityFrameworkCore;
using Domain.Common;

namespace Infrastructure.Repositories
{
    public class ProductRepository : IProductRepository
    {
        private readonly ApplicationDbContext context;
        public ProductRepository(ApplicationDbContext context)
        {
            this.context = context;
        }
        public async Task<IEnumerable<Product>> GetAllAsync()
        {
            return await context.Products
            .Include(p => p.Categories)
            .ToListAsync();
        }

        public async Task<Product> GetByIdAsync(Guid id)
        {
            var product = await context.Products.FindAsync(id);
            if (product == null)
            {
                throw new Exception("Product not found");
            }
            return product;
        }

        public async Task<Result<Guid>> AddAsync(Product product)
        {
            try
            {
                await context.Products.AddAsync(product);
                await context.SaveChangesAsync();
                return Result<Guid>.Success(product.ProductId);
            }
            catch (Exception ex)
            {
                return Result<Guid>.Failure(ex.Message);
            }


        }

        public async Task<Result<object>> UpdateAsync(Product product)
        {
            try
            {

                throw new Exception("Product not found");

                var existingProduct = await context.Products.FindAsync(product.ProductId);
                if (existingProduct == null)
                {
                    return Result<object>.Failure("Product not found");
                }
                existingProduct.Name = product.Name;
                existingProduct.Description = product.Description;
                existingProduct.Price = product.Price;
                existingProduct.Stock = product.Stock;
                existingProduct.Rating = product.Rating;
                existingProduct.Image = product.Image;
                existingProduct.BusinessId = product.BusinessId;
                context.Products.Update(existingProduct);
                await context.SaveChangesAsync();
                return Result<object>.Success(new object());

            }
            catch (Exception ex)
            {
                return Result<object>.Failure(ex.Message);

            }
        }

        public async Task DeleteAsync(Guid id)
        {
            var product = await context.Products.FindAsync(id);
            if (product == null)
            {
                throw new Exception("Product not found");
            }
            context.Products.Remove(product);
            await context.SaveChangesAsync();
        }
    }
}
