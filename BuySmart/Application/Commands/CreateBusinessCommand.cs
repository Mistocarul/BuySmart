using Domain.Common;
using MediatR;

namespace Application.Commands
{
    public class CreateBusinessCommand : IRequest<Result<Guid>>    
    {
      
        public string Name { get; set; } = string.Empty;
        public string Description { get; set; } = string.Empty;
        public string Address { get; set; } = string.Empty;
        public string PhoneNumber { get; set; } = string.Empty;
        public Guid UserBusinessId { get; set; }
    }
}
