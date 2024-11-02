namespace Domain.Entities
{
    public class Product
    {
        public Guid ProductId { get; set; }
        public string Name { get; set; } = string.Empty;
        public string Description { get; set; } = string.Empty;
        public decimal Price { get; set; }
        public double Stock { get; set; }
        public double Rating { get; set; }
        public string Image { get; set; } = string.Empty;
        public DateTime CreatedAt { get; set; }

        // Foreign key for Category
        public Guid CategoryId { get; set; }
        // Navigation property for the one-to-many relationship
        public Category Category { get; set; }

        public ICollection<Review> Reviews { get; set; } = new List<Review>(); // 1 product has many reviews
    }
}
