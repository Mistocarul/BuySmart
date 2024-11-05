namespace Domain.Entities
{
    public class OrderItem
    {
        public Guid OrderItemId { get; set; }

        //Order : OrderItem (1:N)
        public Guid? OrderId { get; set; }
        public Order Order { get; set; } = null!;

        //Cart : OrderItem (1:N)
        public Guid? CartId { get; set; }
        public Cart Cart { get; set; } = null!;

        //Product : OrderItem (1:N)
        public Guid ProductId { get; set; }
        public Product Product { get; set; } = null!;

        public double Quantity { get; set; }
        public double Price { get; set; }
    }
}
