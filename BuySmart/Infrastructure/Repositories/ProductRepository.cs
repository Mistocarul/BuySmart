using Domain.Entities;
using Infrastructure.Persistence;
using Domain.Repositories;
using Microsoft.EntityFrameworkCore;

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
            return await context.Products.ToListAsync();
<<<<<<< Updated upstream
=======

>>>>>>> Stashed changes
        }

        public async Task<Product> GetByIdAsync(Guid productId)
        {
            var product = await context.Products.FindAsync(productId);
            if (product == null)
            {
                throw new KeyNotFoundException("Product not found");
            }
            return product;
        }

        public async Task<Guid> AddAsync(Product product)
        {
            await context.Products.AddAsync(product);
            await context.SaveChangesAsync();
            return product.ProductId;
        }

        public async Task UpdateAsync(Product product)
        {
            var existingProduct = await context.Products.FindAsync(product.ProductId);
            if (existingProduct == null)
            {
                throw new KeyNotFoundException("Product not found");
            }
            context.Entry(existingProduct).CurrentValues.SetValues(product);
            await context.SaveChangesAsync();
        }

        public async Task DeleteAsync(Guid productId)
        {
            var product = await context.Products.FindAsync(productId);
            if (product == null)
            {
                throw new KeyNotFoundException("Product not found");
            }
            context.Products.Remove(product);
            await context.SaveChangesAsync();
        }
    }
}
