using Application.Commands.CategoryCommands;
using Domain.Common;
using Domain.Repositories;
using MediatR;

namespace Application.CommandHandlers.CategoryCommandHandlers
{
    public class DeleteCategoryCommandHandler : IRequestHandler<DeleteCategoryCommand, Result<Guid>>
    {
        private readonly ICategoryRepository categoryRepository;

        public DeleteCategoryCommandHandler(ICategoryRepository categoryRepository)
        {
            this.categoryRepository = categoryRepository;
        }

        public async Task<Result<Guid>> Handle(DeleteCategoryCommand request, CancellationToken cancellationToken)
        {
            var category = await categoryRepository.GetByIdAsync(request.CategoryId);
            if (category == null)
            {
                return Result<Guid>.Failure("Category not found");
            }
            await categoryRepository.DeleteAsync(request.CategoryId);
            return Result<Guid>.Success(request.CategoryId);
        }
    }
}
