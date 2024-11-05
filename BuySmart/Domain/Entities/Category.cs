namespace Domain.Entities
{
    public class Category
    {
        public Guid CategoryId { get; set; }
        public string Name { get; set; } = string.Empty;
        public string Description { get; set; } = string.Empty;

        // Product : Category (N:N)
        public ICollection<Product> Products { get; set; } = new List<Product>();
    }
}
