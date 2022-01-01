using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using RMallAPIs.Models;
using RMallAPIs.Models.Authentication;
using RMallAPIs.Models.Inventory;

namespace RMallAPIs.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class ProductInventoryController : Controller
    {
        private readonly RMallDbContext _dbContext;
        public ProductInventoryController(RMallDbContext context)
        {
            _dbContext = context;
        }

        [Authorize(Roles = UserRoles.Admin)]
        [HttpPost(Name = nameof(Add))]
        public async Task<IActionResult> Add(ProductInventory product)
        {
            _dbContext.ProductInventories.Add(product);
            _dbContext.SaveChanges();

            return CreatedAtAction(nameof(GetById), new { id = product.Id }, product);
        }

        [Authorize(Roles = UserRoles.Admin)]
        [HttpPut("{productId}", Name = nameof(Update))]
        public async Task<IActionResult> Update(long productId, ProductInventory product)
        {
            var productInventory = await _dbContext.ProductInventories.Include(x => x.Product).FirstOrDefaultAsync(x => x.Product.Id == productId);

            if (productInventory == null) return Problem("Unable to identify Product inventory with productId = " + productId);

            productInventory.Quantity = product.Quantity;

            _dbContext.SaveChanges();

            return NoContent();
        }

        [Authorize(Roles = UserRoles.Admin)]
        [HttpDelete("{id}", Name = nameof(Delete))]
        public async Task<IActionResult> Delete(long id)
        {
            throw new NotImplementedException();
        }

        [Authorize(Roles = UserRoles.Admin)]
        [HttpGet("{id}", Name = nameof(GetById))]
        public async Task<ActionResult<ProductInventory>> GetById(long id)
        {
            return Ok(await _dbContext.ProductInventories.Include(x => x.Product).FirstOrDefaultAsync(x => x.Id == id));
        }

        [Authorize(Roles = UserRoles.Admin)]
        [HttpGet(Name = nameof(Get))]
        public async Task<ActionResult<IEnumerable<ProductInventory>>> Get()
        {
            return Ok(await _dbContext.ProductInventories.Include(x => x.Product).ToListAsync());
        }

        [AllowAnonymous]
        [HttpGet("Search/{title}", Name = nameof(Search))]
        public async Task<ActionResult<IEnumerable<ProductInventory>>> Search(string title)
        {
            return Ok(
                await _dbContext.ProductInventories.Where(x => x.Product.Name.Contains(title) && x.Quantity > 0).Include(x => x.Product)
                .Select(x => new
                {
                    Id = x.Product.Id,
                    Title = x.Product.Name,
                    Description = x.Product.Description,
                    Price = x.Product.Price
                })
                .ToListAsync());
        }
    }
}