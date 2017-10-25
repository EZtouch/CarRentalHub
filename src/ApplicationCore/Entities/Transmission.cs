using System;
using System.Collections.Generic;

namespace EZtouch.CarRentalHub.ApplicationCore.Entities
{
    public partial class Transmission
    {
        public Transmission()
        {
            Model = new HashSet<Model>();
        }

        public byte TransmissionId { get; set; }
        public string Type { get; set; }
        public string Description { get; set; }

        public ICollection<Model> Model { get; set; }
    }
}
