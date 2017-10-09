using System;
using System.Collections.Generic;

namespace EZtouch.CarRentalHub.Models
{
    public partial class User
    {
        public User()
        {
            RentalEmployee = new HashSet<Rental>();
            RentalUser = new HashSet<Rental>();
        }

        public Guid UserId { get; set; }
        public string Name { get; set; }
        public DateTime Dob { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public string Phone { get; set; }
        public Guid RoleId { get; set; }
        public Guid NationalityId { get; set; }

        public UserRole Role { get; set; }
        public ICollection<Rental> RentalEmployee { get; set; }
        public ICollection<Rental> RentalUser { get; set; }
    }
}
