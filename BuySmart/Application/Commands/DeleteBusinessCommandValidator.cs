using FluentValidation;

namespace Application.Commands
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
