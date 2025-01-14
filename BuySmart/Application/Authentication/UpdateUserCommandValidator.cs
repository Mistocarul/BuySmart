using FluentValidation;
namespace Application.Authentication
{
    public class UpdateUserCommandValidator : AbstractValidator<UpdateUserCommand>
    {
        public UpdateUserCommandValidator()
        {
            RuleFor(uc => uc.UserId)
                   .NotEmpty()
                   .WithMessage("UserId is required.");
            RuleFor(uc => uc.Name)
                .NotEmpty()
                .MaximumLength(200)
                .WithMessage("Name must be between 1 and 200 characters");
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
            RuleFor(uc => uc.Image)
                .Must(BeValidBase64)
                .WithMessage("Image must be a valid base64 string")
                .MaximumLength(500000 * 4 / 3) // Adjusted for base64 encoding
                .WithMessage("Image must be smaller than 500 characters in base64 format");
        }
        private static bool BeValidBase64(string base64String)
        {
            Span<byte> buffer = new Span<byte>(new byte[base64String.Length]);
            return Convert.TryFromBase64String(base64String, buffer, out _);
        }
    }
}