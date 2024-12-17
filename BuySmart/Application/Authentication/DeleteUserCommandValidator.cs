using FluentValidation;


namespace Application.Authentication
{
    public class DeleteUserCommandValidator : AbstractValidator<DeleteUserCommand>
    {
        public DeleteUserCommandValidator()
        {
            RuleFor(command => command.UserId)
                .NotEmpty()
                .WithMessage("UserId must not be empty.");
        }
    }
}