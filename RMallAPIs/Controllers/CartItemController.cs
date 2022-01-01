using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using RMallAPIs.Extensions;
using RMallAPIs.Models;
using RMallAPIs.Models.Purchase;

namespace RMallAPIs.Controllers
{
    [Authorize]
    [ApiController]
    [Route("api/[controller]")]
    public class CartItemController : Controller
    {
        private readonly RMallDbContext _dbContext;
        private readonly IHttpContextAccessor _httpContextAccessor;
        public CartItemController(RMallDbContext context, IHttpContextAccessor httpContextAccessor)
        {
            if(context == null)
            {
                throw new ArgumentNullException(nameof(context));
            }

            _dbContext = context;
            _httpContextAccessor = httpContextAccessor;
        }

        [HttpPost(Name = nameof(AddCartItem))]
        public async Task<IActionResult> AddCartItem(CartItemModel model)
        {
            var userId = _httpContextAccessor.GetNameIdentifierClaim();

            CartItem? existingCartItem = await _dbContext.CartItems.FirstOrDefaultAsync(x => x.User.Id == userId && x.Product.Id == model.ProductId);
            if (existingCartItem != null)
            {
                existingCartItem.OrderedQuantity += model.OrderedQuantity;
            }
            else
            {
                var user = await _dbContext.Users.FindAsync(userId);
                var product = await _dbContext.Products.FindAsync(model.ProductId);

                if(user == null ) return Problem("Unable to identify current user");
                if (product == null) return Problem("Unable to identify product with Id=" + model.ProductId);

                var cartItem = new CartItem()
                {
                    User = user,
                    Product = product,
                    OrderedQuantity = model.OrderedQuantity
                };

                _dbContext.CartItems.Add(cartItem);
            }

            _dbContext.SaveChanges();

            return NoContent();
        }

        [HttpPut("{id}", Name = nameof(UpdateCartItem))]
        public async Task<IActionResult> UpdateCartItem(long id, CartItemModel model)
        {
            CartItem? cartItem = await _dbContext.CartItems.FindAsync(id);

            if(cartItem != null)
            {
                cartItem.OrderedQuantity = model.OrderedQuantity;
            }

            _dbContext.SaveChanges();

            return NoContent();
        }

        [HttpDelete("{id}", Name = nameof(DeleteCartItem))]
        public async Task<IActionResult> DeleteCartItem(long id)
        {
            var orderItem = await _dbContext.CartItems.FindAsync(id);

            if(orderItem == null)
            {
                return NotFound(id);
            }

            _dbContext.CartItems.Remove(orderItem);
            _dbContext.SaveChanges();

            return NoContent();
        }

        [HttpGet("{id}", Name = nameof(GetCartItemById))]
        public async Task<ActionResult<CartItem>> GetCartItemById(long id)
        {
            var userId = _httpContextAccessor.GetNameIdentifierClaim();

            if (userId == null)
            {
                return Problem("Unable to identify current user");
            }

            return Ok(await _dbContext.CartItems.Include(x => x.Product).FirstOrDefaultAsync(x => x.Id == id));
        }

        [HttpGet("UserCart", Name = nameof(GetCurrentUserCartItems))]
        public async Task<ActionResult<IEnumerable<CartItem>>> GetCurrentUserCartItems()
        {
            var userId = _httpContextAccessor.GetNameIdentifierClaim();

            if(userId == null)
            {
                return Problem("Unable to identify current user");
            }

            return await GetCartItemsByUserId(userId);
        }

        [HttpGet("UserCart/{userId}", Name = nameof(GetCartItemsByUserId))]
        public async Task<ActionResult<IEnumerable<CartItem>>> GetCartItemsByUserId(string userId)
        {
            return Ok(await 
                _dbContext.CartItems.Include(x => x.Product)
                .Where(x => x.User.Id == userId)
                .Select(x => new { 
                    Id = x.Id,
                    ProductId = x.Product.Id,
                    ProductName = x.Product.Name,
                    ProductDescription = x.Product.Description,
                    ProductPrice = x.Product.Price,
                    OrderedQuantity = x.OrderedQuantity,
                    SubTotal = x.OrderedQuantity * x.Product.Price
                })
                .ToListAsync());
        }
    }
}