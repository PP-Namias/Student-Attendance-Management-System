using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using Microsoft.EntityFrameworkCore;
using StudentAttendanceManagementSystem.DbContexts;
using StudentAttendanceManagementSystem.Models;

namespace StudentAttendanceManagementSystem
{
    public partial class UserManagement : UserControl
    {
        private readonly AppDbContext _dbContext;

        public UserManagement()
        {
            InitializeComponent();
            _dbContext = new AppDbContext(); // Initialize the DbContext
            LoadData();
        }

        private void LoadData()
        {

            using (var userss = new AppDbContext())
            {
                // Load data from the database
                var users = _dbContext.Users.ToList(); // Fetch all users from the database
                tblUserManagement.ItemsSource = users; // Bind the users list to the DataGrid
            }

        }
            private void btnAdd_Click(object sender, RoutedEventArgs e)
        {
            // Open a window/dialog to add a new user
            Window1 addUserWindow = new Window1();
            addUserWindow.ShowDialog();
            // Refresh the data after adding a new user
            LoadData();
        }

        private void btnSave_Click(object sender, RoutedEventArgs e)
        {
            // Save changes to the selected user
            var selectedUser = tblUserManagement.SelectedItem as User;
            if (selectedUser != null)
            {
                try
                {
                    _dbContext.SaveChanges();
                    MessageBox.Show("Changes saved successfully.", "Success", MessageBoxButton.OK, MessageBoxImage.Information);
                }
                catch (Exception ex)
                {
                    MessageBox.Show($"An error occurred while saving changes: {ex.Message}", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
        }

        private void btnDelete_Click(object sender, RoutedEventArgs e)
        {
            // Get the selected user from the DataGrid
            var selectedUser = tblUserManagement.SelectedItem as User;
            if (selectedUser != null)
            {
                // Delete the selected user from the database
                _dbContext.Users.Remove(selectedUser);
                _dbContext.SaveChanges();
                // Refresh the data after deleting the user
                LoadData();
            }
            else
            {
                MessageBox.Show("Please select a user to delete.", "Delete User", MessageBoxButton.OK, MessageBoxImage.Information);
            }
        }

        private void btnRefresh_Click(object sender, RoutedEventArgs e)
        {
            LoadData();
        }
    }
}
