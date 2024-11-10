namespace Domain.Entities
{
    public class Review
    {
        public Guid ReviewId { get; set; }

        //User Client: Review (1:N)
        public Guid UserClientId { get; set; }
        public UserClient UserClient { get; set; } = null!;

        //Business : Review (1:N)
        public Guid? BusinessId { get; set; }
        public Business? Business { get; set; }

        //Product : Review (1:N)
        public Guid? ProductId { get; set; }
        public Product? Product { get; set; }

        public double Rating { get; set; }
        public string Comment { get; set; } = string.Empty;
        public DateTime ReviewDate { get; set; } = DateTime.UtcNow;
    }
}
