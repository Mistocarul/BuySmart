using System.IdentityModel.Tokens.Jwt;
using System.Net.Http.Headers;
using System.Net.Http.Json;
using System.Security.Claims;
using System.Text;
using Application.AIML;
using FluentAssertions;
using Infrastructure.Persistence;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc.Testing;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using Xunit;
using BuySmart.Controllers;

namespace BuySmart.IntegrationTests
{
    public class ProductPricePredictionControllerIntegrationTests : IClassFixture<WebApplicationFactory<Program>>, IDisposable
    {
        private readonly WebApplicationFactory<Program> _factory;
        private readonly HttpClient _client;
        private readonly ApplicationDbContext _dbContext;
        private readonly IConfiguration _configuration;

        private const string BaseUrl = "/api/v1/ProductPricePrediction";

        public ProductPricePredictionControllerIntegrationTests(WebApplicationFactory<Program> factory)
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
            _configuration = _factory.Services.GetRequiredService<IConfiguration>();
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
        public async Task PredictPrice_ShouldReturnUnauthorized_WhenNoToken()
        {
            var product = new ProductData
            {
                Description = "Test Product",
                Price = 100.0f
            };

            var response = await _client.PostAsJsonAsync($"{BaseUrl}/predict", product);
            response.Should().NotBeNull();
            response.StatusCode.Should().Be(System.Net.HttpStatusCode.Unauthorized);
        }

        [Fact]
        public void InitializeModel_ShouldReturnFailure_WhenPathIsNotConfigured()
        {
            var configuration = new ConfigurationBuilder().Build();
            var controller = new ProductPricePredictionController(configuration);

            var result = controller.InitializeModel(configuration);
            result.IsSuccess.Should().BeFalse();
            result.ErrorMessage.Should().Be("The path to the products dataset is not configured.");
        }

       

        public void Dispose()
        {
            _dbContext.Database.EnsureDeleted();
            _dbContext.Dispose();
            _client.Dispose();
        }
    }
}

