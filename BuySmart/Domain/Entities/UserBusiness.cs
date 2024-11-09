namespace Domain.Entities
{
    public class UserBusiness : User
    {
        //User Business: Business (1:1)
        public Business? Business { get; set; }
     
    }
}
