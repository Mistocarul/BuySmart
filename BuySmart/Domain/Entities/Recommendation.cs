namespace Domain.Entities
{
    public class Recommendation
    {
        public Guid UserId { get; set; } // Foreign Key to User
        public Guid ProductId { get; set; } // Foreign Key to Product
        public double Score { get; set; }
        
        // Navigational Properties
        public User User { get; set; }
        public Product Product { get; set; }
    }
}
