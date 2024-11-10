using FluentValidation;

namespace Application.Commands.BusinessCommands
{
    public class DeleteBusinessCommandValidator : AbstractValidator<DeleteBusinessCommand>
    {

        public DeleteBusinessCommandValidator()
        {
            RuleFor(x => x.BusinessID)
                .NotEmpty().WithMessage("BusinessID is required");
        }
    }
}
