using FluentValidation;
using System;
using System.Linq.Expressions;

namespace Application.Commands.BusinessCommands
{
    public class UpdateBusinessCommandValidator : AbstractValidator<UpdateBusinessCommand>
    {
        public UpdateBusinessCommandValidator()
        {
            ApplyCommonRules(x => x.Name, "Name");
            ApplyCommonRules(x => x.Description, "Description");
            ApplyCommonRules(x => x.Address, "Address");
            ApplyCommonRules(x => x.PhoneNumber, "PhoneNumber");
        }

        private void ApplyCommonRules(Expression<Func<UpdateBusinessCommand, string>> propertyExpression, string propertyName)
        {
            RuleFor(propertyExpression)
                .NotEmpty().WithMessage($"{propertyName} is required")
                .MaximumLength(100).WithMessage($"{propertyName} must not exceed 100 characters");
        }
    }
}
