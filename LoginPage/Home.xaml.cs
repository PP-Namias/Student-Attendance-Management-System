using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using System.Diagnostics;

namespace LoginPage
{
    /// <summary>
    /// Interaction logic for Home.xaml
    /// </summary>
    public partial class Home : UserControl
    {
        public Home()
        {
            InitializeComponent();
            // WelcomeMessage.Text = "Welcome " + LoggedInUser.Instance.Info.Name + "!";
        }

        //Executing after loading window
        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            //worker = new BackgroundWorker();
            //worker.DoWork += Worker_DoWork;
            //worker.RunWorkerAsync();
        }

        //private void TextBox_MouseDown(object sender, MouseButtonEventArgs e)
        //{
        //    this.Hide();
        //    var obj = new AddProduct();
        //    obj.Show();
        //    this.Close();
        //}

        #region main-buttons

        private void StudentAttendance_Click(object sender, RoutedEventArgs e)
        {
            this.mainscrollviewer.Visibility = Visibility.Collapsed;
            this.topgrid.Visibility = Visibility.Collapsed;
            this.homePopupBox.Visibility = Visibility.Collapsed;

            StudentAttendance x = new StudentAttendance();
            UserPages.Children.Clear();
            UserPages.Children.Add(x);
        }

        private void SystemAdministration_Click(object sender, RoutedEventArgs e)
        {
            this.mainscrollviewer.Visibility = Visibility.Collapsed;
            this.topgrid.Visibility = Visibility.Collapsed;
            this.homePopupBox.Visibility = Visibility.Collapsed;

            SystemAdministration x = new SystemAdministration();
            UserPages.Children.Clear();
            UserPages.Children.Add(x);
        }

        private void LoginLogs_Click(object sender, RoutedEventArgs e)
        {
            this.mainscrollviewer.Visibility = Visibility.Collapsed;
            this.topgrid.Visibility = Visibility.Collapsed;
            this.homePopupBox.Visibility = Visibility.Collapsed;

            LoginLogs x = new LoginLogs();
            UserPages.Children.Clear();
            UserPages.Children.Add(x);
        }

        private void ReportsandAnalytics_Click(object sender, RoutedEventArgs e)
        {
            this.mainscrollviewer.Visibility = Visibility.Collapsed;
            this.topgrid.Visibility = Visibility.Collapsed;
            this.homePopupBox.Visibility = Visibility.Collapsed;

            ReportsandAnalytics x = new ReportsandAnalytics();
            UserPages.Children.Clear();
            UserPages.Children.Add(x);
        }

        private void Logout_Click(object sender, RoutedEventArgs e)
        {
            /*
            this.mainscrollviewer.Visibility = Visibility.Collapsed;
            this.topgrid.Visibility = Visibility.Collapsed;
            this.homePopupBox.Visibility = Visibility.Collapsed;

            Logout x = new Logout();
            UserPages.Children.Clear();
            UserPages.Children.Add(x);
            */
        }
        #endregion

        #region socialbuttons

        // Social Buttons
        private void GithubButton_OnClick(object sender, RoutedEventArgs e)
        {
            Process.Start("https://github.com/PP-Namias/Student-Attendance-Management-System");
        }

        private void EmailButton_OnClick(object sender, RoutedEventArgs e)
        {
            Process.Start("mailto://jkrbn99@gmail.com");
        }
        #endregion
    }
}
