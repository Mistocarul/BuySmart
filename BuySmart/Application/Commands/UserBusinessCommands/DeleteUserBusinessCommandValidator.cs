using FluentValidation;

namespace Application.Commands.UserBusinessCommands
{
    public class DeleteUserBusinessCommandValidator : AbstractValidator<DeleteUserBusinessCommand>
    {
        public DeleteUserBusinessCommandValidator()
        {
            RuleFor(ub => ub.UserId)
                .NotEmpty()
                .WithMessage("UserId must not be empty");
        }
    }
}
