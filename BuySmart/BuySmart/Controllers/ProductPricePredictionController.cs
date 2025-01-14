using Application.AIML;
using Domain.Common;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace BuySmart.Controllers
{
    [Route("api/v1/[controller]")]
    [ApiController]
    public class ProductPricePredictionController : ControllerBase
    {
        private readonly ProductPricePredictionModel productPricePredictionModel;

        public ProductPricePredictionController(IConfiguration configuration)
        {
            productPricePredictionModel = new ProductPricePredictionModel();
            var result = InitializeModel(configuration);

            if (!result.IsSuccess)
            {
                Console.WriteLine(result.ErrorMessage);
            }
        }

        public Result<string> InitializeModel(IConfiguration configuration)
        {
            string? relativePath = configuration["PathToProductsDataset:Path"];
            if (string.IsNullOrEmpty(relativePath))
            {
                return Result<string>.Failure("The path to the products dataset is not configured.");
            }

            var projectRootDir = Directory.GetParent(AppContext.BaseDirectory)?.Parent?.Parent?.Parent;
            if (projectRootDir == null)
            {
                return Result<string>.Failure("Could not determine the project root directory.");
            }

            string fullPathToDataset = Path.Combine(projectRootDir.FullName, relativePath);


            var sampleData = ProductDataGenerator.GetProducts(fullPathToDataset);
            if (sampleData == null || sampleData.Count == 0)
            {
                return Result<string>.Failure("No data was loaded from the dataset.");
            }

            productPricePredictionModel.Train(sampleData);

            return Result<string>.Success("Product price prediction model initialized successfully.");
        }

        [Authorize]
        [HttpPost("predict")]
        public ActionResult<float> PredictPrice([FromBody] ProductData product)
        {
            if (productPricePredictionModel == null)
            {
                return StatusCode(500, "Prediction model is not initialized.");
            }

            float predictedPrice = productPricePredictionModel.Predict(product);
            return Ok(predictedPrice.ToString("F2")); 
        }
    }
}
