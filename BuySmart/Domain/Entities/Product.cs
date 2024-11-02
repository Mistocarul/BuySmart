namespace Domain.Entities
{
    public class Product
    {
        public Guid Id { get; set; }
        public string Name { get; set; } = string.Empty;
        public string Description { get; set; } = string.Empty;
        public decimal Price { get; set; }
        public double Stock { get; set; }
        public double Rating { get; set; }
        public double Weight { get; set; } 
        public string Image { get; set; } = string.Empty;
        public DateTime CreatedAt { get; set; }

        public Guid CategoryId { get; set; }
        public ICollection<Category> categories { get; set; } = new List<Category>(); // 1 product has many categories
    }
}
