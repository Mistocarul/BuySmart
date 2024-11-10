using Application.DTOs;
using Application.Queries;
using Application.QueryHandlers;
using AutoMapper;
using Domain.Entities;
using Domain.Repositories;
using NSubstitute;

public class GetBusinessByIdQueryHandlerTests
{
    private readonly IBusinessRepository businessRepository;
    private readonly IMapper mapper;
    private readonly GetBusinessByIdQueryHandler handler;

    public GetBusinessByIdQueryHandlerTests()
    {
        businessRepository = Substitute.For<IBusinessRepository>();
        mapper = Substitute.For<IMapper>();
        handler = new GetBusinessByIdQueryHandler(businessRepository, mapper);
    }

    [Fact]
    public async Task Handle_ShouldReturnBusinessDto_WhenBusinessExists()
    {
        // Arrange
        var query = new GetBusinessByIdQuery { Id = Guid.NewGuid() };
        var business = new Business
        {
            BusinessID = query.Id,
            Name = "Test Business",
            Description = "Test Description",
            Address = "Test Address",
            PhoneNumber = "1234567890",
            UserBusinessId = Guid.NewGuid()
        };

        var businessDto = new BusinessDto
        {
            Name = "Test Business",
            Description = "Test Description",
            Address = "Test Address",
            PhoneNumber = "1234567890",
            UserBusinessId = business.UserBusinessId
        };

        businessRepository.GetByIdAsync(query.Id).Returns(business);
        mapper.Map<BusinessDto>(business).Returns(businessDto);

        // Act
        var result = await handler.Handle(query, CancellationToken.None);

        // Assert
        Assert.Equal(businessDto, result);
    }

    [Fact]
    public async Task Handle_ShouldReturnNull_WhenBusinessDoesNotExist()
    {
        // Arrange
        var query = new GetBusinessByIdQuery { Id = Guid.NewGuid() };
        businessRepository.GetByIdAsync(query.Id).Returns((Business)null);

        // Act
        var result = await handler.Handle(query, CancellationToken.None);

        // Assert
        Assert.Null(result);
    }
}
