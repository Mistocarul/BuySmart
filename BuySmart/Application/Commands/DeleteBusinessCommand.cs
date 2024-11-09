using Domain.Common;
using MediatR;

namespace Application.Commands
{
    public class DeleteBusinessCommand : IRequest<Result<object>>
    {
        public Guid BusinessID { get; set; }
    }
}
