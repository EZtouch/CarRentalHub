using System;
using System.Collections.Generic;

namespace Web.Models
{
    public partial class Class
    {
        public Class()
        {
            Model = new HashSet<Model>();
        }

        public byte ClassId { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }

        public ICollection<Model> Model { get; set; }
    }
}
