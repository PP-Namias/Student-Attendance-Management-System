using System.Diagnostics;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;

namespace StudentAttendanceManagementSystem
{
    /// <summary>
    /// Interaction logic for LoginLogs.xaml
    /// </summary>
    public partial class LoginLogs : UserControl
    {
        public LoginLogs()
        {
            InitializeComponent();
            //WelcomeMessage.Text = "Welcome " + LoggedInUser.Instance.Info.Name + "!";
        }

        private void LoginLogsViewer_Click(object sender, RoutedEventArgs e)
        {
            //  LoginLogsViewer
            this.topgrid.Visibility = Visibility.Collapsed;
            this.mainscrollviewer.Visibility = Visibility.Collapsed;

            LoginLogsViewer x = new LoginLogsViewer();
            UserPages.Children.Clear();
            UserPages.Children.Add(x);
        }

        private void AddNewLog_Click(object sender, RoutedEventArgs e)
        {

        }

        private void ModifyLog_Click(object sender, RoutedEventArgs e)
        {

        }
    }
}
