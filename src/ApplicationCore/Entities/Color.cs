using System;
using System.Collections.Generic;

namespace EZtouch.CarRentalHub.ApplicationCore.Entities
{
    public partial class Color
    {
        public Color()
        {
            Car = new HashSet<Car>();
        }

        public short ColorId { get; set; }
        public string Name { get; set; }
        public string Code { get; set; }

        public ICollection<Car> Car { get; set; }
    }
}
