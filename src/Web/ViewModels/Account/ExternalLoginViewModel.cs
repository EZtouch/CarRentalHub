using System.ComponentModel.DataAnnotations;

namespace EZtouch.CarRentalHub.ViewModels.Account
{
    public class ExternalLoginViewModel
    {
        [Required]
        [EmailAddress]
        public string Email { get; set; }
    }
}
