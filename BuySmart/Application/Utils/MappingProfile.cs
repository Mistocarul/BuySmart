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
            CreateMap<CreateUserBusinessCommand, UserBusiness>().ReverseMap();
            CreateMap<UpdateUserBusinessCommand, UserBusiness>().ReverseMap();
            CreateMap<UserBusiness, UserBusinessDto>().ReverseMap();

            CreateMap<CreateBusinessCommand, Business>().ReverseMap();
            CreateMap<UpdateBusinessCommand, Business>().ReverseMap();
            CreateMap<Business, BusinessDto>().ReverseMap();

        }
    }
}
