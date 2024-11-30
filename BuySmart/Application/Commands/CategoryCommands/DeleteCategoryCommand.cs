using Domain.Common;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Commands.CategoryCommands
{
    public class DeleteCategoryCommand : IRequest<Result<Guid>>
    {
        public Guid Id { get; set; }
    }
}
