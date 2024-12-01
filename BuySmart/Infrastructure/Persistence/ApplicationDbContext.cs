using Domain.Entities;
using Microsoft.EntityFrameworkCore;

namespace Infrastructure.Persistence
{
    public class ApplicationDbContext : DbContext
    {
        private const string UuidGenerateV4 = "uuid_generate_v4()";
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options) : base(options)
        {
        }

        public DbSet<Product> Products { get; set; }
        public DbSet<Category> Categories { get; set; }
        public DbSet<Cart> Carts { get; set; }
        public DbSet<User> Users { get; set; }
        public DbSet<OrderItem> OrderItems { get; set; }
        public DbSet<Review> Reviews { get; set; }
        public DbSet<Business> Businesses { get; set; }
        public DbSet<Order> Orders { get; set; }
        public DbSet<Recommendation> Recommendations { get; set; }
        public DbSet<History> Histories { get; set; }
        public DbSet<UserBusiness> UserBusinesses { get; set; }
        public DbSet<UserClient> UserClients { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasPostgresExtension("uuid-ossp");

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
                    .HasColumnType("uuid")
                    .HasDefaultValueSql(UuidGenerateV4)
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
                entity.HasOne(ub => ub.Business)
                    .WithOne(b => b.UserBusiness)
                    .HasForeignKey<Business>(b => b.UserBusinessId)
                    .IsRequired()
                    .OnDelete(DeleteBehavior.Cascade);
            });

            modelBuilder.Entity<Business>(entity =>
            {
                entity.ToTable("Businesses");

                entity.HasKey(b => b.BusinessID);

                entity.Property(b => b.Name)
                    .IsRequired()
                    .HasMaxLength(100);

                entity.Property(b => b.Description)
                    .HasMaxLength(500);

                entity.Property(b => b.Address)
                    .HasMaxLength(200);

                entity.Property(b => b.PhoneNumber)
                    .HasMaxLength(15);

                entity.HasMany(b => b.Products)
                    .WithOne(p => p.Business)
                    .HasForeignKey(p => p.BusinessId)
                    .IsRequired()
                    .OnDelete(DeleteBehavior.Cascade);


                entity.HasMany(b => b.Reviews)
                    .WithOne(r => r.Business)
                    .HasForeignKey(r => r.BusinessId)
                    .OnDelete(DeleteBehavior.Cascade);


                entity.HasMany(b => b.Orders)
                    .WithOne(o => o.Business)
                    .HasForeignKey(o => o.BusinessId)
                    .IsRequired()
                    .OnDelete(DeleteBehavior.Cascade);
            });

            modelBuilder.Entity<UserClient>(entity =>
            {
                entity.ToTable("UserClients");
                entity.HasBaseType<User>();
                entity.Property(e => e.UserId)
                    .HasColumnType("uuid")
                    .HasDefaultValueSql(UuidGenerateV4)
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

                entity.HasMany(uc => uc.Orders)
                    .WithOne(o => o.UserClient)
                    .HasForeignKey(o => o.UserClientId)
                    .IsRequired()
                    .OnDelete(DeleteBehavior.Cascade);

                entity.HasMany(uc => uc.Reviews)
                    .WithOne(r => r.UserClient)
                    .HasForeignKey(r => r.UserClientId)
                    .IsRequired()
                    .OnDelete(DeleteBehavior.Cascade);

                entity.HasMany(uc => uc.Histories)
                    .WithOne(h => h.UserClient)
                    .HasForeignKey(h => h.UserClientId)
                    .IsRequired()
                    .OnDelete(DeleteBehavior.Cascade);

                entity.HasMany(uc => uc.Recommendations)
                    .WithOne(r => r.UserClient)
                    .HasForeignKey(r => r.UserClientId)
                    .IsRequired()
                    .OnDelete(DeleteBehavior.Cascade);

                entity.HasOne(uc => uc.Cart)
                    .WithOne(c => c.UserClient)
                    .HasForeignKey<Cart>(c => c.UserClientId)
                    .IsRequired()
                    .OnDelete(DeleteBehavior.Cascade);
            });

            modelBuilder.Entity<Product>(entity =>
            {
                entity.ToTable("Products");
                entity.HasKey(e => e.ProductId);
                entity.Property(e => e.ProductId)
                    .HasColumnType("uuid")
                    .HasDefaultValueSql(UuidGenerateV4)
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
                entity.Property(e => e.Stock)
                    .IsRequired();
                entity.Property(e => e.Rating)
                    .IsRequired();
                entity.Property(e => e.Image)
                    .HasMaxLength(200)
                    .IsRequired();


                entity.HasMany(e => e.Categories)
                    .WithMany(p => p.Products)
                    .UsingEntity(j => j.ToTable("ProductCategories"));

                entity.HasMany(e => e.OrderItems)
                    .WithOne(i => i.Product)
                    .HasForeignKey(i => i.ProductId)
                    .IsRequired()
                    .OnDelete(DeleteBehavior.Cascade);

                entity.HasMany(e => e.Reviews)
                    .WithOne(r => r.Product)
                    .HasForeignKey(r => r.ProductId)
                    .OnDelete(DeleteBehavior.Cascade);

                entity.HasMany(e => e.Histories)
                    .WithOne(h => h.Product)
                    .HasForeignKey(h => h.ProductId)
                    .IsRequired()
                    .OnDelete(DeleteBehavior.Cascade);

                entity.HasMany(e => e.Recommendations)
                    .WithOne(r => r.Product)
                    .HasForeignKey(r => r.ProductId)
                    .IsRequired()
                    .OnDelete(DeleteBehavior.Cascade);
            });

            modelBuilder.Entity<Category>(entity =>
            {
                entity.ToTable("Categories");
                entity.HasKey(e => e.CategoryId);
                entity.Property(e => e.CategoryId)
                    .HasColumnType("uuid")
                    .HasDefaultValueSql(UuidGenerateV4)
                    .ValueGeneratedOnAdd();
                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(200);
                entity.Property(e => e.Description)
                    .IsRequired()
                    .HasMaxLength(1000);
            });

            modelBuilder.Entity<Order>(entity =>
            {
                entity.ToTable("Orders");

                entity.HasKey(e => e.OrderId);

                entity.Property(e => e.OrderId)
                    .HasColumnType("uuid")
                    .HasDefaultValueSql(UuidGenerateV4)
                    .ValueGeneratedOnAdd();

                entity.Property(e => e.OrderStatus)
                    .IsRequired();

                entity.Property(e => e.TotalPrice)
                    .IsRequired()
                    .HasColumnType("decimal(18,2)");

                entity.Property(e => e.OrderDate)
                    .IsRequired();

                entity.Property(e => e.DeliveryPhoneNumber)
                    .IsRequired()
                    .HasMaxLength(15);

                entity.Property(e => e.PaymentMethod)
                    .IsRequired();

                entity.Property(e => e.DeliveryAddress)
                    .IsRequired()
                    .HasMaxLength(200);

                entity.HasMany(e => e.OrderItems)
                    .WithOne(oi => oi.Order)
                    .HasForeignKey(oi => oi.OrderId)
                    .IsRequired()
                    .OnDelete(DeleteBehavior.Cascade);
            });

            modelBuilder.Entity<Cart>(entity =>
            {
                entity.ToTable("Carts");
                entity.HasKey(e => e.CartId);
                entity.Property(e => e.CartId)
                    .HasColumnType("uuid")
                    .HasDefaultValueSql(UuidGenerateV4)
                    .ValueGeneratedOnAdd();
                
                entity.HasMany(e => e.OrderItems)
                    .WithOne(e => e.Cart)
                    .HasForeignKey(e => e.CartId)
                    .IsRequired()
                    .OnDelete(DeleteBehavior.Cascade);
            });

            modelBuilder.Entity<History>(entity =>
            {
                entity.ToTable("Histories");
                entity.HasKey(e => e.HistoryId);
                entity.Property(e => e.HistoryId)
                    .HasColumnType("uuid")
                    .HasDefaultValueSql(UuidGenerateV4)
                    .ValueGeneratedOnAdd();
                entity.Property(e => e.AccesDate)
                    .IsRequired();
            });

            modelBuilder.Entity<OrderItem>(entity =>
            {
                entity.ToTable("OrderItems");
                entity.HasKey(e => e.OrderItemId);
                entity.Property(e => e.OrderItemId)
                    .HasColumnType("uuid")
                    .HasDefaultValueSql(UuidGenerateV4)
                    .ValueGeneratedOnAdd();
                entity.Property(e => e.Quantity)
                    .IsRequired();
                entity.Property(e => e.Price)
                    .IsRequired()
                    .HasColumnType("decimal(18,2)");
            });

            modelBuilder.Entity<Recommendation>(entity =>
            {
                entity.ToTable("Recommendations");
                entity.HasKey(e => e.RecommendationId);
                entity.Property(e => e.RecommendationId)
                    .HasColumnType("uuid")
                    .HasDefaultValueSql(UuidGenerateV4)
                    .ValueGeneratedOnAdd();
                entity.Property(e => e.RecommendationDate)
                    .IsRequired();
                entity.Property(e => e.RelevanceScore)
                    .IsRequired();
            });

            modelBuilder.Entity<Review>(entity =>
            {
                entity.ToTable("Reviews");
                entity.HasKey(e => e.ReviewId);
                entity.Property(e => e.ReviewId)
                    .HasColumnType("uuid")
                    .HasDefaultValueSql(UuidGenerateV4)
                    .ValueGeneratedOnAdd();
                entity.Property(e => e.ReviewDate)
                    .IsRequired();
                entity.Property(e => e.Comment)
                    .IsRequired()
                    .HasMaxLength(1000);
                entity.Property(e => e.Rating)
                    .IsRequired();
            });
        }
    }
}
