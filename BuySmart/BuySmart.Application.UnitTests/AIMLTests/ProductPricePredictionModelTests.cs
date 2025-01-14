using Application.AIML;

namespace BuySmart.Application.UnitTests.AIML
{
    public class ProductPricePredictionModelTests
    {
        private readonly ProductPricePredictionModel model;

        public ProductPricePredictionModelTests()
        {
            model = new ProductPricePredictionModel();
        }

        [Fact]
        public void Train_ShouldTrainModel()
        {
            
            var trainingData = new List<ProductData>
            {
                new ProductData { Description = "Product 1", Price = 10.0f },
                new ProductData { Description = "Product 2", Price = 20.0f }
            };

           
            model.Train(trainingData);

            
        }

        [Fact]
        public void Predict_ShouldReturnPredictedPrice()
        {
            
            var trainingData = new List<ProductData>
            {
                new ProductData { Description = "Product 1", Price = 10.0f },
                new ProductData { Description = "Product 2", Price = 20.0f }
            };
            model.Train(trainingData);

            var product = new ProductData { Description = "Product 3", Price = 0.0f };

           
            var predictedPrice = model.Predict(product);

            
            Assert.NotEqual(0.0f, predictedPrice); // Ensure the predicted price is not the default value
        }

        [Fact]
        public void Evaluate_ShouldEvaluateModel()
        {
            
            var trainingData = new List<ProductData>
            {
                new ProductData { Description = "Product 1", Price = 10.0f },
                new ProductData { Description = "Product 2", Price = 20.0f }
            };
            model.Train(trainingData);

            var testData = new List<ProductData>
            {
                new ProductData { Description = "Product 3", Price = 15.0f },
                new ProductData { Description = "Product 4", Price = 25.0f }
            };

           
            model.Evaluate(testData);

        }

        [Fact]
        public void Evaluate_ShouldPrintMessage_WhenModelNotTrained()
        {
            
            var testData = new List<ProductData>
            {
                new ProductData { Description = "Product 3", Price = 15.0f },
                new ProductData { Description = "Product 4", Price = 25.0f }
            };

            
            model.Evaluate(testData);

           
        }
    }
}





