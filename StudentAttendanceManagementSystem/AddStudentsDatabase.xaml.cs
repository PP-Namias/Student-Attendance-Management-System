using StudentAttendanceManagementSystem.DbContexts;
using StudentAttendanceManagementSystem.Models;
using StudentAttendanceManagementSystem.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;

namespace StudentAttendanceManagementSystem
{
    /// <summary>
    /// Interaction logic for AddStudentsDatabase.xaml
    /// </summary>
    public partial class AddStudentsDatabase : Window
    {
        AppDbContext appDbContext = new AppDbContext();

        public AddStudentsDatabase()
        {
            InitializeComponent();
            appDbContext = new AppDbContext();
        }

        private void Border_MouseDown(object sender, MouseButtonEventArgs e)
        {

            if (e.LeftButton == MouseButtonState.Pressed)
            {
                DragMove();
                System.Diagnostics.Debug.Write("some action...");
            }
        }
        private void btnRegister_Click(object sender, RoutedEventArgs e)
        {
            // Collect student data from input fields
            string name = txtUsername.Text;
            string course = ((ComboBoxItem)cmbRo1le.SelectedItem)?.Content.ToString();
            string year = ((ComboBoxItem)cmbRoa1le.SelectedItem)?.Content.ToString();
            string section = ((ComboBoxItem)cmbRaoa1le.SelectedItem)?.Content.ToString();
            string studentId = txtConformPassword.Password; // Assuming the StudentId is entered in the PasswordBox
            bool archived = false; // Set archived to false

            // Validate if all required fields are filled
            if (string.IsNullOrWhiteSpace(name) || string.IsNullOrWhiteSpace(course) || string.IsNullOrWhiteSpace(year) || string.IsNullOrWhiteSpace(section) || string.IsNullOrWhiteSpace(studentId))
            {
                MessageBox.Show("Please fill in all fields.", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }

            // Create a new student object
            var student_data = new Students
            {
                Name = name,
                Course = course,
                Year = year,
                Section = section,
                StudentId = studentId,
                Archived = archived
            };

            try
            {
                MessageBox.Show("Student added successfully.", "Success", MessageBoxButton.OK, MessageBoxImage.Information);

                // Add the student to the database
                appDbContext.Students.Add(student_data);
                appDbContext.SaveChanges();

                // Show success message

                // Clear input fields after successful registration
                txtUsername.Clear();
                cmbRo1le.SelectedIndex = -1; // Clear selected course
                cmbRoa1le.SelectedIndex = -1; // Clear selected year
                cmbRaoa1le.SelectedIndex = -1; // Clear selected section
                txtConformPassword.Clear();
            }
            catch (Exception ex)
            {
                // Log the inner exception for details
                MessageBox.Show($"An error occurred while adding the student: {ex.Message}\nInner Exception: {ex.InnerException?.Message}", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        // Exit
        private void btnExit_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void txtUsername_TextChanged(object sender, System.Windows.Controls.TextChangedEventArgs e)
        {

        }

        private void btnMinimize_Click(object sender, RoutedEventArgs e)
        {
            this.WindowState = WindowState.Minimized;
        }
    }
}
