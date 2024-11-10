using FluentValidation;

namespace Application.Commands.UserClientCommands
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
