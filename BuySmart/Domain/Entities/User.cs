namespace Domain.Entities
{
    public class User
    {
        public Guid UserId { get; set; }
        public string Name { get; set; } = string.Empty;
        public string Email { get; set; } = string.Empty;
        public string Password { get; set; } = string.Empty;
        public UserType UserType { get; set; }
        public string Image { get; set; } = string.Empty;
    }

    public enum UserType
    {
        Client,
        Business,
        Admin
    }
}
