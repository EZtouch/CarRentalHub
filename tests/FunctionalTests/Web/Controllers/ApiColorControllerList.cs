using Newtonsoft.Json;
using System.Threading.Tasks;
using EZtouch.CarRentalHub.ApplicationCore.Entities;
using Xunit;

namespace FunctionalTests.Web.Controllers
{
    public class ApiColorControllerList : BaseWebTest
    {
        [Fact]
        public async Task ReturnsFirstColor()
        {
            var response = await _client.GetAsync("/api/color/1");
            response.EnsureSuccessStatusCode();
            var stringResponse = await response.Content.ReadAsStringAsync();
            var model = JsonConvert.DeserializeObject<Color>(stringResponse);

            Assert.Equal(1, model.ColorId);
        }
    }
}
