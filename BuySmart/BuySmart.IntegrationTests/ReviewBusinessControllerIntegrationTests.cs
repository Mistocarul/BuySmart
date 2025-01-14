using System.IdentityModel.Tokens.Jwt;
using System.Net.Http.Headers;
using System.Net.Http.Json;
using System.Security.Claims;
using System.Text;
using Application.Commands.ReviewBusinessCommands;
using Application.DTOs;
using Application.Utils;
using Domain.Entities;
using FluentAssertions;
using Infrastructure.Persistence;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc.Testing;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.IdentityModel.Tokens;
using Xunit;

namespace BuySmart.IntegrationTests
{
    public class ReviewBusinessControllerIntegrationTests : IClassFixture<WebApplicationFactory<Program>>, IDisposable
    {
        private readonly WebApplicationFactory<Program> _factory;
        private readonly HttpClient _client;
        private readonly ApplicationDbContext _dbContext;

        private const string BaseUrl = "/api/v1/ReviewBusiness";

        public ReviewBusinessControllerIntegrationTests(WebApplicationFactory<Program> factory)
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

        private string GenerateJwtToken(string userId, bool isAdmin = false)
        {
            var tokenHandler = new JwtSecurityTokenHandler();
            var key = Encoding.ASCII.GetBytes("YourStrongSecretKeyHereWithAtLeast32Characters");
            var claims = new List<Claim>
            {
                new Claim(ClaimTypes.NameIdentifier, userId)
            };

            if (isAdmin)
            {
                claims.Add(new Claim(ClaimTypes.Role, "Admin"));
            }

            var tokenDescriptor = new SecurityTokenDescriptor
            {
                Subject = new ClaimsIdentity(claims),
                Expires = DateTime.UtcNow.AddHours(1),
                SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(key), SecurityAlgorithms.HmacSha256Signature)
            };
            var token = tokenHandler.CreateToken(tokenDescriptor);
            return tokenHandler.WriteToken(token);
        }

        private string GetValidToken(Guid userId, bool isAdmin = false)
        {
            return GenerateJwtToken(userId.ToString(), isAdmin);
        }

        [Fact]
        public async Task GetAllReviewBusinesses_ShouldReturnOk()
        {
            var token = GetValidToken(Guid.NewGuid(), true);
            _client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);

