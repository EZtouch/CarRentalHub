using System;
using System.Collections.Generic;

namespace EZtouch.CarRentalHub.Models
{
    public partial class Class
    {
        public Class()
        {
            Car = new HashSet<Car>();
        }

        public Guid ClassId { get; set; }
        public Guid Name { get; set; }
        public string Description { get; set; }

        public ICollection<Car> Car { get; set; }
    }
}
