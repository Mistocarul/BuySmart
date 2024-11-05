namespace Domain.Entities
{
    public class Cart
    {
        public Guid CartId { get; set; }

        // UserClient: Cart (1:1)
        public Guid UserClientId { get; set; } // FK to User
        public UserClient UserClient { get; set; } = null!; // 1 cart belongs to 1 user


        // Cart : OrderItem (1:N)
        public ICollection<OrderItem> OrderItems { get; set; } = new List<OrderItem>();
    }
}
