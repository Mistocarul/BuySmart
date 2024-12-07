using FluentValidation;

namespace Application.Commands.CategoryCommands
{
    public class DeleteCategoryCommandValidator : AbstractValidator<DeleteCategoryCommand>
    {
        public DeleteCategoryCommandValidator()
        {
            RuleFor(x => x.CategoryId).NotEmpty();
        }
    }
}
