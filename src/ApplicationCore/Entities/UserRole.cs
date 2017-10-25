using System;
using System.Collections.Generic;

namespace EZtouch.CarRentalHub.ApplicationCore.Entities
{
    public partial class UserRole
    {
        public UserRole()
        {
            User = new HashSet<User>();
        }

        public byte RoleId { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }

        public ICollection<User> User { get; set; }
    }
}
