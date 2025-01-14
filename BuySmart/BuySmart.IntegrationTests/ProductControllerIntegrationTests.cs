using System.Net.Http.Json;
using FluentAssertions;
using Microsoft.AspNetCore.Mvc.Testing;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using Infrastructure.Persistence;
using Domain.Entities;
using Application.Commands.ProductCommands;
using Application.DTOs;
using Xunit;
using Microsoft.AspNetCore.Hosting;

namespace BuySmart.IntegrationTests
{
    public class ProductControllerIntegrationTests : IClassFixture<WebApplicationFactory<Program>>, IDisposable
    {
        private readonly WebApplicationFactory<Program> _factory;
        private readonly ApplicationDbContext _dbContext;
        private readonly HttpClient _client;
        private readonly string _tempImagePath;

        private const string BaseUrl = "/api/v1/Product";

        public ProductControllerIntegrationTests(WebApplicationFactory<Program> factory)
        {
            _factory = factory.WithWebHostBuilder(builder =>
            {
                builder.UseEnvironment("Test");
                builder.ConfigureServices(services =>
                {
                    var sp = services.BuildServiceProvider();
                    using var scope = sp.CreateScope();
                    var db = scope.ServiceProvider.GetRequiredService<ApplicationDbContext>();
                    db.Database.EnsureCreated();
                });
            });

            _dbContext = _factory.Services.GetRequiredService<ApplicationDbContext>();
            _client = _factory.CreateClient();

            // Create a temporary image file
            _tempImagePath = Path.Combine(Path.GetTempPath(), "test_image.jpg");
            File.WriteAllBytes(_tempImagePath, new byte[0]); // Create an empty file
        }

        [Fact]
        public async Task GivenProducts_WhenGetAllIsCalled_ThenReturnsTheRightContentType()
        {
            var response = await _client.GetAsync($"{BaseUrl}/GetAllProducts");
            response.Should().NotBeNull();
            response.EnsureSuccessStatusCode();
            response.Content.Headers.ContentType?.ToString().Should().Be("application/json; charset=utf-8");
        }

        [Fact]
        public async Task GivenExistingProducts_WhenGetAllIsCalled_ThenReturnsTheRightProducts()
        {
            SeedProduct();

            var response = await _client.GetAsync($"{BaseUrl}/GetAllProducts");
            response.Should().NotBeNull();
            response.EnsureSuccessStatusCode();

            var products = await response.Content.ReadAsStringAsync();
            products.Should().Contain("Test Product");
        }

        [Fact]
        public async Task GivenValidProduct_WhenCreatedIsCalled_Then_ShouldAddToDatabaseTheProduct()
        {
            var userBusiness = new UserBusiness
            {
                UserId = Guid.NewGuid(),
                UserType = UserType.Business
            };
            _dbContext.UserBusinesses.Add(userBusiness);
            _dbContext.SaveChanges();

            var business = new Business
            {
                BusinessID = Guid.NewGuid(),
                Name = "New Business",
                Description = "New Business Description",
                Address = "New Business Address",
                UserBusinessId = userBusiness.UserId,
                UserBusiness = userBusiness
            };
            _dbContext.Businesses.Add(business);
            _dbContext.SaveChanges();

            var category = new Category
            {
                Name = "Category1",
                Description = "Category Description"
            };
            _dbContext.Categories.Add(category);
            _dbContext.SaveChanges();

            var imageBytes = File.ReadAllBytes(_tempImagePath);
            var base64Image = Convert.ToBase64String(imageBytes);

            var command = new CreateProductCommand
            {
                Name = "New Product",
                Description = "New Description",
                Price = 10.0m,
                Stock = 100,
                Rating = 4.5,
                Image = base64Image,
                BusinessId = business.BusinessID,
                CategoryNames = new List<string> { category.Name }
            };

            var response = await _client.PostAsJsonAsync($"{BaseUrl}/CreateProduct", command);
            response.Should().NotBeNull();

            if (!response.IsSuccessStatusCode)
            {
                var errorContent = await response.Content.ReadAsStringAsync();
                throw new Exception($"Failed to create product: {errorContent}");
            }

            response.EnsureSuccessStatusCode();

            var product = await _dbContext.Products.FirstOrDefaultAsync(p => p.Name == "New Product");
            product.Should().NotBeNull();
        }

