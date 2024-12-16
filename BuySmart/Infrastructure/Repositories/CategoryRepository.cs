using Infrastructure.Persistence;
using Domain.Repositories;
using Microsoft.EntityFrameworkCore;
using Domain.Entities;
using Domain.Common;

namespace Infrastructure.Repositories
{
    public class CategoryRepository : ICategoryRepository
    {
        private readonly ApplicationDbContext context;
        public CategoryRepository(ApplicationDbContext context)
        {
            this.context = context;
        }
        public async Task<IEnumerable<Category>> GetAllAsync()
        {
           return await context.Categories.ToListAsync();
        }
        public async Task<Category> GetByIdAsync(Guid categoryId)
        {
            var category = await context.Categories.FindAsync(categoryId);
            if (category == null)
            {
                throw new KeyNotFoundException("Category not found");
            }
            return category;
        }
<<<<<<< Updated upstream
=======

        public async Task<IEnumerable<Category>> GetByNamesAsync(List<string> names)
        {
            return await context.Categories
                .Where(c => names.Contains(c.Name))
                .ToListAsync();
        }

>>>>>>> Stashed changes
        public async Task<Result<Guid>> AddAsync(Category category)
        {
            try
            {
                await context.Categories.AddAsync(category);
                await context.SaveChangesAsync();
                return Result<Guid>.Success(category.CategoryId);
            }
            catch (Exception ex)
            {
                return Result<Guid>.Failure(ex.Message);
            }
        }
        public async Task<Result<object>> UpdateAsync(Category category)
        {
          try
            {
                var existingCategory = await context.Categories.FindAsync(category.CategoryId);
                if (existingCategory == null)
                {
                    return Result<object>.Failure("Category not found");
                }
                existingCategory.Name = category.Name;
                existingCategory.Description = category.Description;

                context.Categories.Update(existingCategory);
                await context.SaveChangesAsync();
                return Result<object>.Success(new object());
            }
            catch (Exception ex)
            {
                return Result<object>.Failure(ex.Message);
            }
        }
        public async Task DeleteAsync(Guid categoryId)
        {
            var category = await context.Categories.FindAsync(categoryId);
            if (category == null)
            {
                throw new KeyNotFoundException("Category not found");
            }
            context.Categories.Remove(category);
            await context.SaveChangesAsync();
        }

    }
}
