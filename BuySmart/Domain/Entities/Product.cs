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

        // Business : Product (1:N)
        public Guid BusinessId { get; set; } // FK to Business
        public Business Business { get; set; } = null!;

        // Product : Category (N:N)
        public ICollection<Category> Categories { get; set; } = new List<Category>();

        // Product : OrderItem (1:N)
        public ICollection<OrderItem> OrderItems { get; set; } = new List<OrderItem>(); // 1 product has many order items

        // Product : Review (1:N)
        public ICollection<Review> Reviews { get; set; } = new List<Review>(); // 1 product has many reviews

        // Product : History (1:N)
        public ICollection<History> Histories { get; set; } = new List<History>(); // 1 product has many histories

        //Product : Recommendation (1:N)
        public ICollection<Recommendation> Recommendations { get; set; } = new List<Recommendation>(); // 1 product has many recommendations
    }
}
