using System;
using System.ComponentModel.DataAnnotations;

namespace StudentAttendanceManagementSystem.Models
{

    public class User
    {
        [Required]
        public int Id { get; set; }
        [Required]
        public string UserName { get; set; } = string.Empty;
        [Required]
        public string PasswordHash { get; set; } = string.Empty;
        [Required]
        public string PhoneNumber { get; set; } = string.Empty;
        [Required]
        public string Role { get; set; } = string.Empty;
    }
}
   