using MaterialDesignThemes.Wpf;
using StudentAttendanceManagementSystem.DbContexts;
using StudentAttendanceManagementSystem.Models;
using System.Linq;
using System.Windows;
using System.Windows.Controls;

namespace StudentAttendanceManagementSystem
{
    /// <summary>
    /// Interaction logic for ArchiveLoginLogs.xaml
    /// </summary>
    public partial class ArchiveLoginLogs : UserControl
    {
        public ArchiveLoginLogs()
        {
            InitializeComponent();
            LoadData();
        }

        private void LoadData()
        {
            using (var context = new AppDbContext())
            {
                var archivedLoginLogs = context.LoginLogs
                                               .Where(log => log.Archived)
                                               .ToList();
                var loginLogViewModels = archivedLoginLogs
                                         .Select(log => new LoginLogViewModel(log))
                                         .ToList();
                tblArchivedLogs.ItemsSource = loginLogViewModels;
            }
        }

        private void btnUnarchive_Click(object sender, RoutedEventArgs e)
        {
            var selectedLog = tblArchivedLogs.SelectedItem as LoginLogViewModel;
            if (selectedLog != null)
            {
                using (var context = new AppDbContext())
                {
                    var logToUnarchive = context.LoginLogs.Find(selectedLog.Id);
                    if (logToUnarchive != null)
                    {
                        logToUnarchive.Archived = false;
                        context.SaveChanges();
                        MessageBox.Show("Log entry unarchived successfully.", "Success", MessageBoxButton.OK, MessageBoxImage.Information);
                    }
                }
                LoadData();
            }
            else
            {
                MessageBox.Show("Please select a log entry to unarchive.", "No Selection", MessageBoxButton.OK, MessageBoxImage.Warning);
            }
        }

        private void btnOpenArchive_Click(object sender, RoutedEventArgs e)
        {

        }

        private void btnRefresh_Click(object sender, RoutedEventArgs e)
        {

        }
    }
}
