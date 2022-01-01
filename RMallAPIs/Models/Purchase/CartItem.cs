using RMallAPIs.Models.Account;
using RMallAPIs.Models.Inventory;

namespace RMallAPIs.Models.Purchase
{
    public class CartItem
    {
        public long Id { get; set; }

        public int OrderedQuantity { get; set; }

        public virtual Product Product { get; set; }

        public virtual User User { get; set; }
    }
}
