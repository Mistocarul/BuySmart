namespace Domain.Entities
{
    public class Item
    {
        public Guid ItemId { get; set; }
        public Guid CartId { get; set; } // FK to Cart
        public Cart Cart { get; set; } // 1 item belongs to 1 cart

        public Guid ProductId { get; set; } // FK to Product
        public Product Product { get; set; } // 1 item refers to 1 product

        public double Quantity { get; set; } // Quantity of the product in the cart
    }
}
