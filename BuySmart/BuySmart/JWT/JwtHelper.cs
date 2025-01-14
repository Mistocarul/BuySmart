using System.IdentityModel.Tokens.Jwt;

namespace BuySmart.JWT
{
    public static class JwtHelper
    {
        public static string? GetUserIdFromJwt(HttpContext httpContext)
        {
            var authorizationHeader = httpContext.Request.Headers.Authorization.FirstOrDefault();

            if (string.IsNullOrEmpty(authorizationHeader) || !authorizationHeader.StartsWith("Bearer ", StringComparison.OrdinalIgnoreCase))
            {
                return null;
            }

            var token = authorizationHeader.Substring("Bearer ".Length).Trim();
            var jwtTokenHandler = new JwtSecurityTokenHandler();

            if (!jwtTokenHandler.CanReadToken(token))
            {
                return null;
            }

            var jwtToken = jwtTokenHandler.ReadToken(token) as JwtSecurityToken;

            if (jwtToken == null)
            {
                return null;
            }

            var userIdClaim = jwtToken.Claims.FirstOrDefault(claim => claim.Type == "unique_name");
            return userIdClaim?.Value;
        }
    }
}
