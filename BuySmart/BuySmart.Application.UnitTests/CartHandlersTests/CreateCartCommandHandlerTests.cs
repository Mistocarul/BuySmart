using Application.CommandHandlers.CartCommandHandlers;
using Application.Commands.CartCommands;
using AutoMapper;
using Domain.Common;
using Domain.Entities;
using Domain.Repositories;
using NSubstitute;

namespace BuySmart.Application.UnitTests.CartCommandHandlers
{
    public class CreateCartCommandHandlerTests
    {
        private readonly ICartRepository cartRepository;
        private readonly IMapper mapper;
        private readonly CreateCartCommandHandler handler;

        public CreateCartCommandHandlerTests()
        {
            cartRepository = Substitute.For<ICartRepository>();
            mapper = Substitute.For<IMapper>();
            handler = new CreateCartCommandHandler(cartRepository, mapper);
        }

        [Fact]
        public async Task Handle_ShouldReturnSuccessResult_WhenCartIsCreatedSuccessfully()
        {
            
            var command = new CreateCartCommand { UserClientId = Guid.NewGuid() };
            var cart = new Cart { CartId = Guid.NewGuid(), UserClientId = command.UserClientId };
            var creationResult = Result<Guid>.Success(cart.CartId);

            mapper.Map<Cart>(command).Returns(cart);
            cartRepository.AddAsync(cart).Returns(creationResult);

            
            var result = await handler.Handle(command, CancellationToken.None);

            
            Assert.True(result.IsSuccess);
            Assert.Equal(cart.CartId, result.Data);
            await cartRepository.Received(1).AddAsync(cart);
        }

        [Fact]
        public async Task Handle_ShouldReturnFailureResult_WhenCartCreationFails()
        {
            
            var command = new CreateCartCommand { UserClientId = Guid.NewGuid() };
            var cart = new Cart { CartId = Guid.NewGuid(), UserClientId = command.UserClientId };
            var creationResult = Result<Guid>.Failure("Cart creation failed");

            mapper.Map<Cart>(command).Returns(cart);
            cartRepository.AddAsync(cart).Returns(creationResult);

            
            var result = await handler.Handle(command, CancellationToken.None);

            
            Assert.False(result.IsSuccess);
            Assert.Equal("Cart creation failed", result.ErrorMessage);
            await cartRepository.Received(1).AddAsync(cart);
        }
    }
}





