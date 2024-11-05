namespace Domain.Entities
{
    public class UserClient : User
    {
        public ICollection<Order> Orders { get; set; } = new List<Order>();
        public ICollection<Review> Reviews { get; set; } = new List<Review>();
        public ICollection<History> Histories { get; set; } = new List<History>();
        public ICollection<Recommendation> Recommendations { get; set; } = new List<Recommendation>();
        public Cart? Cart { get; set; }

    }
}
