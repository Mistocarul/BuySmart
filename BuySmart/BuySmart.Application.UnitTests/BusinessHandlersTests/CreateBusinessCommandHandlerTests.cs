using Application.CommandHandlers.BusinessCommandHandlers;
using Application.Commands.BusinessCommands;
using AutoMapper;
using Domain.Common;
using Domain.Entities;
using Domain.Repositories;
using NSubstitute;

namespace Application.UnitTests.BusinessHandlersTests
{
    public class CreateBusinessCommandHandlerTests
    {
        private readonly IBusinessRepository businessRepository;
        private readonly IMapper mapper;
        private readonly CreateBusinessCommandHandler handler;

        public CreateBusinessCommandHandlerTests()
        {
            businessRepository = Substitute.For<IBusinessRepository>();
            mapper = Substitute.For<IMapper>();
            handler = new CreateBusinessCommandHandler(businessRepository, mapper);
        }

        [Fact]
        public async Task Handle_ShouldReturnSuccessResult_WhenBusinessIsCreated()
        {
            // Arrange
            var command = new CreateBusinessCommand
            {
                Name = "Test Business",
                Description = "Test Description",
                Address = "Test Address",
                PhoneNumber = "1234567890",
                UserBusinessId = Guid.NewGuid()
            };

            var business = new Business
            {
                BusinessID = Guid.NewGuid(),
                Name = command.Name,
                Description = command.Description,
                Address = command.Address,
                PhoneNumber = command.PhoneNumber,
                UserBusinessId = command.UserBusinessId
            };

            mapper.Map<Business>(command).Returns(business);
            businessRepository.AddAsync(business).Returns(Result<Guid>.Success(business.BusinessID));

            // Act
            var result = await handler.Handle(command, CancellationToken.None);

            // Assert
            Assert.True(result.IsSuccess);
            Assert.Equal(business.BusinessID, result.Data);
        }

        [Fact]
        public async Task Handle_ShouldReturnFailureResult_WhenBusinessCreationFails()
        {
            // Arrange
            var command = new CreateBusinessCommand
            {
                Name = "Test Business",
                Description = "Test Description",
                Address = "Test Address",
                PhoneNumber = "1234567890",
                UserBusinessId = Guid.NewGuid()
            };

            var business = new Business
            {
                BusinessID = Guid.NewGuid(),
                Name = command.Name,
                Description = command.Description,
                Address = command.Address,
                PhoneNumber = command.PhoneNumber,
                UserBusinessId = command.UserBusinessId
            };

            mapper.Map<Business>(command).Returns(business);
            businessRepository.AddAsync(business).Returns(Result<Guid>.Failure("Error creating business"));

            // Act
            var result = await handler.Handle(command, CancellationToken.None);

            // Assert
            Assert.False(result.IsSuccess);
            Assert.Equal("Error creating business", result.ErrorMessage);
        }
    }
}
