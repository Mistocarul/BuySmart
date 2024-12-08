using Domain.Entities;
using Microsoft.EntityFrameworkCore;

public class UsersDbContext : DbContext
{
    public UsersDbContext(DbContextOptions<UsersDbContext> options) : base(options)
    {
    }

    public DbSet<User> Users { get; set; }
    public DbSet<UserClient> UserClients { get; set; }
    public DbSet<UserBusiness> UserBusinesses { get; set; }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<User>()
            .HasKey(u => u.UserId);

        modelBuilder.Entity<User>()
            .HasIndex(u => u.Email)
            .IsUnique();

        modelBuilder.Entity<UserBusiness>(entity =>
        {
            entity.ToTable("UserBusinesses");
            entity.HasBaseType<User>();
            entity.Property(e => e.UserId)
                .HasColumnType("TEXT")
                .ValueGeneratedOnAdd();
            entity.Property(e => e.Email)
                .IsRequired()
                .HasMaxLength(200);
            entity.Property(e => e.Password)
                .IsRequired()
                .HasMaxLength(200);
            entity.Property(e => e.Name)
                .IsRequired(false)
                .HasMaxLength(200);
            entity.Property(e => e.Image)
                .IsRequired(false)
                .HasMaxLength(200);
            entity.Property(e => e.UserType)
                .HasDefaultValue(UserType.Business);
        });

        modelBuilder.Entity<UserClient>(entity =>
        {
            entity.ToTable("UserClients");
            entity.HasBaseType<User>();
            entity.Property(e => e.UserId)
                .HasColumnType("TEXT")
                .ValueGeneratedOnAdd();
            entity.Property(e => e.Email)
                .IsRequired()
                .HasMaxLength(200);
            entity.Property(e => e.Password)
                .IsRequired()
                .HasMaxLength(200);
            entity.Property(e => e.Name)
                .IsRequired(false)
                .HasMaxLength(200);
            entity.Property(e => e.Image)
                .IsRequired(false)
                .HasMaxLength(200);
            entity.Property(e => e.UserType)
                .HasDefaultValue(UserType.Client);
        });
    }
}
