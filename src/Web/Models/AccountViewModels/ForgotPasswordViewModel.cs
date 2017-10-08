using System.ComponentModel.DataAnnotations;

namespace EZtouch.CarRentalHub.Models.AccountViewModels
{
    public class ForgotPasswordViewModel
    {
        [Required]
        [EmailAddress]
        public string Email { get; set; }
    }
}
