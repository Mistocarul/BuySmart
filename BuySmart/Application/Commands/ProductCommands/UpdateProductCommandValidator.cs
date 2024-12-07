using FluentValidation;

namespace Application.Commands.ProductCommands
{
    public class UpdateProductCommandValidator : AbstractValidator<UpdateProductCommand>
    {
        public UpdateProductCommandValidator() 
        {
            RuleFor(x => x.ProductId)
                .NotEmpty().WithMessage("ProductId is required");

            RuleFor(x => x.Name)
                .NotEmpty().WithMessage("Name is required")
                .MaximumLength(100).WithMessage("Name must not exceed 100 characters");

            RuleFor(x => x.Description)
                .NotEmpty().WithMessage("Description is required")
                .MaximumLength(200).WithMessage("Description must not exceed 200 characters");

            RuleFor(x => x.Price)
                .NotEmpty().WithMessage("Price is required");

            RuleFor(x => x.Stock)
                .NotEmpty().WithMessage("Stock is required");

            RuleFor(x => x.Rating)
                .NotEmpty().WithMessage("Rating is required");

            RuleFor(x => x.Image)
                .NotEmpty().WithMessage("Image is required");

            RuleFor(x => x.BusinessId)
                .NotEmpty().WithMessage("BusinessId is required");
        }
    }
}
