using StudentAttendanceManagementSystem.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Linq;

namespace StudentAttendanceManagementSystem.DbContexts
{
    public class AppDbContext : DbContext
    {
        public DbSet<User> Users { get; set; }
        public DbSet<LoginUser> LoginLogs { get; set; }
        public DbSet<Students> Students { get; set; }
        public DbSet<Students_Attendance> Attendance { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            string connectionString = "Host=localhost; port=5432; Database=SAMS; User Id=postgres; Password=Namias99;";
            optionsBuilder.UseNpgsql(connectionString);
        }
        
        public IQueryable<LoginUser> GetNonArchivedLoginLogs()
        {
            return LoginLogs.Where(log => !log.Archived);
        }
        
        public void SaveUser(User user)
        {
            try
            {
                Users.Add(user);
                SaveChanges();
            }
            catch (DbUpdateException ex)
            {
                Console.WriteLine($"Error saving user: {ex.Message}");
                throw;
            }
        }

        public void SaveLoginLog(LoginUser loginLog)
        {
            try
            {
                LoginLogs.Add(loginLog);
                SaveChanges();
            }
            catch (DbUpdateException ex)
            {
                Console.WriteLine($"Error saving login log: {ex.Message}");
                throw;
            }
        }

        public void SaveStudent(Students student)
        {
            try
            {
                Students.Add(student);
                SaveChanges();
            }
            catch (DbUpdateException ex)
            {
                Console.WriteLine($"Error saving student: {ex.Message}");
                throw;
            }
        }

        public void SaveStudentAttendance(Students_Attendance studentAttendance)
        {
            try
            {
                Attendance.Add(studentAttendance);
                SaveChanges();
            }
            catch (DbUpdateException ex)
            {
                Console.WriteLine($"Error saving student attendance: {ex.Message}");
                throw;
            }
        }
        /*
        public IQueryable<LoginLog> GetNonArchivedLoginLogs()
        {
            return LoginLogs.Where(log => !log.Archived);
        }
        */
    }
}
