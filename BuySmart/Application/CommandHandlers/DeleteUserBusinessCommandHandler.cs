using Application.Commands;
using AutoMapper;
using Domain.Common;
using Domain.Repositories;
using MediatR;

namespace Application.CommandHandlers
{
    public class DeleteUserBusinessCommandHandler : IRequestHandler<DeleteUserBusinessCommand, Result<object>>
    {
        private readonly IUserBusinessRepository userBusinessRepository;
        private readonly IMapper mapper;
        public DeleteUserBusinessCommandHandler(IUserBusinessRepository userBusinessRepository, IMapper mapper)
        {
            this.userBusinessRepository = userBusinessRepository;
            this.mapper = mapper;
        }
        public async Task<Result<object>> Handle(DeleteUserBusinessCommand request, CancellationToken cancellationToken)
        {
            var user = await userBusinessRepository.GetByIdAsync(request.UserId);
            if (user == null)
            {
                return Result<object>.Failure("User not found");
            }
            await userBusinessRepository.DeleteAsync(request.UserId);
            return Result<object>.Success(null);
        }
    }
}
