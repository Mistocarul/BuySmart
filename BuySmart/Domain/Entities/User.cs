namespace Domain.Entities
{
    public class User
    {
        public Guid UserId { get; set; }
        public string Name { get; set; } = string.Empty;
        public string Email { get; set; } = string.Empty;
        public string Password { get; set; } = string.Empty;
        public string Role { get; set; } = string.Empty;
        public string Image { get; set; } = string.Empty;
        public DateTime CreatedAt { get; set; }

        public Cart Cart { get; set; } // 1 user has 1 cart

        public Business Business { get; set; } // 1 user has 1 business

        public ICollection<Review> Reviews { get; set; } = new List<Review>(); // 1 user has many reviews
    }
}
