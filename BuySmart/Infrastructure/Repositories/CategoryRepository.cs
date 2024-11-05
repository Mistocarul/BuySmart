using Infrastructure.Persistence;
using Domain.Repositories;
using Microsoft.EntityFrameworkCore;
using Domain.Entities;

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
                throw new Exception("Category not found");
            }
            return category;
        }
        public async Task<Guid> AddAsync(Category category)
        {
            await context.Categories.AddAsync(category);
            await context.SaveChangesAsync();
            return category.CategoryId;
        }
        public async Task UpdateAsync(Category category)
        {
            var existingCategory = await context.Categories.FindAsync(category.CategoryId);
            if (existingCategory == null)
            {
                throw new Exception("Category not found");
            }
            context.Entry(existingCategory).CurrentValues.SetValues(category);
            await context.SaveChangesAsync();
        }
        public async Task DeleteAsync(Guid categoryId)
        {
            var category = await context.Categories.FindAsync(categoryId);
            if (category == null)
            {
                throw new Exception("Category not found");
            }
            context.Categories.Remove(category);
            await context.SaveChangesAsync();
        }

    }
}
