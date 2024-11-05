using FluentValidation;

namespace Application.Commands
{
    public class DeleteUserClientCommandValidator : AbstractValidator<DeleteUserClientCommand>
    {
        public DeleteUserClientCommandValidator()
        {
            RuleFor(command => command.UserId)
                .NotEmpty()
                .WithMessage("UserClientId is required.");
        }
    }
}
