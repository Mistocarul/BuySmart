namespace Domain.Entities
{
    public class History 
    {
        public Guid HistoryId { get; set; }

        //User Client: History (1:N)
        public Guid UserClientId { get; set; }
        public UserClient UserClient { get; set; } = null!;

        //Product : History (1:N)
        public Guid ProductId { get; set; }
        public Product Product { get; set; } = null!;

        public DateTime AccesDate { get; set; }
    }
}
