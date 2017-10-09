using System;
using System.Collections.Generic;

namespace EZtouch.CarRentalHub.Models
{
    public partial class Availability
    {
        public Availability()
        {
            Car = new HashSet<Car>();
        }

        public Guid AvailabilityId { get; set; }
        public string Description { get; set; }

        public ICollection<Car> Car { get; set; }
    }
}
