using System;
using System.Collections.Generic;

namespace EZtouch.CarRentalHub.Models
{
    public partial class Make
    {
        public Make()
        {
            Model = new HashSet<Model>();
        }

        public short MakeId { get; set; }
        public string Name { get; set; }

        public ICollection<Model> Model { get; set; }
    }
}
