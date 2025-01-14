using Domain.Entities;
using Infrastructure.Persistence;
using Domain.Repositories;
using Microsoft.EntityFrameworkCore;
using Domain.Common;
using Microsoft.Extensions.Configuration;
using System.Threading;


namespace Infrastructure.Repositories
{
    public class ProductRepository : IProductRepository
    {
        private readonly ApplicationDbContext context;
        private readonly IConfiguration configuration;
        public ProductRepository(ApplicationDbContext context, IConfiguration configuration)
        {
            this.context = context;
            this.configuration = configuration;
        }
        public async Task<IEnumerable<Product>> GetAllAsync()
        {
            var products = await context.Products
                .Include(p => p.Categories)
                .ToListAsync();
            foreach (var product in products)
            {
                string productPhotoPath = product.Image;
                if (!File.Exists(productPhotoPath))
                {
                    throw new FileNotFoundException("Image not found");
                }
                byte[] imageArray = await File.ReadAllBytesAsync(productPhotoPath);
                string base64ImageRepresentation = Convert.ToBase64String(imageArray);
                product.Image = base64ImageRepresentation;
            }
            return products;
        }

        public async Task<Product> GetByIdAsync(Guid productId)
        {
            var product = await context.Products.Include(p => p.Categories).FirstOrDefaultAsync(p => p.ProductId == productId);
            if (product == null)
            {
                throw new KeyNotFoundException("Product not found");
            }
            string productPhotoPath = product.Image;
            if (!File.Exists(productPhotoPath))
            {
                throw new FileNotFoundException("Image not found");
            }
            byte[] imageArray = await File.ReadAllBytesAsync(productPhotoPath);
            string base64ImageRepresentation = Convert.ToBase64String(imageArray);
            product.Image = base64ImageRepresentation;
            return product;
        }

        public async Task<Result<Guid>> AddAsync(Product product)
        {
            try
            {
                string relativePath = configuration["PathToPhotos:PathToProducts"];
                string projectRoot = Directory.GetParent(AppContext.BaseDirectory).Parent.Parent.Parent.FullName;
                string fullPathToPhotos = Path.Combine(projectRoot, relativePath);
                fullPathToPhotos = Path.GetFullPath(fullPathToPhotos);

                await context.Products.AddAsync(product);
                await context.SaveChangesAsync();

                string productPhotoPath;

                byte[] productImage = Convert.FromBase64String(product.Image);

                if (productImage != null && productImage.Length > 0)
                {
                    string fileName = $"{product.Name}_{product.ProductId}.png";
                    productPhotoPath = Path.Combine(fullPathToPhotos, fileName);
                    await File.WriteAllBytesAsync(productPhotoPath, productImage);
                }
                else
                {
                    string defaultPhotoPath = Path.Combine(fullPathToPhotos, "default.png");
                    string fileName = $"{product.Name}_{product.ProductId}.png";
                    productPhotoPath = Path.Combine(fullPathToPhotos, fileName);
                    File.Copy(defaultPhotoPath, productPhotoPath, overwrite: true);
                }

                product.Image = productPhotoPath;

                context.Products.Update(product);
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
