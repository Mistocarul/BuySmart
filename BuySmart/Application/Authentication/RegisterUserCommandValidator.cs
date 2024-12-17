using Application.Authentication;
using FluentValidation;

namespace Application.Commands.UserClientCommands
{
    public class RegisterUserCommandValidator : AbstractValidator<RegisterUserCommand>
    {
        public RegisterUserCommandValidator()
        {
           RuleFor(uc => uc.confirmationCode)
                .NotEmpty()
                .MaximumLength(6)
                .MinimumLength(6)
                .WithMessage("Confirmation code must be 6 characters");
        }
    }
}
