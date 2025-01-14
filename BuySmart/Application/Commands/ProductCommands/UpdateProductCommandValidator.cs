using FluentValidation;
using System;
using System.Linq.Expressions;

namespace Application.Commands.ProductCommands
{
    public class UpdateProductCommandValidator : AbstractValidator<UpdateProductCommand>
    {
        public UpdateProductCommandValidator()
        {
            ApplyNotEmptyRule(x => x.ProductId, "ProductId");

            ApplyStringRules(x => x.Name, "Name", 100);
            ApplyStringRules(x => x.Description, "Description", 200);

            ApplyNotEmptyRule(x => x.Price, "Price");
            ApplyNotEmptyRule(x => x.Stock, "Stock");
            ApplyNotEmptyRule(x => x.Rating, "Rating");
            ApplyNotEmptyRule(x => x.Image, "Image");
            ApplyNotEmptyRule(x => x.BusinessId, "BusinessId");
        }

        private void ApplyStringRules(Expression<Func<UpdateProductCommand, string>> propertyExpression, string propertyName, int maxLength)
        {
            RuleFor(propertyExpression)
                .NotEmpty().WithMessage($"{propertyName} is required")
                .MaximumLength(maxLength).WithMessage($"{propertyName} must not exceed {maxLength} characters");
        }

        private void ApplyNotEmptyRule<T>(Expression<Func<UpdateProductCommand, T>> propertyExpression, string propertyName)
        {
            RuleFor(propertyExpression)
                .NotEmpty().WithMessage($"{propertyName} is required");
        }
    }
}
