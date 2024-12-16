using Microsoft.ML.Data;

namespace Application.AIML
{
    public class ProductPricePrediction
    {
        [ColumnName("Score")]
        public float Price { get; set; }
    }
}
