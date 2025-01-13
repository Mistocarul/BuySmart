namespace Application.DTOs
{
    public class BusinessDto
    {
        public Guid BusinessId { get; set; } = Guid.Empty;
        public string Name { get; set; } = string.Empty;
        public string Description { get; set; } = string.Empty;
        public string Address { get; set; } = string.Empty;
        public string PhoneNumber { get; set; } = string.Empty;

        //User Business: Business (1:1)
        public Guid UserBusinessId { get; set; } = Guid.Empty;


    }
}
