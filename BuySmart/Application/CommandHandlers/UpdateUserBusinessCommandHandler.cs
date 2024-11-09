using Application.Commands;
using AutoMapper;
using Domain.Common;
using Domain.Entities;
using Domain.Repositories;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.CommandHandlers
{
    public class UpdateUserBusinessCommandHandler : IRequestHandler<UpdateUserBusinessCommand, Result<object>>
    {
        private readonly IUserBusinessRepository userBusinessRepository;
        private readonly IMapper mapper;

        public UpdateUserBusinessCommandHandler(IUserBusinessRepository userBusinessRepository, IMapper mapper)
        {
            this.userBusinessRepository = userBusinessRepository;
            this.mapper = mapper;
        }

        public async Task<Result<object>> Handle(UpdateUserBusinessCommand request, CancellationToken cancellationToken)
        {
            var user = await userBusinessRepository.GetByIdAsync(request.UserId);
            if (user == null)
            {
                return Result<object>.Failure("User not found");
            }

            user = mapper.Map<UserBusiness>(request);

            var result = await userBusinessRepository.UpdateAsync(user);
            if (result.IsSuccess)
            {
                return Result<object>.Success(result.Data);
            }

            return Result<object>.Failure(result.ErrorMessage);
        }
    }
}
