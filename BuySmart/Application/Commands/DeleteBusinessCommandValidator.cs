using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

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
