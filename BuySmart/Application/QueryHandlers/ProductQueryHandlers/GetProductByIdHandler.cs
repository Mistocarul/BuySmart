using Application.DTOs;
using Application.Queries.ProductQueries;
using AutoMapper;
using Domain.Repositories;
using MediatR;

namespace Application.QueryHandlers.ProductQueryHandlers
{
    public class GetProductByIdHandler : IRequestHandler<GetProductByIdQuery, ProductDto>
    {
        private readonly IMapper mapper;
        private readonly IProductRepository repository;


        public GetProductByIdHandler(IMapper mapper, IProductRepository repository)
        {
            this.mapper = mapper;
            this.repository = repository;
        }
        public async Task<ProductDto> Handle(GetProductByIdQuery request, CancellationToken cancellationToken)
        {
            var product = await repository.GetByIdAsync(request.ProductId);
            return mapper.Map<ProductDto>(product);
        }
    }
}
