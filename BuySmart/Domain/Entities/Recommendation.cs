namespace Domain.Entities
{
    public class Recommendation
    {
        public Guid RecommendationId { get; set; }

        //User Client: Recommendation (1:N)
        public Guid UserClientId { get; set; }
        public UserClient UserClient { get; set; } = null!;

        //Product : Recommendation (1:N)
        public Guid ProductId { get; set; }
        public Product Product { get; set; } = null!;

        public DateTime RecommendationDate { get; set; }
        public double RelevanceScore { get; set; }
    }
}
