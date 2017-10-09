using System;
using System.Collections.Generic;

namespace EZtouch.CarRentalHub.Models
{
    public partial class Model
    {
        public Model()
        {
            Car = new HashSet<Car>();
        }

        public Guid ModelId { get; set; }
        public Guid MakeId { get; set; }
        public Guid ModelTypeId { get; set; }
        public string Name { get; set; }
        public Guid TransmissionId { get; set; }

        public Make Make { get; set; }
        public Transmission Transmission { get; set; }
        public ICollection<Car> Car { get; set; }
    }
}
