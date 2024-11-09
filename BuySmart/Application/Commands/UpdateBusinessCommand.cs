using Domain.Common;
using MediatR;

namespace Application.Commands
{
    public class UpdateBusinessCommand : IRequest<Result<object>>
    {
        public Guid BusinessID { get; set; }
        public string Name { get; set; } = string.Empty;
        public string Description { get; set; } = string.Empty;
        public string Address { get; set; } = string.Empty;
        public string PhoneNumber { get; set; } = string.Empty;
    }
}
