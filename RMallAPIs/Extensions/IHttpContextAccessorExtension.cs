using System.Security.Claims;

namespace RMallAPIs.Extensions
{
    public static class IHttpContextAccessorExtension
    {
        public static string? GetNameIdentifierClaim(this IHttpContextAccessor httpContextAccessor)
        {
            return httpContextAccessor.HttpContext?.User.FindFirst(ClaimTypes.NameIdentifier)?.Value;
        }
    }
}
