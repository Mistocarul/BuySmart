using Domain.Entities;
using Domain.Repositories;
using Infrastructure.Persistence;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Infrastructure.Repositories
{
    public class UserRepository : IUserRepository
    {
        private readonly ApplicationDbContext context;
        public UserRepository(ApplicationDbContext context)
        {
            this.context = context;
        }
        public async Task<IEnumerable<User>> GetAllAsync()
        {
            return await context.Users.ToListAsync();
        }

        public async Task<User> GetByIdAsync(Guid id)
        {
            var user = await context.Users.FindAsync(id);
            if (user == null)
            {
                throw new Exception("User not found");
            }
            return user;
        }

        public async Task<Guid> AddAsync(User user)
        {
            await context.Users.AddAsync(user);
            await context.SaveChangesAsync();
            return user.UserId;
        }

        public async Task UpdateAsync(User user)
        {
            var existingUser = await context.Users.FindAsync(user.UserId);
            if (existingUser == null)
            {
                throw new Exception("User not found");
            }
            var newUser = new User
            {
                UserId = user.UserId,
                Name = user.Name,
                Email = existingUser.Email,
                Password = user.Password,
                Image = user.Image,
                CreatedAt = existingUser.CreatedAt,
                Role = existingUser.Role
                // vedeti sa puneti si UpdatedAt
            };
            context.Entry(existingUser).CurrentValues.SetValues(newUser);
            await context.SaveChangesAsync();
        }

        public async Task DeleteAsync(Guid id)
        {
            var user = await context.Users.FindAsync(id);
            if (user == null)
            {
                throw new Exception("User not found");
            }
            context.Users.Remove(user);
            await context.SaveChangesAsync();
        }
    }
}
