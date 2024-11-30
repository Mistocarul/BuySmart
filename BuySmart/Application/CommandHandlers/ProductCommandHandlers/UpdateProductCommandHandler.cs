using Application.Commands.ProductCommands;
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

namespace Application.CommandHandlers.ProductCommandHandlers
{
    public class UpdateProductCommandHandler : IRequestHandler<UpdateProductCommand, Result<object>>
    {
        private readonly IMapper mapper;
        private readonly IProductRepository repository;
        public UpdateProductCommandHandler(IMapper mapper, IProductRepository repository)
        {
            this.mapper = mapper;
            this.repository = repository;
        }
        public async Task<Result<object>> Handle(UpdateProductCommand request, CancellationToken cancellationToken)
        {
            var product = await repository.GetByIdAsync(request.ProductId);
            if (product == null)
            {
                return Result<object>.Failure("Product not found");
            }
            product = mapper.Map<Product>(request);

            var result = await repository.UpdateAsync(product);
            if (result.IsSuccess)
            {
               return Result<object>.Success(result.Data);
            }
            return Result<object>.Failure(result.ErrorMessage);


        }
    }
}
