using MaterialDesignThemes.Wpf;
using StudentAttendanceManagementSystem.DbContexts;
using StudentAttendanceManagementSystem.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows;
using System.Windows.Controls;

namespace StudentAttendanceManagementSystem
{
    /// <summary>
    /// Interaction logic for LoginLogsViewer.xaml
    /// </summary>
    public partial class LoginLogsViewer : UserControl
    {
        public LoginLogsViewer()
        {
            InitializeComponent();
            LoadData();
        }

        private void LoadData()
        {
            using (var context = new AppDbContext())
            {
                var nonArchivedLoginLogs = context.LoginLogs
                                                  .Where(log => !log.Archived)
                                                  .ToList();
                var loginLogViewModels = nonArchivedLoginLogs
                                         .Select(log => new LoginLogViewModel(log))
                                         .ToList();
                tblLoginLogs.ItemsSource = loginLogViewModels;
                NumberOfLogs.Text = $"Number of logs: {nonArchivedLoginLogs.Count}";
            }
        }

        private void btnArchive_Click(object sender, RoutedEventArgs e)
        {
            var selectedLog = tblLoginLogs.SelectedItem as LoginLogViewModel;
            if (selectedLog != null)
            {
                using (var context = new AppDbContext())
                {
                    var logToArchive = context.LoginLogs.Find(selectedLog.Id);
                    if (logToArchive != null)
                    {
                        logToArchive.Archived = true;
                        context.SaveChanges();
                        MessageBox.Show("Log entry archived successfully.", "Success", MessageBoxButton.OK, MessageBoxImage.Information);
                    }
                }
                LoadData();
            }
            else
            {
                MessageBox.Show("Please select a log entry to archive.", "No Selection", MessageBoxButton.OK, MessageBoxImage.Warning);
            }
        }

        private void btnRefresh_Click(object sender, RoutedEventArgs e)
        {
            LoadData();
        }

        private void btnOpenArchive_Click(object sender, RoutedEventArgs e)
        {
            ArchiveLoginLogs x = new ArchiveLoginLogs();
            UserPages.Children.Clear();
            UserPages.Children.Add(x);
        }

    }

    public class LoginLogViewModel
    {
        public int Id { get; set; }
        public int UserId { get; set; }
        public string Username { get; set; }
        public string LoginTime { get; set; }
        public string LogoutTime { get; set; }
        public DateTime Date { get; set; }
        public string Role { get; set; }
        public string Remark { get; set; }

        public LoginLogViewModel(LoginUser loginUser)
        {
            Id = loginUser.Id;
            UserId = loginUser.UserId;
            Username = loginUser.Username;
            LoginTime = loginUser.LogInTime.ToString("T"); // Format as time
            LogoutTime = loginUser.LogOutTime.ToString("T"); // Format as time, handle nulls
            Date = loginUser.Date;
            Role = loginUser.Role;
            Remark = loginUser.Remark;
        }
    }
}
