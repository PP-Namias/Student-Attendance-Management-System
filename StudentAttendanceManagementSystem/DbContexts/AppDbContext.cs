using StudentAttendanceManagementSystem.Models;
using Microsoft.EntityFrameworkCore;
using System;

namespace StudentAttendanceManagementSystem.DbContexts
{
    public class AppDbContext : DbContext
    {
        public DbSet<User> Users { get; set; }

        public DbSet<LoginUser> LoginLogs { get; set; }

        public DbSet<Students> Students { get; set; }


        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            string connectionString = "Host=localhost; port=5432; Database=SAMS; User Id=postgres; Password=Namias99;";
            optionsBuilder.UseNpgsql(connectionString);
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
                // Handle any exceptions or logging here
                Console.WriteLine($"Error saving user: {ex.Message}");
                throw; // Rethrow the exception to propagate it further if needed
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
                // Handle any exceptions or logging here
                Console.WriteLine($"Error saving login log: {ex.Message}");
                throw; // Rethrow the exception to propagate it further if needed
            }
        }

        internal void SaveLoginLog()
        {
            throw new NotImplementedException();
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
                // Handle any exceptions or logging here
                Console.WriteLine($"Error saving student: {ex.Message}");
                throw; // Rethrow the exception to propagate it further if needed
            }
        }
    }
}
