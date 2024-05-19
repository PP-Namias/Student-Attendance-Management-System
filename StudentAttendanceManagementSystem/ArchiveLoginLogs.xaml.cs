using MaterialDesignThemes.Wpf;
using System.Collections.Generic;
using System.Windows;
using System.Windows.Controls;

namespace StudentAttendanceManagementSystem
{
    /// <summary>
    /// Interaction logic for LoginLogsArchiveLoginLogsViewer.xaml
    /// </summary>
    public partial class ArchiveLoginLogs : UserControl
    {
        public ArchiveLoginLogs()
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

    }
}
