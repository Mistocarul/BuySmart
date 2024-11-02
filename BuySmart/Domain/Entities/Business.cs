namespace Domain.Entities
{
    public class Business
    {
        public Guid BusinessID { get; set; }
        public Guid UserId { get; set; }
        public Guid ProductId { get; set; }

        // Navigation properties
        public User User { get; set; }
        public ICollection<Product> Products { get; set; } = new List<Product>();

    }
}
