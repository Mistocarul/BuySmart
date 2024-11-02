using Application.Commands;
using AutoMapper;
using Domain.Entities;
using Domain.Repositories;
using MediatR;

namespace Application.CommandHandlers
{
    public class UpdateUserCommandHandler : IRequestHandler<UpdateUserCommand>
    {
        private readonly IUserRepository userRepository;
        private readonly IMapper mapper;
        public UpdateUserCommandHandler(IUserRepository userRepository, IMapper mapper)
        {
            this.userRepository = userRepository;
            this.mapper = mapper;
        }
        public Task Handle(UpdateUserCommand request, CancellationToken cancellationToken)
        {
            var User = mapper.Map<User>(request);
            return userRepository.UpdateAsync(User);
        }
    }
}
