using Domain.Common;
using MediatR;

namespace Application.Commands.CategoryCommands
{
    public class UpdateCategoryCommand : IRequest<Result<object>>
    {
        public Guid CategoryId { get; set; }
        public string Name { get; set; } = string.Empty;
        public string Description { get; set; } = string.Empty;

    }
}
