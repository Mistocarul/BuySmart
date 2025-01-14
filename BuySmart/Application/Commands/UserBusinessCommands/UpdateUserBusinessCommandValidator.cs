using Domain.Entities;
using FluentValidation;
using System;
using System.Linq.Expressions;

namespace Application.Commands.UserBusinessCommands
{
    public class UpdateUserBusinessCommandValidator : AbstractValidator<UpdateUserBusinessCommand>
    {
        public UpdateUserBusinessCommandValidator()
        {
            ApplyStringRules(ub => ub.Name, "Name", 2, 200);
            ApplyEmailRules(ub => ub.Email, "Email", 200);
            ApplyStringRules(ub => ub.Password, "Password", 6, 100);

            RuleFor(ub => ub.UserType)
                .Equal(UserType.Business)
                .WithMessage("UserType must be Business.");

            ApplyMaxLengthRule(ub => ub.Image, "Image", 500);
        }


        private void ApplyStringRules(Expression<Func<UpdateUserBusinessCommand, string>> propertyExpression, string propertyName, int minLength, int maxLength)
        {
            RuleFor(propertyExpression)
                .NotEmpty().WithMessage($"{propertyName} is required")
                .MinimumLength(minLength).WithMessage($"{propertyName} must be at least {minLength} characters long")
                .MaximumLength(maxLength).WithMessage($"{propertyName} must not exceed {maxLength} characters");
        }

        private void ApplyEmailRules(Expression<Func<UpdateUserBusinessCommand, string>> propertyExpression, string propertyName, int maxLength)
        {
            RuleFor(propertyExpression)
                .NotEmpty().WithMessage($"{propertyName} is required")
                .EmailAddress().WithMessage($"{propertyName} must be a valid email address")
                .MaximumLength(maxLength).WithMessage($"{propertyName} must not exceed {maxLength} characters");
        }

        private void ApplyMaxLengthRule(Expression<Func<UpdateUserBusinessCommand, string>> propertyExpression, string propertyName, int maxLength)
        {
            RuleFor(propertyExpression)
                .MaximumLength(maxLength).WithMessage($"{propertyName} must not exceed {maxLength} characters");
        }
    }
}
