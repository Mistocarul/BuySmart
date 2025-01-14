using FluentValidation;
using System;
using System.Linq.Expressions;

namespace Application.Commands.ProductCommands
{
    public class CreateProductCommandValidator : AbstractValidator<CreateProductCommand>
    {
        public CreateProductCommandValidator()
        {
            ApplyStringRules(x => x.Name, "Name", 100);
            ApplyStringRules(x => x.Description, "Description", 200);

            ApplyNotEmptyRule(x => x.Price, "Price");
            ApplyNotEmptyRule(x => x.Stock, "Stock");
            ApplyNotEmptyRule(x => x.Rating, "Rating");
            ApplyNotEmptyRule(x => x.BusinessId, "BusinessId");
        }

        private void ApplyStringRules(Expression<Func<CreateProductCommand, string>> propertyExpression, string propertyName, int maxLength)
        {
            RuleFor(propertyExpression)
                .NotEmpty().WithMessage($"{propertyName} is required")
                .MaximumLength(maxLength).WithMessage($"{propertyName} must not exceed {maxLength} characters");
        }

        private void ApplyNotEmptyRule<T>(Expression<Func<CreateProductCommand, T>> propertyExpression, string propertyName)
        {
            RuleFor(propertyExpression)
                .NotEmpty().WithMessage($"{propertyName} is required");
        }

    }
}
