using System;
using System.Collections.Generic;

namespace Web.Models
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
