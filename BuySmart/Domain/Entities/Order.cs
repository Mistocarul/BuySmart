namespace Domain.Entities
{
    public class Order
    {
        public Guid OrderId { get; set; }
        public OrderStatus OrderStatus { get; set; }
        public double TotalPrice { get; set; }
        public DateTime OrderDate { get; set; } = DateTime.UtcNow;
        public string DeliveryPhoneNumber { get; set; } = string.Empty;

        public PaymentMethod PaymentMethod { get; set; }
        public string DeliveryAddress { get; set; } = string.Empty;

        //User Client: Order (1:N)
        public Guid UserClientId { get; set; }
        public UserClient UserClient { get; set; } = null!;

        //Business : Order (1:N)
        public Guid BusinessId { get; set; }
        public Business Business { get; set; } = null!;

        //Order : OrderItem (1:N)
        public ICollection<OrderItem> OrderItems { get; set; } = new List<OrderItem>();

    }
    public enum OrderStatus
    {
        Pending,
        Processing,
        Delivered,
        Cancelled
    }

    public enum PaymentMethod
    {
        CreditCard,
        Cash
    }
}
