using Application.CommandHandlers.CartCommandHandlers;
using Application.Commands.CartCommands;
using AutoMapper;
using Domain.Common;
using Domain.Entities;
using Domain.Repositories;
using NSubstitute;

namespace Application.UnitTests.UserClientHandlersTests
{
    public class CreateCartCommandHandlerTests
    {
        private readonly ICartRepository _cartRepository;
        private readonly IMapper _mapper;
        private readonly CreateCartCommandHandler _handler;

        public CreateCartCommandHandlerTests()
        {
            _cartRepository = Substitute.For<ICartRepository>();
            _mapper = Substitute.For<IMapper>();
            _handler = new CreateCartCommandHandler(_cartRepository, _mapper);
        }

        [Fact]
        public async Task Given_ValidCreateCartCommand_When_HandleIsCalled_Then_ReturnsSuccessResult()
        {
            // Arrange
            var command = new CreateCartCommand
            {
                UserClientId = new Guid("e23c48a1-222b-4530-bd7f-67f5c7a702af")
            };

            var cart = new Cart();
            var result = Result<Guid>.Success(new Guid("e23c48a1-222b-4530-bd7f-67f5c7a702af"));

            _mapper.Map<Cart>(command).Returns(cart);
            _cartRepository.AddAsync(cart).Returns(result);

            // Act
            var response = await _handler.Handle(command, CancellationToken.None);

            // Assert
            Assert.True(response.IsSuccess);
            Assert.Equal(result.Data, response.Data);
            _mapper.Received(1).Map<Cart>(command);
            await _cartRepository.Received(1).AddAsync(cart);
        }

        [Fact]
        public async Task Given_InvalidCreateCartCommand_When_HandleIsCalled_Then_ReturnsFailureResult()
        {
            // Arrange
            var command = new CreateCartCommand
            {
                UserClientId = new Guid("e23c48a1-222b-4530-bd7f-67f5c7a702af")
            };

            var cart = new Cart();
            var result = Result<Guid>.Failure("Error creating cart");

            _mapper.Map<Cart>(command).Returns(cart);
            _cartRepository.AddAsync(cart).Returns(result);

            // Act
            var response = await _handler.Handle(command, CancellationToken.None);

            // Assert
            Assert.False(response.IsSuccess);
            Assert.Equal(result.ErrorMessage, response.ErrorMessage);
            _mapper.Received(1).Map<Cart>(command);
            await _cartRepository.Received(1).AddAsync(cart);
        }
    }
}

