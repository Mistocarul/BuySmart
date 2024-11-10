namespace Application.DTOs
{
    public class ReviewDto
    {
        public Guid ReviewId { get; set; }
        public Guid UserClientId { get; set; }
        public double Rating { get; set; }
        public string Comment { get; set; } = string.Empty;
        public Guid? BusinessId { get; set; }
        public Guid? ProductId { get; set; }
    }
}