            var response = await _client.GetAsync($"{BaseUrl}/GetAllReviewBusinesses");
            response.Should().NotBeNull();
            response.EnsureSuccessStatusCode();
        }

        [Fact]
        public async Task GetPaginatedReviewBusinesses_ShouldReturnOk()
        {
            var token = GetValidToken(Guid.NewGuid(), true);
            _client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);

            var response = await _client.GetAsync($"{BaseUrl}/GetPaginatedReviewBusinesses?page=1&pageSize=10&keyword=test");
            response.Should().NotBeNull();
            response.EnsureSuccessStatusCode();

            var result = await response.Content.ReadFromJsonAsync<PagedResult<ReviewDto>>();
            result.Should().NotBeNull();
        }

        [Fact]
        public async Task GetReviewBusinessById_ShouldReturnOk()
        {
            var business = new Business
            {
                BusinessID = Guid.NewGuid(),
                Name = "Test Business",
                Description = "Test Description",
                Address = "Test Address",
                PhoneNumber = "1234567890"
            };
            _dbContext.Businesses.Add(business);

            var userBusiness = new UserBusiness
            {
                UserId = Guid.NewGuid(),
                Name = "Test User Business",
                Email = "testuserbusiness@example.com",
                Password = BCrypt.Net.BCrypt.HashPassword("password"),
                UserType = UserType.Business,
                Image = Convert.ToBase64String(Encoding.UTF8.GetBytes("image_data")),
                Business = business
            };
            _dbContext.UserBusinesses.Add(userBusiness);

            var userClient = new UserClient
            {
                UserId = Guid.NewGuid(),
                Name = "Test User Client",
                Email = "testuserclient@example.com",
                Password = BCrypt.Net.BCrypt.HashPassword("password"),
                UserType = UserType.Client,
                Image = Convert.ToBase64String(Encoding.UTF8.GetBytes("image_data"))
            };
            _dbContext.UserClients.Add(userClient);

            var review = new Review
            {
                ReviewId = Guid.NewGuid(),
                UserClientId = userClient.UserId,
                BusinessId = business.BusinessID,
                Rating = 5,
                Comment = "Great service!"
            };
            _dbContext.Reviews.Add(review);
            _dbContext.SaveChanges();

            var token = GetValidToken(userClient.UserId, true);
            _client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);

            var response = await _client.GetAsync($"{BaseUrl}/GetReviewBusinessById/{review.ReviewId}");
            response.Should().NotBeNull();
            response.EnsureSuccessStatusCode();

            var result = await response.Content.ReadFromJsonAsync<ReviewDto>();
            result.Should().NotBeNull();
        }

        [Fact]
        public async Task CreateReviewBusiness_ShouldReturnCreated()
        {
            var business = new Business
            {
                BusinessID = Guid.NewGuid(),
                Name = "Test Business",
                Description = "Test Description",
                Address = "Test Address",
                PhoneNumber = "1234567890"
            };
            _dbContext.Businesses.Add(business);

            var userBusiness = new UserBusiness
            {
                UserId = Guid.NewGuid(),
                Name = "Test User Business",
                Email = "testuserbusiness@example.com",
                Password = BCrypt.Net.BCrypt.HashPassword("password"),
                UserType = UserType.Business,
                Image = Convert.ToBase64String(Encoding.UTF8.GetBytes("image_data")),
                Business = business
            };
            _dbContext.UserBusinesses.Add(userBusiness);

            var userClient = new UserClient
            {
                UserId = Guid.NewGuid(),
                Name = "Test User Client",
                Email = "testuserclient@example.com",
                Password = BCrypt.Net.BCrypt.HashPassword("password"),
                UserType = UserType.Client,
                Image = Convert.ToBase64String(Encoding.UTF8.GetBytes("image_data"))
            };
            _dbContext.UserClients.Add(userClient);
            _dbContext.SaveChanges();

            var command = new CreateReviewBusinessCommand
            {
                UserClientId = userClient.UserId,
                BusinessId = business.BusinessID,
                Rating = 5,
                Comment = "Excellent!"
            };

            var token = GetValidToken(userClient.UserId, true);
            _client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);

            var response = await _client.PostAsJsonAsync($"{BaseUrl}/CreateReviewBusiness", command);
            response.Should().NotBeNull();
            response.StatusCode.Should().Be(System.Net.HttpStatusCode.Created);
        }

        [Fact]
        public async Task UpdateReviewBusiness_ShouldReturnNoContent()
        {
            var business = new Business
            {
                BusinessID = Guid.NewGuid(),
                Name = "Test Business",
                Description = "Test Description",
                Address = "Test Address",
                PhoneNumber = "1234567890"
            };
            _dbContext.Businesses.Add(business);

            var userBusiness = new UserBusiness
            {
                UserId = Guid.NewGuid(),
                Name = "Test User Business",
                Email = "testuserbusiness@example.com",
                Password = BCrypt.Net.BCrypt.HashPassword("password"),
                UserType = UserType.Business,
                Image = Convert.ToBase64String(Encoding.UTF8.GetBytes("image_data")),
                Business = business
            };
            _dbContext.UserBusinesses.Add(userBusiness);

            var userClient = new UserClient
            {
                UserId = Guid.NewGuid(),
                Name = "Test User Client",
                Email = "testuserclient@example.com",
                Password = BCrypt.Net.BCrypt.HashPassword("password"),
                UserType = UserType.Client,
                Image = Convert.ToBase64String(Encoding.UTF8.GetBytes("image_data"))
            };
            _dbContext.UserClients.Add(userClient);

            var review = new Review
            {
                ReviewId = Guid.NewGuid(),
                UserClientId = userClient.UserId,
                BusinessId = business.BusinessID,
                Rating = 4,
                Comment = "Good service!"
            };
            _dbContext.Reviews.Add(review);
            _dbContext.SaveChanges();

            var command = new UpdateReviewBusinessCommand
            {
                ReviewId = review.ReviewId,
                UserClientId = review.UserClientId,
                BusinessId=business.BusinessID,
                Rating = 5,
                Comment = "Excellent service!"
            };

            var token = GetValidToken(userClient.UserId, true);
            _client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);

            var response = await _client.PutAsJsonAsync($"{BaseUrl}/UpdateReviewBusiness/{review.ReviewId}", command);
            response.Should().NotBeNull();
            response.StatusCode.Should().Be(System.Net.HttpStatusCode.NoContent);
        }

        [Fact]
        public async Task DeleteReviewBusiness_ShouldReturnNoContent()
        {
            var business = new Business
            {
                BusinessID = Guid.NewGuid(),
                Name = "Test Business",
                Description = "Test Description",
                Address = "Test Address",
                PhoneNumber = "1234567890"
            };
            _dbContext.Businesses.Add(business);

            var userBusiness = new UserBusiness
            {
                UserId = Guid.NewGuid(),
                Name = "Test User Business",
                Email = "testuserbusiness@example.com",
                Password = BCrypt.Net.BCrypt.HashPassword("password"),
                UserType = UserType.Business,
                Image = Convert.ToBase64String(Encoding.UTF8.GetBytes("image_data")),
                Business = business
            };
            _dbContext.UserBusinesses.Add(userBusiness);

            var userClient = new UserClient
            {
                UserId = Guid.NewGuid(),
                Name = "Test User Client",
                Email = "testuserclient@example.com",
                Password = BCrypt.Net.BCrypt.HashPassword("password"),
                UserType = UserType.Client,
                Image = Convert.ToBase64String(Encoding.UTF8.GetBytes("image_data"))
            };
            _dbContext.UserClients.Add(userClient);

            var review = new Review
            {
                ReviewId = Guid.NewGuid(),
                UserClientId = userClient.UserId,
                BusinessId = business.BusinessID,
                Rating = 3,
                Comment = "Average service."
            };
            _dbContext.Reviews.Add(review);
            _dbContext.SaveChanges();

            var token = GetValidToken(userClient.UserId, true);
            _client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);

            var response = await _client.DeleteAsync($"{BaseUrl}/{review.ReviewId}");
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
