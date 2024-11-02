namespace Domain.Entities
{
    public class User
    {
        public Guid Id { get; set; }
        public string Name { get; set; } = string.Empty;
        public string Email { get; set; } = string.Empty;
        public string Password { get; set; } = string.Empty;
        public string Role { get; set; } = string.Empty;
        public string Image { get; set; } = string.Empty;
        public DateTime CreatedAt { get; set; }

        public ICollection<Product> products { get; set; } = new List<Product>(); // 1 user has many products
        public ICollection<Order> orders { get; set; } = new List<Order>(); // 1 user has many orders
        public Cart cart { get; set; } // 1 user has 1 cart

    }
}
