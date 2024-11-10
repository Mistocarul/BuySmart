using FluentValidation;

namespace Application.Commands.ReviewBusinessCommands
{
    public class CreateReviewBusinessCommandValidator : AbstractValidator<CreateReviewBusinessCommand>
    {
        public CreateReviewBusinessCommandValidator()
        {
            RuleFor(x => x.Rating)
                .NotEmpty().WithMessage("Rating is required")
                .InclusiveBetween(1, 5).WithMessage("Rating must be between 1 and 5");

            RuleFor(x => x.Comment)
                .NotEmpty().WithMessage("Comment is required")
                .MaximumLength(500).WithMessage("Comment must not exceed 500 characters");

            RuleFor(x => x.UserClientId)
                .NotEmpty().WithMessage("UserClientId is required");

            RuleFor(x => x.BusinessId)
                .NotEmpty().WithMessage("BusinessId is required");
        }
    }
}
