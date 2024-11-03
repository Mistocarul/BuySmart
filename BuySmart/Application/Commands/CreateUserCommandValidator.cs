using FluentValidation;

namespace Application.Commands
{
    public class CreateUserCommandValidator : AbstractValidator<CreateUserCommand>
    {
        public CreateUserCommandValidator()
        {
            RuleFor(x => x.Name).NotEmpty().MaximumLength(200).WithMessage("Name is required");
            RuleFor(x => x.Email)
                .NotEmpty().WithMessage("Email is required")
                .MaximumLength(200).WithMessage("Email must be less than 200 characters")
                .EmailAddress().WithMessage("Email must be a valid email address");
            RuleFor(x => x.Password).NotEmpty().MaximumLength(200).WithMessage("Password is required");
            RuleFor(x => x.Role).NotEmpty().MaximumLength(50).WithMessage("Role is required");
        }
    }
}
