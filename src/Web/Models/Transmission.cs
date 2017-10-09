using System;
using System.Collections.Generic;

namespace EZtouch.CarRentalHub.Models
{
    public partial class Transmission
    {
        public Transmission()
        {
            Model = new HashSet<Model>();
        }

        public Guid TransmissionId { get; set; }
        public string Type { get; set; }
        public string Description { get; set; }

        public ICollection<Model> Model { get; set; }
    }
}
