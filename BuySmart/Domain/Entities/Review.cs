namespace Domain.Entities
{
    public class Review
    {
        public Guid Id { get; set; }
        public Guid ProductId { get; set; } // Foreign Key to Product
        public Guid UserId { get; set; } // Foreign Key to User
        public double Rating { get; set; }
        public string Comment { get; set; }
        public DateTime CreatedAt { get; set; }

        // Navigational Properties
        public Product Product { get; set; }
        public User User { get; set; }
    }
}
