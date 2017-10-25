using System;
using System.Collections.Generic;

namespace EZtouch.CarRentalHub.ApplicationCore.Entities
{
    public partial class Car
    {
        public Car()
        {
            Rental = new HashSet<Rental>();
        }

        public int CarId { get; set; }
        public byte AvailabilityId { get; set; }
        public short ModelId { get; set; }
        public short ColorId { get; set; }
        public double? Mileage { get; set; }
        public string RegPlateNo { get; set; }
        public DateTime YearManufactured { get; set; }
        public string ImgPath { get; set; }

        public Availability Availability { get; set; }
        public Color Color { get; set; }
        public Model Model { get; set; }
        public ICollection<Rental> Rental { get; set; }
    }
}
