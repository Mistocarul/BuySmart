using System.Net.Http.Json;
using FluentAssertions;
using Microsoft.AspNetCore.Mvc.Testing;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using Infrastructure.Persistence;
using Domain.Entities;
using Application.Commands.CategoryCommands;
using Xunit;
using Microsoft.AspNetCore.Hosting;


namespace BuySmart.IntegrationTests
{
    public class CategoryControllerIntegrationTests : IClassFixture<WebApplicationFactory<Program>>, IDisposable
    {
        private readonly WebApplicationFactory<Program> _factory;
        private readonly ApplicationDbContext _dbContext;
        private readonly HttpClient _client;

        private const string BaseUrl = "/api/v1/Category";

        public CategoryControllerIntegrationTests(WebApplicationFactory<Program> factory)
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
        }

        [Fact]
        public async Task GivenCategories_WhenGetAllIsCalled_ThenReturnsTheRightContentType()
        {
            var response = await _client.GetAsync($"{BaseUrl}/GetAllCategories");
            response.Should().NotBeNull();
            response.EnsureSuccessStatusCode();
            response.Content.Headers.ContentType?.ToString().Should().Be("application/json; charset=utf-8");
        }

        [Fact]
        public async Task GivenExistingCategories_WhenGetAllIsCalled_ThenReturnsTheRightCategories()
        {
            SeedCategory();

            var response = await _client.GetAsync($"{BaseUrl}/GetAllCategories");
            response.Should().NotBeNull();
            response.EnsureSuccessStatusCode();

            var categories = await response.Content.ReadAsStringAsync();
            categories.Should().Contain("Test Category");
        }

        [Fact]
        public async Task GivenValidCategory_WhenCreatedIsCalled_Then_ShouldAddToDatabaseTheCategory()
        {
            var command = new CreateCategoryCommand
            {
                Name = "New Category",
                Description = "New Description"
            };

            var response = await _client.PostAsJsonAsync($"{BaseUrl}/CreateCategory", command);
            response.Should().NotBeNull();
            response.EnsureSuccessStatusCode();

            var category = await _dbContext.Categories.FirstOrDefaultAsync(c => c.Name == "New Category");
            category.Should().NotBeNull();
        }

        [Fact]
        public async Task GivenValidCategory_WhenUpdateIsCalled_Then_ShouldUpdateTheCategoryInDatabase()
        {
            SeedCategory();
            var category = await _dbContext.Categories.FirstOrDefaultAsync(c => c.Name == "Test Category");
            category.Should().NotBeNull();

            var command = new UpdateCategoryCommand
            {
                CategoryId = category.CategoryId,
                Name = "Updated Category",
                Description = "Updated Description"
            };

            var response = await _client.PutAsJsonAsync($"{BaseUrl}/UpdateCategory/{category.CategoryId}", command);
            response.Should().NotBeNull();
            response.EnsureSuccessStatusCode();

            await _dbContext.Entry(category).ReloadAsync();

            var updatedCategory = await _dbContext.Categories.FirstOrDefaultAsync(c => c.CategoryId == category.CategoryId);
            updatedCategory.Should().NotBeNull();
            updatedCategory.Name.Should().Be("Updated Category");
            updatedCategory.Description.Should().Be("Updated Description");
        }

        [Fact]
        public async Task GivenValidCategoryId_WhenDeleteIsCalled_Then_ShouldRemoveTheCategoryFromDatabase()
        {
            SeedCategory();
            var category = await _dbContext.Categories.FirstOrDefaultAsync(c => c.Name == "Test Category");
            category.Should().NotBeNull();

            var response = await _client.DeleteAsync($"{BaseUrl}/DeleteCategory/{category.CategoryId}");
            response.Should().NotBeNull();
            response.EnsureSuccessStatusCode();

            await _dbContext.Entry(category).ReloadAsync();

            var deletedCategory = await _dbContext.Categories.FirstOrDefaultAsync(c => c.CategoryId == category.CategoryId);
            deletedCategory.Should().BeNull();
        }

        public void Dispose()
        {
            _dbContext.Database.EnsureDeleted();
            _dbContext.Dispose();
            _client.Dispose();
        }

        private void SeedCategory()
        {
            var category = new Category
            {
                Name = "Test Category",
                Description = "Test Description"
            };
            _dbContext.Categories.Add(category);
            _dbContext.SaveChanges();
        }
    }
}
