using System;
using System.Collections.Generic;

namespace EZtouch.CarRentalHub.ApplicationCore.Entities
{
    public partial class Rental
    {
        public int RentalId { get; set; }
        public int UserId { get; set; }
        public int CarId { get; set; }
        public int EmployeeId { get; set; }
        public DateTime RentDate { get; set; }
        public DateTime ExpectedReturnDate { get; set; }
        public DateTime? ReturnDate { get; set; }

        public Car Car { get; set; }
        public User Employee { get; set; }
        public User User { get; set; }
    }
}
