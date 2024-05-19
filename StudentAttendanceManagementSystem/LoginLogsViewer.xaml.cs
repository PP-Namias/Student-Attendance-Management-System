using MaterialDesignThemes.Wpf;
using System.Collections.Generic;
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

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {

        }

        void LoadData()
        {
            //List<LgginLogs> LgginLogs = new LgginLogs().SelectAll();
            //DataGrid.ItemsSource = LgginLogs;
        }

        private void btnArchive_Click(object sender, RoutedEventArgs e)
        {
            ArchiveLoginLogs x = new ArchiveLoginLogs();
            UserPages.Children.Clear();
            UserPages.Children.Add(x);
        }
    }
}
