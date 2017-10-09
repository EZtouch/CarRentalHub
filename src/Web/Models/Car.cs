using System;
using System.Collections.Generic;

namespace EZtouch.CarRentalHub.Models
{
    public partial class Car
    {
        public Car()
        {
            Rental = new HashSet<Rental>();
        }

        public Guid CarId { get; set; }
        public Guid AvailabilityId { get; set; }
        public Guid ModelId { get; set; }
        public Guid ColorId { get; set; }
        public Guid ClassId { get; set; }
        public double? Mileage { get; set; }
        public string RegPlateNo { get; set; }
        public DateTime YearManufactured { get; set; }
        public string ImgPath { get; set; }

        public Availability Availability { get; set; }
        public Class Class { get; set; }
        public Color Color { get; set; }
        public Model Model { get; set; }
        public ICollection<Rental> Rental { get; set; }
    }
}
