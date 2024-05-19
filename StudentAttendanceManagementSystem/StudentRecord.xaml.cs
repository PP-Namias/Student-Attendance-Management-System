using MaterialDesignThemes.Wpf;
using System.Collections.Generic;
using System.Windows;
using System.Windows.Controls;

namespace StudentAttendanceManagementSystem
{
    /// <summary>
    /// Interaction logic for StudentRecord.xaml
    /// </summary>
    public partial class StudentRecord : UserControl
    {
        public StudentRecord()
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

        private void btnEdit_Click(object sender, RoutedEventArgs e)
        {

        }
    }
}
