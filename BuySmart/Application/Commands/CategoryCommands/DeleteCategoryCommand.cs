using Domain.Common;
using MediatR;

namespace Application.Commands.CategoryCommands
{
    public class DeleteCategoryCommand : IRequest<Result<Guid>>
    {
        public Guid CategoryId { get; set; }
    }
}
