using Microsoft.AspNetCore.Identity;
using RMallAPIs.Models.Purchase;

namespace RMallAPIs.Models.Account
{
    public class User : IdentityUser
    { 
        public virtual ICollection<CartItem> CartItems { get; set; }
    }
}
