using System;
using System.Collections.Generic;

namespace EZtouch.CarRentalHub.ApplicationCore.Entities
{
    public partial class Model
    {
        public Model()
        {
            Car = new HashSet<Car>();
        }

        public short ModelId { get; set; }
        public short MakeId { get; set; }
        public byte ClassId { get; set; }
        public string Name { get; set; }
        public byte TransmissionId { get; set; }

        public Class Class { get; set; }
        public Make Make { get; set; }
        public Transmission Transmission { get; set; }
        public ICollection<Car> Car { get; set; }
    }
}
