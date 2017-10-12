using System;
using System.Collections.Generic;

namespace Web.Models
{
    public partial class Availability
    {
        public Availability()
        {
            Car = new HashSet<Car>();
        }

        public byte AvailabilityId { get; set; }
        public string Description { get; set; }

        public ICollection<Car> Car { get; set; }
    }
}
