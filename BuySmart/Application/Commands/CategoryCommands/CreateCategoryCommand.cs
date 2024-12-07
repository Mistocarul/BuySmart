using Domain.Common;
using MediatR;

namespace Application.Commands.CategoryCommands
{
    public class CreateCategoryCommand : IRequest<Result<Guid>>
    {
        public string Name { get; set; } = string.Empty;
        public string Description { get; set; } = string.Empty;
    }
}
