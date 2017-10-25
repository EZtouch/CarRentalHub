using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using EZtouch.CarRentalHub.ViewModels;

namespace EZtouch.CarRentalHub.Controllers
{
    public class HomeController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }

        public IActionResult About()
        {
            ViewData["Message"] = "Your application description page.";

            return View();
        }

        public IActionResult Contact()
        {
            ViewData["Message"] = "Your contact page.";

            return View();
        }

        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }

        [Route("CarCalculations/{x:range(1,12)?}/{y:range(1,12)?}")]
        [Route("Home/Calc/{x?}/{y?}")]
        public IActionResult Calc(int x = 1, int y = 2)
        {
            return Content($"{x * y}");
        }
    }
}