        [Fact]
        public async Task GivenValidProduct_WhenUpdateIsCalled_Then_ShouldUpdateTheProductInDatabase()
        {
            SeedProduct();
            var product = await _dbContext.Products.FirstOrDefaultAsync(p => p.Name == "Test Product");
            product.Should().NotBeNull();

            var command = new UpdateProductCommand
            {
                ProductId = product.ProductId,
                Name = "Updated Product",
                Description = "Updated Description",
                Price = 20.0m,
                Stock = 200,
                Rating = 4.8,
                Image = _tempImagePath,
                BusinessId = product.Business.BusinessID
            };

            var response = await _client.PutAsJsonAsync($"{BaseUrl}/UpdateProduct/{product.ProductId}", command);
            response.Should().NotBeNull();
            response.EnsureSuccessStatusCode();

            await _dbContext.Entry(product).ReloadAsync();

            var updatedProduct = await _dbContext.Products.FirstOrDefaultAsync(p => p.ProductId == product.ProductId);
            updatedProduct.Should().NotBeNull();
            updatedProduct.Name.Should().Be("Updated Product");
            updatedProduct.Description.Should().Be("Updated Description");
        }

        [Fact]
        public async Task GivenValidProductId_WhenDeleteIsCalled_Then_ShouldRemoveTheProductFromDatabase()
        {
            SeedProduct();
            var product = await _dbContext.Products.FirstOrDefaultAsync(p => p.Name == "Test Product");
            product.Should().NotBeNull();

            var response = await _client.DeleteAsync($"{BaseUrl}/DeleteProduct/{product.ProductId}");
            response.Should().NotBeNull();
            response.EnsureSuccessStatusCode();

            await _dbContext.Entry(product).ReloadAsync();

            var deletedProduct = await _dbContext.Products.FirstOrDefaultAsync(p => p.ProductId == product.ProductId);
            deletedProduct.Should().BeNull();
        }

        [Fact]
        public async Task GivenValidProductId_WhenGetProductByIdIsCalled_Then_ShouldReturnTheProduct()
        {
            SeedProduct();
            var product = await _dbContext.Products.FirstOrDefaultAsync(p => p.Name == "Test Product");
            product.Should().NotBeNull();

            var response = await _client.GetAsync($"{BaseUrl}/GetProductById/{product.ProductId}");
            response.Should().NotBeNull();
            response.EnsureSuccessStatusCode();

            var returnedProduct = await response.Content.ReadFromJsonAsync<ProductDto>();
            returnedProduct.Should().NotBeNull();
            returnedProduct.Name.Should().Be("Test Product");
        }
      

        public void Dispose()
        {
            _dbContext.Database.EnsureDeleted();
            _dbContext.Dispose();
            _client.Dispose();

            // Clean up the temporary image file
            if (File.Exists(_tempImagePath))
            {
                File.Delete(_tempImagePath);
            }
        }

        private void SeedProduct()
        {
            var userBusiness = new UserBusiness
            {
                UserId = Guid.NewGuid(),
                UserType = UserType.Business
            };
            _dbContext.UserBusinesses.Add(userBusiness);

            var business = new Business
            {
                BusinessID = Guid.NewGuid(),
                Name = "Test Business",
                Description = "Test Description",
                Address = "Test Address",
                UserBusinessId = userBusiness.UserId,
                UserBusiness = userBusiness
            };
            _dbContext.Businesses.Add(business);

            var category = new Category
            {
                Name = "Test Category",
                Description = "Test Description"
            };
            _dbContext.Categories.Add(category);

            var product = new Product
            {
                Name = "Test Product",
                Description = "Test Description",
                Price = 10.0m,
                Stock = 100,
                Rating = 4.5,
                Image = _tempImagePath,
                Business = business,
                Categories = new List<Category> { category }
            };
            _dbContext.Products.Add(product);
            _dbContext.SaveChanges();
        }
    }
}
