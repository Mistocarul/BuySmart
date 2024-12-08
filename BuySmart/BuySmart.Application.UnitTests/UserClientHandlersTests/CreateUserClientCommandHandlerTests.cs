using Application.CommandHandlers.UserClientCommandHandlers;
using Application.Commands.UserClientCommands;
using AutoMapper;
using Domain.Common;
using Domain.Entities;
using Domain.Repositories;
using NSubstitute;

namespace Application.UnitTests.UserClientHandlersTests
{
    public class CreateUserClientCommandHandlerTests
    {
        private readonly IUserRepository<UserClient> _userClientRepository;
        private readonly IMapper _mapper;
        private readonly CreateUserClientCommandHandler _handler;

        public CreateUserClientCommandHandlerTests()
        {
            _userClientRepository = Substitute.For<IUserRepository<UserClient>>();
            _mapper = Substitute.For<IMapper>();
            _handler = new CreateUserClientCommandHandler(_userClientRepository, _mapper);
        }

        [Fact]
        public async Task Given_ValidCreateUserClientCommand_When_HandleIsCalled_Then_ReturnsSuccessResult()
        {
            // Arrange
            var command = new CreateUserClientCommand
            {
                Name = "Test User",
                Email = "test@example.com",
                Password = "password",
                UserType = UserType.Client,
                Image = "image.png"
            };

            var userClient = new UserClient();
            var result = Result<Guid>.Success(new Guid("e23c48a1-222b-4530-bd7f-67f5c7a702af"));

            _mapper.Map<UserClient>(command).Returns(userClient);
            _userClientRepository.AddAsync(userClient).Returns(result);

            // Act
            var response = await _handler.Handle(command, CancellationToken.None);

            // Assert
            Assert.True(response.IsSuccess);
            Assert.Equal(result.Data, response.Data);
            _mapper.Received(1).Map<UserClient>(command);
            await _userClientRepository.Received(1).AddAsync(userClient);
        }

        [Fact]
        public async Task Given_InvalidCreateUserClientCommand_When_HandleIsCalled_Then_ReturnsFailureResult()
        {
            // Arrange
            var command = new CreateUserClientCommand
            {
                Name = "Test User",
                Email = "test",
                Password = "password",
                UserType = UserType.Client,
                Image = "image.png"
            };

            var userClient = new UserClient();
            var result = Result<Guid>.Failure("Error creating user client");

            _mapper.Map<UserClient>(command).Returns(userClient);
            _userClientRepository.AddAsync(userClient).Returns(result);

            // Act
            var response = await _handler.Handle(command, CancellationToken.None);

            // Assert
            Assert.False(response.IsSuccess);
            Assert.Equal(result.ErrorMessage, response.ErrorMessage);
            _mapper.Received(1).Map<UserClient>(command);
            await _userClientRepository.Received(1).AddAsync(userClient);
        }
    }
}

