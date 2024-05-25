using Microsoft.EntityFrameworkCore;
using StudentAttendanceManagementSystem.Models;
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

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);
            // Additional configuration and model customization can be added here
        }

        public IQueryable<LoginUser> GetNonArchivedLoginLogs()
        {
            return LoginLogs.Where(log => !log.Archived);
        }

        public IQueryable<Students> GetNonArchivedStudents()
        {
            return Students.Where(student => !student.Archived);
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

        public void ArchiveStudent(int studentId)
        {
            try
            {
                var student = Students.Find(studentId);
                if (student != null)
                {
                    student.Archived = true;
                    SaveChanges();
                }
            }
            catch (DbUpdateException ex)
            {
                Console.WriteLine($"Error archiving student: {ex.Message}");
                throw;
            }
        }

        public void ArchiveLoginLog(int loginLogId)
        {
            try
            {
                var loginLog = LoginLogs.Find(loginLogId);
                if (loginLog != null)
                {
                    loginLog.Archived = true;
                    SaveChanges();
                }
            }
            catch (DbUpdateException ex)
            {
                Console.WriteLine($"Error archiving login log: {ex.Message}");
                throw;
            }
        }
    }
}
