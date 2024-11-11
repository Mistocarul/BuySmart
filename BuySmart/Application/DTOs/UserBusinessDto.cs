using Domain.Entities;

namespace Application.DTOs
{
    public class UserBusinessDto
    {
        public Guid UserId { get; set; }
        public string Name { get; set; } = string.Empty;
        public string Email { get; set; } = string.Empty;
        public UserType UserType { get; set; } = UserType.Business;
        public string Image { get; set; } = string.Empty;

    }
}
