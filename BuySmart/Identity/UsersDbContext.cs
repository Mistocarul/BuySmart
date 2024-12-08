using Domain.Entities;
using Microsoft.EntityFrameworkCore;

public class UsersDbContext : DbContext
{
    public UsersDbContext(DbContextOptions<UsersDbContext> options) : base(options)
    {
    }

    public DbSet<User> Users { get; set; }
    public DbSet<ConfirmationCode> ConfirmationCodes { get; set; }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<User>(entity =>
        {
            entity.ToTable("Users");
            entity.HasKey(e => e.UserId);
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

        modelBuilder.Entity<User>()
            .HasIndex(u => u.Email)
            .IsUnique();

        modelBuilder.Entity<ConfirmationCode>(entity =>
        {
            entity.ToTable("ConfirmationCodes");
            entity.HasKey(e => e.CodeId);
            entity.Property(e => e.CodeId)
                .HasColumnType("TEXT")
                .ValueGeneratedOnAdd();
            entity.Property(e => e.Code)
                .IsRequired();
            entity.Property(e => e.CreationTime)
                .IsRequired()
                .HasDefaultValueSql("CURRENT_TIMESTAMP");
            entity.Property(e => e.Name)
                .IsRequired()
                .HasMaxLength(200);
            entity.Property(e => e.Email)
                .IsRequired()
                .HasMaxLength(200);
            entity.HasIndex(e => e.Email)
                .IsUnique();
            entity.Property(e => e.Password)
                .IsRequired()
                .HasMaxLength(200);
            entity.Property(e => e.UserType)
                .IsRequired();
            entity.Property(e => e.Image)
                .IsRequired(false);
        });
    }
}
