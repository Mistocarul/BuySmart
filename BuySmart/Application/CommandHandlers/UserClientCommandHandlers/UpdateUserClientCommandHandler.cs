using Application.Commands.UserClientCommands;
using AutoMapper;
using Domain.Common;
using Domain.Entities;
using Domain.Repositories;
using MediatR;

namespace Application.CommandHandlers.UserClientCommandHandlers
{
    public class UpdateUserClientCommandHandler : IRequestHandler<UpdateUserClientCommand, Result<object>>
    {
        private readonly IUserClientRepository userClientRepository;
        private readonly IMapper mapper;

        public UpdateUserClientCommandHandler(IUserClientRepository userClientRepository, IMapper mapper)
        {
            this.userClientRepository = userClientRepository;
            this.mapper = mapper;
        }

        public async Task<Result<object>> Handle(UpdateUserClientCommand request, CancellationToken cancellationToken)
        {
            var user = await userClientRepository.GetByIdAsync(request.UserId);
            if (user == null)
            {
                return Result<object>.Failure("User not found");
            }

            user = mapper.Map<UserClient>(request);

            var result = await userClientRepository.UpdateAsync(user);
            if (result.IsSuccess)
            {
                return Result<object>.Success(result.Data);
            }

            return Result<object>.Failure(result.ErrorMessage);
        }
    }
}
