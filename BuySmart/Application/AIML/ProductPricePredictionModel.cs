using Microsoft.ML;
using Microsoft.ML.Data;
using Microsoft.ML.Trainers;

namespace Application.AIML
{
    public class ProductPricePredictionModel
    {
        private readonly MLContext mlContext;
        private TransformerChain<RegressionPredictionTransformer<LinearRegressionModelParameters>>? model;


        public ProductPricePredictionModel() => mlContext = new MLContext();

        public void Train(List<ProductData> trainingData)
        {
            var data = mlContext.Data.LoadFromEnumerable(trainingData);

            var pipeline = mlContext.Transforms.Text.FeaturizeText("DescriptionFeaturized", nameof(ProductData.Description))
                .Append(mlContext.Transforms.Concatenate("Features", "DescriptionFeaturized"))
                .Append(mlContext.Transforms.CopyColumns("Label", nameof(ProductData.Price)))
                .Append(mlContext.Regression.Trainers.Sdca(labelColumnName: "Label", featureColumnName: "Features", maximumNumberOfIterations: 100));

            model = pipeline.Fit(data);

            Evaluate(trainingData);
        }

        public float Predict(ProductData product)
        {
            var predictionEngine = mlContext.Model.CreatePredictionEngine<ProductData, ProductPricePrediction>(model);
            var prediction = predictionEngine.Predict(product);
            Console.WriteLine($"Description: {product.Description}, Predicted Price: {prediction.Price}");
            return prediction.Price;
        }

        public void Evaluate(List<ProductData> testData)
        {
            if (model == null)
            {
                Console.WriteLine("The model has not been trained yet. Please train the model before evaluation.");
                return;
            }

            var data = mlContext.Data.LoadFromEnumerable(testData);
            var predictions = model.Transform(data);

            var metrics = mlContext.Regression.Evaluate(predictions);
            Console.WriteLine($"R^2: {metrics.RSquared}");
            Console.WriteLine($"Root Mean Squared Error (RMSE): {metrics.RootMeanSquaredError}");
        }
    }
}

