using Application.Commands.CategoryCommands;
using AutoMapper;
using Domain.Common;
using Domain.Repositories;
using MediatR;

namespace Application.CommandHandlers.CategoryCommandHandlers
{
    public class UpdateCategoryCommandHandler : IRequestHandler<UpdateCategoryCommand, Result<object>>
    {
        private readonly ICategoryRepository categoryRepository;
        private readonly IMapper mapper;

        public UpdateCategoryCommandHandler(ICategoryRepository categoryRepository, IMapper mapper)
        {
            this.categoryRepository = categoryRepository;
            this.mapper = mapper;
        }

        public async Task<Result<object>> Handle(UpdateCategoryCommand request, CancellationToken cancellationToken)
        {
            var category = mapper.Map<Domain.Entities.Category>(request);
            Console.WriteLine("category id din mapare:", category.CategoryId);
            var result = await categoryRepository.UpdateAsync(category);
            if (result.IsSuccess)
            {
                return Result<object>.Success(result.Data);
            }
            return Result<object>.Failure(result.ErrorMessage);
        }
    }
}
