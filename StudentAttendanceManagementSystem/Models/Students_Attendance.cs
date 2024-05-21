using System;
using System.ComponentModel.DataAnnotations;

namespace StudentAttendanceManagementSystem.Models
{

    public class Students_Attendance
    {
        [Required]
        public int Id { get; set; }
        [Required]
        public string Name { get; set; } = string.Empty;
        [Required]
        public string Course { get; set; } = string.Empty;
        [Required]
        public string Year { get; set; } = string.Empty;
        [Required]
        public string Section { get; set; } = string.Empty;
        [Required]
        public string Status { get; set; } = string.Empty;
        [Required]
        public Boolean Archived { get; set; }
        [Required]
        public DateTime Date { get; set; }
        [Required]
        public DateTime Time { get; set; }
        [Required]
        public string StudentId { get; set; } = string.Empty;
    }
}
   