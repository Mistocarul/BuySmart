namespace Domain.Entities
{
    public class Business
    {
        public Guid BusinessID { get; set; }
        public string Name { get; set; } = string.Empty;
        public string Description { get; set; } = string.Empty;
        public string Address { get; set; } = string.Empty;
        public string PhoneNumber { get; set; } = string.Empty;

        //User Business: Business (1:1)
        public Guid UserBusinessId { get; set; }
        public UserBusiness UserBusiness { get; set; } = null!; 

        public ICollection<Product> Products { get; set; } = new List<Product>();
        public ICollection<Review> Reviews { get; set; } = new List<Review>();
        public ICollection<Order> Orders { get; set; } = new List<Order>();

    }
}
