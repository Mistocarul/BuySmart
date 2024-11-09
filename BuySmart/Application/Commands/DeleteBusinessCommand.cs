using Domain.Common;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Commands
{
    public class DeleteBusinessCommand : IRequest<Result<object>>
    {
        public Guid BusinessID { get; set; }
    }
}
