using Domain.Entities;

namespace Application.DTOs
{
    public class UserClientDto : UserDto
    {
        public UserType UserType { get; set; } = UserType.Client;
    }
}
