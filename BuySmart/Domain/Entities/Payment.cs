namespace Domain.Entities
{
    public class Payment
    {
        public Guid Id { get; set; }
        public DateTime PaymentDate { get; set; }
        public decimal Amount { get; set; }
        public string PaymentMethod { get; set; } = string.Empty;
        
        public Guid OrderId { get; set; } //FK to Order
        public Order Order { get; set; }
    }
}
