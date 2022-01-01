namespace RMallAPIs.Models.Inventory
{
    public class ProductInventory
    {
        public long Id { get; set; }

        public virtual Product Product { get; set; }

        public int Quantity { get; set; }
    }
}
