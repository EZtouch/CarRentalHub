using System.Threading.Tasks;

namespace EZtouch.CarRentalHub.Services
{
    public interface IEmailSender
    {
        Task SendEmailAsync(string email, string subject, string message);
    }
}
