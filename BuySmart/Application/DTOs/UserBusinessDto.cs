using Domain.Entities;

namespace Application.DTOs
{
    public class UserBusinessDto : UserDto
    {
        public UserType UserType { get; set; } = UserType.Business;

    }
}
