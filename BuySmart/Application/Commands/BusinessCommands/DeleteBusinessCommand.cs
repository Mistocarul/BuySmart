using Domain.Common;
using MediatR;

namespace Application.Commands.BusinessCommands
{
    public class DeleteBusinessCommand : IRequest<Result<object>>
    {
        public Guid BusinessID { get; set; }
    }
}
