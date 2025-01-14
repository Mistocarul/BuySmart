using System.Net.Http.Json;
using Application.Commands.BusinessCommands;
using Application.DTOs;
using Application.Utils;
using Domain.Common;
using Domain.Entities;
using FluentAssertions;
using Infrastructure.Persistence;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc.Testing;
using Microsoft.Extensions.DependencyInjection;
using Xunit;

namespace BuySmart.IntegrationTests
{
    public class BusinessControllerIntegrationTests : IClassFixture<WebApplicationFactory<Program>>, IDisposable
    {
        private readonly WebApplicationFactory<Program> _factory;
        private readonly HttpClient _client;
        private readonly ApplicationDbContext _dbContext;

        private const string BaseUrl = "/api/v1/Business";

        public BusinessControllerIntegrationTests(WebApplicationFactory<Program> factory)
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
        public async Task GetAllBusinesses_ShouldReturnOk()
        {
            var userBusiness1 = new UserBusiness
            {
                UserId = Guid.NewGuid(),
                Name = "User Business 1",
                Email = "user1@example.com",
                Password = "password"
            };
            var userBusiness2 = new UserBusiness
            {
                UserId = Guid.NewGuid(),
                Name = "User Business 2",
                Email = "user2@example.com",
                Password = "password"
            };

            var business1 = new Business
            {
                BusinessID = Guid.NewGuid(),
                Name = "Business 1",
                Description = "Description 1",
                Address = "Address 1",
                PhoneNumber = "1234567890",
                UserBusinessId = userBusiness1.UserId
            };
            var business2 = new Business
            {
                BusinessID = Guid.NewGuid(),
                Name = "Business 2",
                Description = "Description 2",
                Address = "Address 2",
                PhoneNumber = "0987654321",
                UserBusinessId = userBusiness2.UserId
            };

            _dbContext.UserBusinesses.AddRange(userBusiness1, userBusiness2);
            _dbContext.Businesses.AddRange(business1, business2);
            _dbContext.SaveChanges();

            var response = await _client.GetAsync($"{BaseUrl}/GetAllBusinesses");
            response.Should().NotBeNull();
            response.EnsureSuccessStatusCode();

            var result = await response.Content.ReadFromJsonAsync<List<BusinessDto>>();
            result.Should().NotBeNull();
            result.Count.Should().Be(2);
        }

        [Fact]
        public async Task GetPaginatedBusinesses_ShouldReturnOk()
        {
            var response = await _client.GetAsync($"{BaseUrl}/GetPaginatedBusinesses?page=1&pageSize=10&keyword=test");
            response.Should().NotBeNull();
            response.EnsureSuccessStatusCode();

            var result = await response.Content.ReadFromJsonAsync<PagedResult<BusinessDto>>();
            result.Should().NotBeNull();
        }

        [Fact]
        public async Task GetBusinessById_ShouldReturnOk()
        {
            var userBusiness1 = new UserBusiness
            {
                UserId = Guid.NewGuid(),
                Name = "User Business 1",
                Email = "user1@example.com",
                Password = "password"
            };
            _dbContext.UserBusinesses.Add(userBusiness1);
            _dbContext.SaveChanges();
            var business = new Business
            {
                BusinessID = Guid.NewGuid(),
                Name = "Test Business",
                Description = "Test Description",
                Address = "Test Address",
                PhoneNumber = "1234567890",
                UserBusinessId = userBusiness1.UserId
            };
            _dbContext.Businesses.Add(business);
            _dbContext.SaveChanges();


            await _dbContext.Entry(business).ReloadAsync();

            var response = await _client.GetAsync($"{BaseUrl}/GetBusinessById/{business.BusinessID}");
            response.Should().NotBeNull();
            response.EnsureSuccessStatusCode();

            var result = await response.Content.ReadFromJsonAsync<BusinessDto>();
            result.Should().NotBeNull();
        }

        [Fact]
        public async Task CreateBusiness_ShouldReturnCreated()
        {
            var existingUserBusinessId = Guid.NewGuid();
            var userBusiness = new UserBusiness
            {
                UserId = existingUserBusinessId,
                Name = "Existing User Business",
                Email = "existing@example.com",
                Password = "password"
            };
            _dbContext.UserBusinesses.Add(userBusiness);
            _dbContext.SaveChanges();

            var command = new CreateBusinessCommand
            {
                Name = "New Business",
                Description = "New Description",
                Address = "New Address",
                PhoneNumber = "0987654321",
                UserBusinessId = existingUserBusinessId
            };

            var response = await _client.PostAsJsonAsync($"{BaseUrl}/CreateBusiness", command);
            response.Should().NotBeNull();
            response.EnsureSuccessStatusCode();

        }

        [Fact]
        public async Task DeleteBusinessById_ShouldReturnNoContent()
        {
            var userBusiness1 = new UserBusiness
            {
                UserId = Guid.NewGuid(),
                Name = "User Business 1",
                Email = "user1@example.com",
                Password = "password"
            };
            _dbContext.UserBusinesses.Add(userBusiness1);
            _dbContext.SaveChanges();
            var business = new Business
            {
                BusinessID = Guid.NewGuid(),
                Name = "Test Business",
                Description = "Test Description",
                Address = "Test Address",
                PhoneNumber = "1234567890",
                UserBusinessId = userBusiness1.UserId
            };
            _dbContext.Businesses.Add(business);
            _dbContext.SaveChanges();


            await _dbContext.Entry(business).ReloadAsync();

            var response = await _client.DeleteAsync($"{BaseUrl}/DeleteBusiness/{business.BusinessID}");
            response.Should().NotBeNull();
            response.StatusCode.Should().Be(System.Net.HttpStatusCode.NoContent);
        }

        [Fact]
        public async Task UpdateBusiness_ShouldReturnNoContent()
        {
            var userBusiness1 = new UserBusiness
            {
                UserId = Guid.NewGuid(),
                Name = "User Business 1",
                Email = "user1@example.com",
                Password = "password"
            };
            _dbContext.UserBusinesses.Add(userBusiness1);
            _dbContext.SaveChanges();
            var business = new Business
            {
                BusinessID = Guid.NewGuid(),
                Name = "Test Business",
                Description = "Test Description",
                Address = "Test Address",
                PhoneNumber = "1234567890",
                UserBusinessId = userBusiness1.UserId
            };
            _dbContext.Businesses.Add(business);
            _dbContext.SaveChanges();

            var command = new UpdateBusinessCommand
            {
                BusinessID = business.BusinessID,
                Name = "Updated Business",
                Description = "Updated Description",
                Address = "Updated Address",
                PhoneNumber = "0987654321"
            };


            await _dbContext.Entry(business).ReloadAsync();
            var response = await _client.PutAsJsonAsync($"{BaseUrl}/UpdateBusiness/{business.BusinessID}", command);
            response.Should().NotBeNull();
            response.StatusCode.Should().Be(System.Net.HttpStatusCode.NoContent);
        }

        public void Dispose()
        {
            _dbContext.Database.EnsureDeleted();
            _dbContext.Dispose();
            _client.Dispose();
        }
    }
}

