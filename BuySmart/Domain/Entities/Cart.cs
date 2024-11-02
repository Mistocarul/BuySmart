namespace Domain.Entities
{
    public class Cart
    {
        public Guid Id { get; set; }
        public Guid UserId { get; set; } // FK to User
        public User User { get; set; } // 1 cart belongs to 1 user

        public ICollection<CartItem> CartItems { get; set; } = new List<CartItem>(); // 1 cart has many cart items
    }
}
