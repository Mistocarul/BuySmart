using Application.Commands.ProductCommands;
using AutoMapper;
using Domain.Common;
using Domain.Repositories;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.CommandHandlers.ProductCommandHandlers
{
    public class DeleteProductCommandHandler : IRequestHandler<DeleteProductCommand, Result<object>>
    {
        private readonly IProductRepository repository;
        
        public DeleteProductCommandHandler(IProductRepository repository)
        {
            this.repository = repository;
        }
        public async Task<Result<object>> Handle(DeleteProductCommand request, CancellationToken cancellationToken)
        {
            var product = await repository.GetByIdAsync(request.ProductId);

            if (product == null)
            {
                return Result<object>.Failure("Product not found");
            }
            await repository.DeleteAsync(request.ProductId);
            return Result<object>.Success(new object());
        }
    }
}
