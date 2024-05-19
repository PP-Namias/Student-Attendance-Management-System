using System;
using System.ComponentModel.DataAnnotations;

namespace StudentAttendanceManagementSystem.Models
{
    public class LoginUser
    {
        [Required]
        public int Id { get; set; }
        [Required]
        public int UserId { get; set; }
        [Required]
        public string Username { get; set; } = string.Empty;
        [Required]
        public DateTime LogInTime { get; set; }
        [Required]
        public DateTime LogOutTime { get; set; }
        [Required]
        public DateTime Date { get; set; }
        [Required]
        public string Role { get; set; } = string.Empty;
        [Required]
        public string Remark { get; set; } = string.Empty;

    }
}


