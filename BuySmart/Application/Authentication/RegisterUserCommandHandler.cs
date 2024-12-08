using Domain.Entities;
using Domain.Repositories;
using MediatR;

public class RegisterUserCommandHandler : IRequestHandler<RegisterUserCommand, Guid>
{
    private readonly IUserAuthRepository<User> repository;

    public RegisterUserCommandHandler(IUserAuthRepository<User> repository)
    {
        this.repository = repository;
    }

    public async Task<Guid> Handle(RegisterUserCommand request, CancellationToken cancellationToken)
    {
        var user = new User
        {
            Email = request.Email,
            Password = BCrypt.Net.BCrypt.HashPassword(request.Password)
        };

        await repository.Register(user, cancellationToken);
        return user.UserId;
    }
}
