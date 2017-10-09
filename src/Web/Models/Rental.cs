using System;
using System.Collections.Generic;

namespace EZtouch.CarRentalHub.Models
{
    public partial class Rental
    {
        public Guid RentalId { get; set; }
        public Guid UserId { get; set; }
        public Guid CarId { get; set; }
        public Guid EmployeeId { get; set; }
        public DateTime RentDate { get; set; }
        public DateTime ExpectedReturnDate { get; set; }
        public DateTime? ReturnDate { get; set; }

        public Car Car { get; set; }
        public User Employee { get; set; }
        public User User { get; set; }
    }
}
