using Application.Commands;
using AutoMapper;
using Domain.Common;
using Domain.Repositories;
using MediatR;

namespace Application.CommandHandlers
{
    public class CreateCartCommandHandler : IRequestHandler<CreateCartCommand, Result<Guid>>
    {
        private readonly ICartRepository repository;
        private readonly IMapper mapper;

        public CreateCartCommandHandler(ICartRepository repository, IMapper mapper)
        {
            this.repository = repository;
            this.mapper = mapper;
        }

        public async Task<Result<Guid>> Handle(CreateCartCommand request, CancellationToken cancellationToken)
        {
            var Cart = mapper.Map<Domain.Entities.Cart>(request);
            var result = await repository.AddAsync(Cart);
            if (result.IsSuccess)
            {
                return Result<Guid>.Success(result.Data);
            }
            return Result<Guid>.Failure(result.ErrorMessage);
        }
    }
}
