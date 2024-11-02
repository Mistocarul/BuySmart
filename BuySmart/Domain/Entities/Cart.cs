namespace Domain.Entities
{
    public class Cart
    {
        public Guid CartId { get; set; }
        public Guid UserId { get; set; } // FK to User
        public User User { get; set; } // 1 cart belongs to 1 user

        // Navigation property for the one-to-many relationship with Item
        public ICollection<Item> Items { get; set; } = new List<Item>();
    }
}
