using Domain.Entities;
using FluentValidation;

namespace Application.Commands.UserBusinessCommands
{
    public class CreateUserBuisnessCommandValidator : AbstractValidator<CreateUserBusinessCommand>
    {
        public CreateUserBuisnessCommandValidator()
        {
            RuleFor(ub => ub.Name)
                .NotEmpty()
                .MaximumLength(200)
                .MinimumLength(2)
                .WithMessage("Name must be between 2 and 200 characters");

            RuleFor(ub => ub.Email)
                .NotEmpty()
                .EmailAddress()
                .MaximumLength(200)
                .WithMessage("Must be a valid email");

            RuleFor(ub => ub.Password)
                .NotEmpty()
                .MinimumLength(6)
                .MaximumLength(100)
                .WithMessage("Password must be between 6 and 100 characters");

            RuleFor(ub => ub.UserType)
                .Equal(UserType.Business)
                .WithMessage("UserType must be Business.");

            RuleFor(ub => ub.Image)
                .MaximumLength(500)
                .WithMessage("Image must be smaller than 500");
        }

    }
}
