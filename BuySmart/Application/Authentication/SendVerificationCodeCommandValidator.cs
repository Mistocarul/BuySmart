using Application.Authentication;
using Domain.Entities;
using FluentValidation;

namespace Application.Commands.UserClientCommands
{
    public class SendVerificationCodeCommandValidator : AbstractValidator<SendVerificationCodeCommand>
    {
        public SendVerificationCodeCommandValidator()
        {
            RuleFor(uc => uc.Name)
                .NotEmpty()
                .MaximumLength(200)
                .MinimumLength(2)
                .WithMessage("Name must be between 2 and 200 characters");

            RuleFor(uc => uc.Email)
                .NotEmpty()
                .EmailAddress()
                .MaximumLength(200)
                .WithMessage("Must be a valid email");

            RuleFor(uc => uc.Password)
                .NotEmpty()
                .MinimumLength(6)
                .MaximumLength(100)
                .WithMessage("Password must be between 6 and 100 characters");

            RuleFor(uc => uc.UserType)
                .Must(userType => userType == UserType.Client || userType == UserType.Business)
                .WithMessage("UserType must be either Client or Business.");
        }
    }
}
