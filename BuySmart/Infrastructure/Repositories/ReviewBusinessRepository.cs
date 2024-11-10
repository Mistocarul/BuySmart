using Domain.Common;
using Domain.Entities;
using Domain.Repositories;
using Infrastructure.Persistence;
using Microsoft.EntityFrameworkCore;

namespace Infrastructure.Repositories
{
    public class ReviewBusinessRepository : IReviewBusinessRepository
    {
        private readonly ApplicationDbContext context;
        public ReviewBusinessRepository(ApplicationDbContext context)
        {
            this.context = context;
        }
        public async Task<Result<Guid>> AddAsync(Review review)
        {
            try
            {
                var userExists = await context.Users.AnyAsync(u => u.UserId == review.UserClientId);
                if (!userExists)
                {
                    return Result<Guid>.Failure("UserClientID does not exist.");
                }

                var businessExists = await context.Businesses.AnyAsync(b => b.BusinessID == review.BusinessId);
                if (!businessExists)
                {
                    return Result<Guid>.Failure("BusinessID does not exist.");
                }
                await context.Reviews.AddAsync(review);
                await context.SaveChangesAsync();
                return Result<Guid>.Success(review.ReviewId);
            }
            catch (Exception ex)
            {
                return Result<Guid>.Failure(ex.Message);
            }

        }
        public async Task<Result<object>> UpdateAsync(Review review)
        {
            try
            {
                var existingReview = await context.Reviews.FindAsync(review.ReviewId);
                if (existingReview == null)
                {
                    return Result<object>.Failure("Review not found");
                }

                var userExists = await context.Users.AnyAsync(u => u.UserId == review.UserClientId);
                if (!userExists)
                {
                    return Result<object>.Failure("UserClientID does not exist.");
                }

                var businessExists = await context.Businesses.AnyAsync(b => b.BusinessID == review.BusinessId);
                if (!businessExists)
                {
                    return Result<object>.Failure("BusinessID does not exist.");
                }

                // Update only the properties that are allowed to be changed
                existingReview.Rating = review.Rating;
                existingReview.Comment = review.Comment;
                existingReview.BusinessId = review.BusinessId;
                existingReview.UserClientId = review.UserClientId;

                await context.SaveChangesAsync();
                return Result<object>.Success(null);
            }
            catch (Exception ex)
            {
                return Result<object>.Failure(ex.Message);
            }
        }
        public async Task<IEnumerable<Review>> GetAllAsync()
        {
            return await context.Reviews.ToListAsync();
        }
        public async Task<Review> GetByIdAsync(Guid id)
        {
            var review = await context.Reviews.FindAsync(id);
            if (review == null)
            {
                throw new Exception("Review not found");
            }
            return review;
        }
        public async Task DeleteAsync(Guid id)
        {
            var review = await context.Reviews.FindAsync(id);
            if (review == null)
            {
                throw new Exception("Review not found");
            }
            context.Reviews.Remove(review);
            await context.SaveChangesAsync();
        }

    }
}
