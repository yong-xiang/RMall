using Microsoft.EntityFrameworkCore;
using RMallAPIs.Models.Account;
using RMallAPIs.Models.Inventory;
using RMallAPIs.Models.Purchase;

namespace RMallAPIs.Models
{
    public class RMallDbContext : DbContext
    {
        public RMallDbContext(DbContextOptions<RMallDbContext> options)
           : base(options)
        {
        }
       
        public DbSet<Product> Products { get; set; }
        public DbSet<ProductInventory> ProductInventories { get; set; }
        public DbSet<User> Users { get; set; }
        public DbSet<CartItem> CartItems { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Product>(entity =>
            {
                entity.ToTable("Product");
            });

            modelBuilder.Entity<ProductInventory>(entity =>
            {
                entity.ToTable("ProductInventory");
            });

            modelBuilder.Entity<User>(entity =>
            {
                entity.ToTable("AspNetUsers");
            });

            modelBuilder.Entity<CartItem>(entity =>
            {
                entity.ToTable("CartItem");
            });
        }
    }
}
