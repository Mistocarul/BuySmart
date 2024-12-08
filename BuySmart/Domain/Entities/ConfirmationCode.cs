namespace Domain.Entities
{
    public class ConfirmationCode
    {
        public Guid CodeId { get; set; }
        public int Code { get; set; }
        public DateTime CreationTime { get; set; }
        public string Name { get; set; } = string.Empty;
        public string Email { get; set; } = string.Empty;
        public string Password { get; set; } = string.Empty;
        public UserType UserType { get; set; }
        public byte[] Image { get; set; } = Array.Empty<byte>();
    }
}