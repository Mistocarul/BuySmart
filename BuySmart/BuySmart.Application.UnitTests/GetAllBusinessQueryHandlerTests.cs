using Application.DTOs;
using Application.Queries;
using Application.QueryHandlers;
using AutoMapper;
using Domain.Entities;
using Domain.Repositories;
using NSubstitute;
using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;
using Xunit;

public class GetAllBusinessQueryHandlerTests
{
    private readonly IBusinessRepository businessRepository;
    private readonly IMapper mapper;
    private readonly GetAllBusinessQueryHandler handler;

    public GetAllBusinessQueryHandlerTests()
    {
        businessRepository = Substitute.For<IBusinessRepository>();
        mapper = Substitute.For<IMapper>();
        handler = new GetAllBusinessQueryHandler(businessRepository, mapper);
    }

    [Fact]
    public async Task Handle_ShouldReturnBusinessDtoList_WhenBusinessesExist()
    {
        // Arrange
        var query = new GetAllBusinessesQuery();
        var businesses = new List<Business>
        {
            new Business
            {
                BusinessID = Guid.NewGuid(),
                Name = "Test Business 1",
                Description = "Test Description 1",
                Address = "Test Address 1",
                PhoneNumber = "1234567890",
                UserBusinessId = Guid.NewGuid()
            },
            new Business
            {
                BusinessID = Guid.NewGuid(),
                Name = "Test Business 2",
                Description = "Test Description 2",
                Address = "Test Address 2",
                PhoneNumber = "0987654321",
                UserBusinessId = Guid.NewGuid()
            }
        };

        var businessDtos = new List<BusinessDto>
        {
            new BusinessDto
            {
                Name = "Test Business 1",
                Description = "Test Description 1",
                Address = "Test Address 1",
                PhoneNumber = "1234567890",
                UserBusinessId = businesses[0].UserBusinessId
            },
            new BusinessDto
            {
                Name = "Test Business 2",
                Description = "Test Description 2",
                Address = "Test Address 2",
                PhoneNumber = "0987654321",
                UserBusinessId = businesses[1].UserBusinessId
            }
        };

        businessRepository.GetAllAsync().Returns(businesses);
        mapper.Map<List<BusinessDto>>(businesses).Returns(businessDtos);

        // Act
        var result = await handler.Handle(query, CancellationToken.None);

        // Assert
        Assert.Equal(businessDtos, result);
    }

    [Fact]
    public async Task Handle_ShouldReturnEmptyList_WhenNoBusinessesExist()
    {
        // Arrange
        var query = new GetAllBusinessesQuery();
        var businesses = new List<Business>();
        var businessDtos = new List<BusinessDto>();

        businessRepository.GetAllAsync().Returns(businesses);
        mapper.Map<List<BusinessDto>>(businesses).Returns(businessDtos);

        // Act
        var result = await handler.Handle(query, CancellationToken.None);

        // Assert
        Assert.Empty(result);
    }
}
