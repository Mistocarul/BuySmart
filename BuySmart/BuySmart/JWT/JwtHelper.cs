using System.IdentityModel.Tokens.Jwt;

namespace BuySmart.JWT
{
    public class JwtHelper
    {
        public static string GetUserIdFromJwt(HttpContext httpContext)
        {
            var authorizationHeader = httpContext.Request.Headers["Authorization"].FirstOrDefault();
            if (authorizationHeader == null || !authorizationHeader.StartsWith("Bearer "))
            {
                return null;
            }

            var token = authorizationHeader.Substring("Bearer ".Length).Trim();
            var jwtToken = new JwtSecurityTokenHandler().ReadToken(token) as JwtSecurityToken;

            if (jwtToken == null)
            {
                return null;
            }

            var userIdClaim = jwtToken.Claims.FirstOrDefault(claim => claim.Type == "unique_name");
            return userIdClaim?.Value;
        }
    }
}
