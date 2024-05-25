using System;
using System.ComponentModel.DataAnnotations;

namespace StudentAttendanceManagementSystem.Models
{

    public class Students
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
        public string StudentId { get; set; } = string.Empty;
        [Required]
        public bool Archived { get; set; } = false;
    }
}
   