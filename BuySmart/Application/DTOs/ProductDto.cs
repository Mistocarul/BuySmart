namespace Application.DTOs
{
    public class ProductDto
    {
        public Guid ProductId { get; set; }
        public string Name { get; set; } = string.Empty;
        public string Description { get; set; } = string.Empty;
        public decimal Price { get; set; }
        public double Stock { get; set; }
        public double Rating { get; set; }

    }
}
