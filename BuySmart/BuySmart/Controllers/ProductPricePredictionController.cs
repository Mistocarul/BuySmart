using Application.AIML;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace BookManagement.Controllers
{
    [Route("api/v1/[controller]")]
    [ApiController]
    public class ProductPricePredictionController : ControllerBase
    {
        private readonly ProductPricePredictionModel productPricePredictionModel;
        private readonly IConfiguration configuration;
        public ProductPricePredictionController(IConfiguration configuration)
        {
            this.configuration = configuration;
            productPricePredictionModel = new ProductPricePredictionModel();

            string relativePath = configuration["PathToProductsDataset:Path"];
            string projectRoot = Directory.GetParent(AppContext.BaseDirectory).Parent.Parent.Parent.FullName;
            string fullPathToDataset = Path.Combine(projectRoot, relativePath);

            var sampleData = ProductDataGenerator.GetProducts(fullPathToDataset);
            productPricePredictionModel.Train(sampleData);
        }

        [Authorize]
        [HttpPost("predict")]
        public ActionResult<float> PredictPrice(ProductData product)
        {
            float predictedPrice = productPricePredictionModel.Predict(product);
            return Ok(predictedPrice.ToString("F2"));
        }

    }
}