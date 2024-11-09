using Application.Commands;
using Application.DTOs;
using AutoMapper;
using Domain.Entities;

namespace Application.Utils
{
    public class MappingProfile : Profile
    {
        public MappingProfile()
        {
            CreateMap<Product, ProductDto>().ReverseMap();
<<<<<<< Updated upstream
            CreateMap<User, UserDto>().ReverseMap();
            CreateMap<CreateUserCommand, User>().ReverseMap();
            CreateMap<UpdateUserCommand, User>().ReverseMap();
=======
            CreateMap<UserClient, UserClientDto>().ReverseMap();
            CreateMap<CreateUserClientCommand, UserClient>().ReverseMap();
            CreateMap<UpdateUserClientCommand, UserClient>().ReverseMap();
            CreateMap<CreateBusinessCommand, Business>().ReverseMap();
            CreateMap<UpdateBusinessCommand, Business>().ReverseMap();
            CreateMap<Business, BusinessDto>().ReverseMap();

>>>>>>> Stashed changes
        }
    }
}
