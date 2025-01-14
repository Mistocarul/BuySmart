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


            RuleFor(uc => uc.Image)
                .Must(BeValidBase64)
                .WithMessage("Image must be a valid base64 string")
                .MaximumLength(500 * 4 / 3) // Adjusted for base64 encoding
                .WithMessage("Image must be smaller than 500 characters in base64 format");
        }
        private static bool BeValidBase64(string base64String)
        {
            Span<byte> buffer = new Span<byte>(new byte[base64String.Length]);
            return Convert.TryFromBase64String(base64String, buffer, out _);
        }

    }
}
