using FluentValidation;

namespace Application.Commands.ProductCommands
{
    internal class DeleteProductCommandValidator : AbstractValidator<DeleteProductCommand>
    {
        public DeleteProductCommandValidator()
        {
            RuleFor(x => x.ProductId)
                .NotEmpty().WithMessage("ProductId is required");
        }
    }
}
