using CsvHelper;
using CsvHelper.Configuration;
using System.Globalization;

namespace Application.AIML
{
    public class ProductDataGenerator
    {
        public static List<ProductData> GetProducts(string filePath)
        {
            var products = new List<ProductData>();

            using (var reader = new StreamReader(filePath))
            using (var csv = new CsvReader(reader, new CsvConfiguration(CultureInfo.InvariantCulture)))
            {
                var records = csv.GetRecords<dynamic>().ToList();

                foreach (var record in records)
                {
                    var description = record.ITEM_DESC?.ToString();
                    var priceString = record.PRICE?.ToString();



                    if (string.IsNullOrEmpty(description) || string.IsNullOrEmpty(priceString) || priceString == "0.0" || priceString == "0")
                    {
                        continue;
                    }

                    //Console.WriteLine($"Description: {description}, Price: {priceString}");

                    float price = 0;

                    if (!string.IsNullOrEmpty(priceString) && float.TryParse(priceString, NumberStyles.Any, CultureInfo.InvariantCulture, out price))
                    {
                        // Prețul va fi corect interpretat
                    }

                    products.Add(new ProductData
                    {
                        Description = description,
                        Price = price
                    });
                }
            }

            return products;
        }
    }
}
