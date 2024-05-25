using System.Windows;
using System.Windows.Input;
using MahApps.Metro.Controls;
using System.Diagnostics;
using MaterialDesignThemes.Wpf;
using MahApps.Metro.Controls.Dialogs;
using StudentAttendanceManagementSystem.Models;

namespace StudentAttendanceManagementSystem
{
    /// <summary>
    /// Interaction logic for Home.xaml
    /// </summary>
    public partial class MainMenu : MetroWindow
    {
        public MainMenu()
        {
            InitializeComponent();
        }

        //Executing after loading window
        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            Dashboard x = new Dashboard();
            UserPages.Children.Clear();
            UserPages.Children.Add(x);
        }

        //private void TextBox_MouseDown(object sender, MouseButtonEventArgs e)
        //{
        //    this.Hide();
        //    var obj = new AddAttendance();
        //    obj.Show();
        //    this.Close();
        //}

        #region main-buttons

        //private void ButtonLogins_Click(object sender, RoutedEventArgs e)
        //{

        //}

        //private void ButtonAttendances_Click(object sender, RoutedEventArgs e)
        //{

        //}

        //private void ButtonSystem_Click(object sender, RoutedEventArgs e)
        //{

        //}

        //private void ButtonReportss_Click(object sender, RoutedEventArgs e)
        //{

        //}

        //private void Logout_Click(object sender, RoutedEventArgs e)
        //{

        //}

        #endregion

        #region diaglog-socialbuttons-informationlinks

        // About message dialog
        private void MenuPopupAboutButton_OnClick(object sender, RoutedEventArgs e)
        {
            var sMessageDialog = new MessageDialog
            {
                //Message = { Text = ((ButtonBase)sender).Content.ToString() }
                Message = { Text =
                    "Student Attendance Management System" +
                    "\nFinal Reports on " +
                    "\nHCI and Programming Languages" +
                    "\n" +
                    "\nMembers:" +
                    "\nChristian Perez" +
                    "\nJhon Keneth Ryan B. Namias" +
                    "\nKarl Miranda" +
                    "\nMark Acedo" +
                    "\nMike Caram" +
                    "\n" +

                    "\nMade with ♡ BSCS 2A"
                }
            };

            DialogHost.Show(sMessageDialog, "RootDialog");
        }

        // Social Buttons
        private void GithubButton_OnClick(object sender, RoutedEventArgs e)
        {
            Process.Start("http://Github.com/PP_Namias");
        }

        private void ChatButton_OnClick(object sender, RoutedEventArgs e)
        {
            Process.Start("https://github.com/PP-Namias");
        }

        private void EmailButton_OnClick(object sender, RoutedEventArgs e)
        {
            Process.Start("mailto://jkrbn99@gmail.com");
        }

