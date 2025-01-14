using Domain.Entities;
using Microsoft.EntityFrameworkCore;

namespace Infrastructure.Persistence.Configurations
{
    public static class ProductConfiguration
    {
        public static void ConfigureProduct(this ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Product>(entity =>
            {
                entity.ToTable("Products");
                entity.HasKey(e => e.ProductId);
                entity.Property(e => e.ProductId)
                    .HasColumnType("uuid")
                    .HasDefaultValueSql("uuid_generate_v4()")
                    .ValueGeneratedOnAdd();
                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(200);
                entity.Property(e => e.Description)
                    .IsRequired()
                    .HasMaxLength(1000);
                entity.Property(e => e.Price)
                    .IsRequired()
                    .HasColumnType("decimal(18,2)");
                entity.Property(e => e.Stock).IsRequired();
                entity.Property(e => e.Rating).IsRequired();
                entity.Property(e => e.Image)
                    .IsRequired()
                    .HasMaxLength(200);

                entity.HasMany(e => e.Categories)
                    .WithMany(p => p.Products)
                    .UsingEntity(j => j.ToTable("ProductCategories"));
            });
        }
    }
}
