using Domain.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace Infrastructure.Persistence.Configurations
{
    public static class UserConfiguration
    {
        
        private static void ConfigureBaseUser<TUser>(EntityTypeBuilder<TUser> entity) where TUser : User
        {
            entity.HasBaseType<User>();
            entity.Property(e => e.UserId)
                .HasColumnType("uuid")
                .HasDefaultValueSql("uuid_generate_v4()")
                .ValueGeneratedOnAdd();
            entity.Property(e => e.Name)
                .IsRequired()
                .HasMaxLength(200);
            entity.Property(e => e.Email)
                .IsRequired()
                .HasMaxLength(200);
            entity.Property(e => e.Password)
                .IsRequired()
                .HasMaxLength(200);
            entity.Property(e => e.UserType)
                .IsRequired();
            entity.Property(e => e.Image)
                .HasMaxLength(200);
        }

        
        public static void ConfigureUserClient(this ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<UserClient>(entity =>
            {
                ConfigureBaseUser(entity);  

                entity.ToTable("UserClients");

               
                entity.HasMany(uc => uc.Orders)
                    .WithOne(o => o.UserClient)
                    .HasForeignKey(o => o.UserClientId)
                    .OnDelete(DeleteBehavior.Cascade);
            });
        }

        
        public static void ConfigureUserBusiness(this ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<UserBusiness>(entity =>
            {
                ConfigureBaseUser(entity);  

                entity.ToTable("UserBusinesses");

                
                entity.HasOne(ub => ub.Business)
                    .WithOne(b => b.UserBusiness)
                    .HasForeignKey<Business>(b => b.UserBusinessId)
                    .OnDelete(DeleteBehavior.Cascade);
            });
        }
    }
}

