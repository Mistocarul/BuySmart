using FluentValidation;

namespace Application.Commands
{
    public class UpdateBusinessCommandValidator : AbstractValidator<UpdateBusinessCommand>
    { 
        public UpdateBusinessCommandValidator() 
        {

            RuleFor(x => x.Name)
                .NotEmpty().WithMessage("Name is required")
                .MaximumLength(100).WithMessage("Name must not exceed 100 characters");

            RuleFor(x => x.Description)
                .NotEmpty().WithMessage("Description is required")
                .MaximumLength(100).WithMessage("Description must not exceed 100 characters");

            RuleFor(x => x.Address)
                .NotEmpty().WithMessage("Address is required")
                .MaximumLength(100).WithMessage("Address must not exceed 100 characters");

            RuleFor(x => x.PhoneNumber)
                .NotEmpty().WithMessage("PhoneNumber is required")
                .MaximumLength(100).WithMessage("PhoneNumber must not exceed 100 characters");

        }
    }
}
