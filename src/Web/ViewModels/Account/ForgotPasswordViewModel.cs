using System.ComponentModel.DataAnnotations;

namespace EZtouch.CarRentalHub.ViewModels.Account
{
    public class ForgotPasswordViewModel
    {
        [Required]
        [EmailAddress]
        public string Email { get; set; }
    }
}
