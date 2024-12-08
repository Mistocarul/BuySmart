using Application.DTOs;
using Domain.Entities;
using Domain.Repositories;
using MediatR;

public class LoginUserCommandHandler : IRequestHandler<LoginUserCommand, string>
{
    private readonly IUserAuthRepository<UserClient> userRepository;

    public LoginUserCommandHandler(IUserAuthRepository<UserClient> userRepository)
    {
        this.userRepository = userRepository;
    }

    public async Task<string> Handle(LoginUserCommand request, CancellationToken cancellationToken)
    {
        var user = new UserClient
        {
            Email = request.Email,
            Password = request.Password
        };
        var token = await userRepository.Login(user);
        return token;
    }
}
