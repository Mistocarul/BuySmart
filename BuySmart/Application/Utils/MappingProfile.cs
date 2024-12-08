using Application.Commands.BusinessCommands;
using Application.Commands.CartCommands;

using Application.Commands.ProductCommands;
using Application.Commands.CategoryCommands;

using Application.Commands.ReviewBusinessCommands;
using Application.Commands.UserBusinessCommands;
using Application.Commands.UserClientCommands;
using Application.DTOs;
using AutoMapper;
using Domain.Entities;
using Application.Authentication;

namespace Application.Utils
{
    public class MappingProfile : Profile
    {
        public MappingProfile()
        {
            CreateMap<Product, ProductDto>().ReverseMap();

            CreateMap<CreateProductCommand, Product>().ReverseMap();
            CreateMap<UpdateProductCommand, Product>().ReverseMap();


            CreateMap<User, UserDto>().ReverseMap();
            CreateMap<RegisterUserCommand, User>().ReverseMap();
            CreateMap<LoginUserCommand, User>().ReverseMap();
            CreateMap<User, UserClient>().ReverseMap();
            CreateMap<User, UserBusiness>().ReverseMap();

            CreateMap<UserClient, UserClientDto>().ReverseMap();
            CreateMap<CreateUserClientCommand, UserClient>().ReverseMap();
            CreateMap<UpdateUserClientCommand, UserClient>().ReverseMap();
            CreateMap<CreateUserBusinessCommand, UserBusiness>().ReverseMap();
            CreateMap<UpdateUserBusinessCommand, UserBusiness>().ReverseMap();
            CreateMap<UserBusiness, UserBusinessDto>().ReverseMap();

            CreateMap<CreateBusinessCommand, Business>().ReverseMap();
            CreateMap<UpdateBusinessCommand, Business>().ReverseMap();
            CreateMap<Business, BusinessDto>().ReverseMap();

            CreateMap<CreateReviewBusinessCommand, Review>().ReverseMap();
            CreateMap<UpdateReviewBusinessCommand, Review>().ReverseMap();
            CreateMap<Review, ReviewDto>().ReverseMap();
            CreateMap<CreateCartCommand, Cart>().ReverseMap();
            CreateMap<Cart, CartDto>().ReverseMap();


            CreateMap<CreateCategoryCommand, Category>().ReverseMap();
            CreateMap<UpdateCategoryCommand, Category>().ReverseMap();
            CreateMap<Category, CategoryDto>().ReverseMap();

        }
    }
}
