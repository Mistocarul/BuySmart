using Application.Commands.ProductCommands;
using AutoMapper;
using Domain.Common;
using Domain.Entities;
using Domain.Repositories;
using MediatR;

namespace Application.CommandHandlers.ProductCommandHandlers
{
    public class CreateProductCommandHandler : IRequestHandler<CreateProductCommand, Result<Guid>>
    {
        private readonly IMapper mapper;
        private readonly IProductRepository productRepository;
        private readonly ICategoryRepository categoryRepository;

        public CreateProductCommandHandler(IMapper mapper, IProductRepository productRepository, ICategoryRepository categoryRepository)
        {
            this.mapper = mapper;
            this.productRepository = productRepository;
            this.categoryRepository = categoryRepository;
        }
        public async Task<Result<Guid>> Handle(CreateProductCommand request, CancellationToken cancellationToken)
        {
           
            var existingCategories = await categoryRepository.GetByNamesAsync(request.CategoryNames);

            var categoriesToAssociate = new List<Category>();

            foreach (var categoryName in request.CategoryNames)
            {
                var existingCategory = existingCategories.FirstOrDefault(c => c.Name == categoryName);
                if (existingCategory != null)
                {
                    categoriesToAssociate.Add(existingCategory);
                }
                else
                {
                    return Result<Guid>.Failure($"Category '{categoryName}' does not exist.");
                }
            }

            var product = mapper.Map<Domain.Entities.Product>(request);
            product.Categories = categoriesToAssociate;

            var result = await productRepository.AddAsync(product);
            if (result.IsSuccess)
            {
                return Result<Guid>.Success(result.Data);
            }
            return Result<Guid>.Failure(result.ErrorMessage);
        }
    }
}