        // Information Links
        private void TextBlock_WebOrdersMouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            Process.Start("http://PP-Namias.Github.io/");
        }
        #endregion


        #region treeitems
        private void TreeItem_AttendanceAdd_PreviewMouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            /*
            AttendanceAddNew x = new AttendanceAddNew();
            UserPages.Children.Clear();
            UserPages.Children.Add(x);
            */
        }

        private void TreeItem_AttendanceEdit_PreviewMouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            /*
            AttendanceEdit x = new AttendanceEdit();
            UserPages.Children.Clear();
            UserPages.Children.Add(x);
            */
        }

        private void TreeItem_AttendancePartList_PreviewMouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            /*
            PartList x = new PartList();
            UserPages.Children.Clear();
            UserPages.Children.Add(x);
            */
        }

        private void TreeItem_AttendancePanelList_PreviewMouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            /*
            PanelList x = new PanelList();
            UserPages.Children.Clear();
            UserPages.Children.Add(x);
            */
        }

        private void TreeItem_SystemAdd_PreviewMouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            /*
            CompanyAddNew x = new CompanyAddNew();
            UserPages.Children.Clear();
            UserPages.Children.Add(x);
            */
        }
        private void TreeItem_SystemList_PreviewMouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            /*
            CompanyList x = new CompanyList();
            UserPages.Children.Clear();
            UserPages.Children.Add(x);
            */
        }

        private void TreeItem_Home_PreviewMouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            Home x = new Home();
            UserPages.Children.Clear();
            UserPages.Children.Add(x);
        }

        private void TreeItem_LoginAdd_PreviewMouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            /*
            LoginAddNew x = new LoginAddNew();
            UserPages.Children.Clear();
            UserPages.Children.Add(x);
            */
        }

        private void TreeItem_LoginList_PreviewMouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            /*
            LoginList x = new LoginList();
            UserPages.Children.Clear();
            UserPages.Children.Add(x);
            */
        }

        private void TreeItem_LoginEdit_PreviewMouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            /*
            LoginEdit x = new LoginEdit();
            UserPages.Children.Clear();
            UserPages.Children.Add(x);
            */
        }

        private void TreeItem_SystemEdit_PreviewMouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            /*
            CompanyEdit x = new CompanyEdit();
            UserPages.Children.Clear();
            UserPages.Children.Add(x);
            */
        }

        private void TreeItem_ReportsAdd_PreviewMouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            /*
            ReportsAddNew x = new ReportsAddNew();
            UserPages.Children.Clear();
            UserPages.Children.Add(x);
            */
        }

        private void TreeItem_ReportsEdit_PreviewMouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            /*
            ReportsEdit x = new ReportsEdit();
            UserPages.Children.Clear();
            UserPages.Children.Add(x);
            */
        }

        private void TreeItem_ReportsList_PreviewMouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            /*
            ReportsList x = new ReportsList();
            UserPages.Children.Clear();
            UserPages.Children.Add(x);
            */
        }

        #endregion

        private void MenuPopupLogoutButton_OnClick(object sender, RoutedEventArgs e)
        {
            /*
            this.Hide();
            LoggedInUser.Instance.RemoveData();
            Login x = new Login();
            x.Show();
            this.Close();
            */
        }

        private void MenuToggleButton_Checked(object sender, RoutedEventArgs e)
        {

        }

        private void btn_Dashboard_Click(object sender, RoutedEventArgs e)
        {
            // Dashboard

            Dashboard x = new Dashboard();
            UserPages.Children.Clear();
            UserPages.Children.Add(x);

        }

        private void btn_StudentAttendance_Click(object sender, RoutedEventArgs e)
        {
            // Student Attendance Management

            BarcodeScanningInterface x = new BarcodeScanningInterface();
            UserPages.Children.Clear();
            UserPages.Children.Add(x);
        }

        private void btn_LoginLogs_Click(object sender, RoutedEventArgs e)
        {
            // Login Logs Management

            LoginLogsViewer x = new LoginLogsViewer();
            UserPages.Children.Clear();
            UserPages.Children.Add(x);
        }

        private void btn_Reports_Click(object sender, RoutedEventArgs e)
        {
            // Student Record

            StudentRecord x = new StudentRecord();
            UserPages.Children.Clear();
            UserPages.Children.Add(x);
        }

        private void btn_Students_Click(object sender, RoutedEventArgs e)
        {
            // Student Database

            StudentsDatabase x = new StudentsDatabase();
            UserPages.Children.Clear();
            UserPages.Children.Add(x);
        }

        private void btn_SystemAdministration_Click(object sender, RoutedEventArgs e)
        {
            // System Administration

            UserManagement x = new UserManagement();
            UserPages.Children.Clear();
            UserPages.Children.Add(x);
        }




        #region topbar
        private void TextBlock_MouseLeftButtonDown_0(object sender, MouseButtonEventArgs e)
        {
            // Home

            Home x = new Home();
            UserPages.Children.Clear();
            UserPages.Children.Add(x);
        }
        private void TextBlock_MouseLeftButtonDown_1(object sender, MouseButtonEventArgs e)
        {
            // Student Attendance Management

            StudentAttendance x = new StudentAttendance();
            UserPages.Children.Clear();
            UserPages.Children.Add(x);
        }

        private void TextBlock_MouseLeftButtonDown_2(object sender, MouseButtonEventArgs e)
        {
            // Login Logs Management

            LoginLogs x = new LoginLogs();
            UserPages.Children.Clear();
            UserPages.Children.Add(x);
        }

        private void TextBlock_MouseLeftButtonDown_3(object sender, MouseButtonEventArgs e)
        {
            // Reports and Analytics

            ReportsandAnalytics x = new ReportsandAnalytics();
            UserPages.Children.Clear();
            UserPages.Children.Add(x);
        }

        private void TextBlock_MouseLeftButtonDown_4(object sender, MouseButtonEventArgs e)
        {
            // System Administration

            SystemAdministration x = new SystemAdministration();
            UserPages.Children.Clear();
            UserPages.Children.Add(x);
        }

        private void TextBlock_MouseLeftButtonDown_5(object sender, MouseButtonEventArgs e)
        {
            // Log Out
        }


        #endregion

        private void TreeItem_BarcodeScan_PreviewMouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {

        }
    }
}