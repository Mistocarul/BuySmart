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
            CreateMap<UserClient, UserClientDto>().ReverseMap();
            CreateMap<CreateUserClientCommand, UserClient>().ReverseMap();
            CreateMap<UpdateUserClientCommand, UserClient>().ReverseMap();
        }
    }
}
