using System;
using System.Collections.Generic;

namespace EZtouch.CarRentalHub.Models
{
    public partial class UserRole
    {
        public UserRole()
        {
            User = new HashSet<User>();
        }

        public Guid RoleId { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }

        public ICollection<User> User { get; set; }
    }
}
