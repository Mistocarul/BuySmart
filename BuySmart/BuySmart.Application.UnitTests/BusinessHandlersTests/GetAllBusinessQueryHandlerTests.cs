using Application.DTOs;
using Application.QueryHandlers.BusinessQueryHandlers;
using Application.Queries.BusinessQueries;
using AutoMapper;
using Domain.Entities;
using Domain.Repositories;
using NSubstitute;

namespace BuySmart.Application.UnitTests.BusinessHandlersTests
{
    public class GetAllBusinessQueryHandlerTests
    {
        private readonly IMapper _mapper;
        private readonly IBusinessRepository _businessRepository;
        private readonly GetAllBusinessQueryHandler _handler;

        public GetAllBusinessQueryHandlerTests()
        {
            _mapper = Substitute.For<IMapper>();
            _businessRepository = Substitute.For<IBusinessRepository>();
            _handler = new GetAllBusinessQueryHandler(_businessRepository, _mapper);
        }

        [Fact]
        public async Task Handle_ShouldReturnListOfBusinessDtos_WhenBusinessesExist()
        {
            // Arrange
            var businesses = new List<Business>
            {
                new Business
                {
                    BusinessID = Guid.NewGuid(),
                    Name = "Business 1",
                    Description = "Description 1",
                    Address = "Address 1",
                    PhoneNumber = "1234567890"
                },
                new Business
                {
                    BusinessID = Guid.NewGuid(),
                    Name = "Business 2",
                    Description = "Description 2",
                    Address = "Address 2",
                    PhoneNumber = "0987654321"
                }
            };

            var businessDtos = new List<BusinessDto>
            {
                new BusinessDto
                {
                    
                    Name = businesses[0].Name,
                    Description = businesses[0].Description,
                    Address = businesses[0].Address,
                    PhoneNumber = businesses[0].PhoneNumber
                },
                new BusinessDto
                {
                   
                    Name = businesses[1].Name,
                    Description = businesses[1].Description,
                    Address = businesses[1].Address,
                    PhoneNumber = businesses[1].PhoneNumber
                }
            };

            _businessRepository.GetAllAsync().Returns(businesses);
            _mapper.Map<List<BusinessDto>>(businesses).Returns(businessDtos);

            var query = new GetAllBusinessesQuery();
            var response = await _handler.Handle(query, CancellationToken.None);

            // Assert
            Assert.Equal(businessDtos.Count, response.Count);
           
            await _businessRepository.Received(1).GetAllAsync();
        }

        [Fact]
        public async Task Handle_ShouldReturnEmptyList_WhenNoBusinessesExist()
        {
            // Arrange
            var businesses = new List<Business>();
            var businessDtos = new List<BusinessDto>();

            _businessRepository.GetAllAsync().Returns(businesses);
            _mapper.Map<List<BusinessDto>>(businesses).Returns(businessDtos);

            var query = new GetAllBusinessesQuery();
            var response = await _handler.Handle(query, CancellationToken.None);

            // Assert
            Assert.Empty(response);
            await _businessRepository.Received(1).GetAllAsync();
        }
    }
}




