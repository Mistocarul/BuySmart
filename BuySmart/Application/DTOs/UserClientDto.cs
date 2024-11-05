using Domain.Entities;

namespace Application.DTOs
{
    public class UserClientDto
    {
        public Guid UserId { get; set; }
        public string Name { get; set; }
        public string Email { get; set; }
        public UserType UserType { get; set; }
        public string Image { get; set; }
    }
}
