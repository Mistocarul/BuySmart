namespace Domain.Entities
{
    public class Category
    {
        public Guid CategoryId { get; set; }
        public string Name { get; set; } = string.Empty;
        public string Description { get; set; } = string.Empty;

        // Navigation property for the many-to-many relationship
        public ICollection<Product> Products { get; set; } = new List<Product>();
    }
}
