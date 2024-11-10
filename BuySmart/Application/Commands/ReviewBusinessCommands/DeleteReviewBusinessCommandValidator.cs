using FluentValidation;

namespace Application.Commands.ReviewBusinessCommands
{
    public class DeleteReviewBusinessCommandValidator : AbstractValidator<DeleteReviewBusinessCommand>
    {
        public DeleteReviewBusinessCommandValidator()
        {
            RuleFor(x => x.ReviewId)
                .NotEmpty().WithMessage("ReviewId is required");
        }
    }
}
