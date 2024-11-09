using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Commands
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
