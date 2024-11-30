using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Commands.ProductCommands
{
    internal class CreateProductCommandValidator : AbstractValidator<CreateProductCommand>
    {
        public CreateProductCommandValidator()
        {

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
