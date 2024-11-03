using Application.CommandHandlers;
using Application.Commands;
using AutoMapper;
using Domain.Common;
using Domain.Entities;
using Domain.Repositories;
using NSubstitute;

namespace Application.Tests.CommandHandlers
{
    public class CreateUserCommandHandlerTests
    {
        private readonly IUserRepository userRepository;
        private readonly IMapper mapper;
        private readonly CreateUserCommandHandler handler;

        public CreateUserCommandHandlerTests()
        {
            userRepository = Substitute.For<IUserRepository>();
            mapper = Substitute.For<IMapper>();
            handler = new CreateUserCommandHandler(userRepository, mapper);
        }

        [Fact]
        public async Task Handle_ShouldReturnSuccessResult_WhenUserIsCreatedSuccessfully()
        {
            // Arrange
            var command = new CreateUserCommand
            {
                Name = "Test User",
                Email = "test@example.com",
                Password = "password",
                Role = "User",
                Image = "image.png"
            };

            var user = new User
            {
                UserId = Guid.NewGuid(),
                Name = command.Name,
                Email = command.Email,
                Password = command.Password,
                Role = command.Role,
                Image = command.Image,
                CreatedAt = DateTime.UtcNow
            };

            mapper.Map<User>(command).Returns(user);
            userRepository.AddAsync(Arg.Any<User>()).Returns(Result<Guid>.Success(user.UserId));

            // Act
            var result = await handler.Handle(command, CancellationToken.None);

            // Assert
            Assert.True(result.IsSuccess);
            Assert.Equal(user.UserId, result.Data);
        }

        [Fact]
        public async Task Handle_ShouldReturnFailureResult_WhenUserCreationFails()
        {
            // Arrange
            var command = new CreateUserCommand
            {
                Name = "Test User",
                Email = "test@example.com",
                Password = "password",
                Role = "User",
                Image = "image.png"
            };

            var user = new User
            {
                UserId = Guid.NewGuid(),
                Name = command.Name,
                Email = command.Email,
                Password = command.Password,
                Role = command.Role,
                Image = command.Image,
                CreatedAt = DateTime.UtcNow
            };

            mapper.Map<User>(command).Returns(user);
            userRepository.AddAsync(Arg.Any<User>()).Returns(Result<Guid>.Failure("Error creating user"));

            // Act
            var result = await handler.Handle(command, CancellationToken.None);

            // Assert
            Assert.False(result.IsSuccess);
            Assert.Equal("Error creating user", result.ErrorMessage);
        }
    }
}