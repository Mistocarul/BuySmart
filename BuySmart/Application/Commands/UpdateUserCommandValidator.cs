using FluentValidation;

namespace Application.Commands
{
    public class UpdateUserCommandValidator : AbstractValidator<UpdateUserCommand>
    {
        public UpdateUserCommandValidator()
        {
            RuleFor(x => x.UserId).NotEmpty().WithMessage("UserId is required");
            RuleFor(x => x.Name).NotEmpty().MaximumLength(200).WithMessage("Name is required");
            RuleFor(x => x.Password).NotEmpty().MaximumLength(200).WithMessage("Password is required");
            RuleFor(x => x.Image).MaximumLength(200).WithMessage("Image must be less than 200 characters");
        }
    }
}
