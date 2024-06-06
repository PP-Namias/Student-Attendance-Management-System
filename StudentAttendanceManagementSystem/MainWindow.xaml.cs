using StudentAttendanceManagementSystem.DbContexts;
using StudentAttendanceManagementSystem.Interfaces;
using StudentAttendanceManagementSystem.Models;
using StudentAttendanceManagementSystem.Services;
using System.Linq;
using System.Net.PeerToPeer;
using System.Windows;
using System.Windows.Input;
using System.Windows.Interop;
using System.Windows.Media;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.StartPanel;

namespace StudentAttendanceManagementSystem
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {

        AppDbContext appDbContext = new AppDbContext();


        public MainWindow()
        {

            InitializeComponent();
            appDbContext = new AppDbContext();
        }

        private void btnLogin_Click(object sender, RoutedEventArgs e)
        {

            MainMenu MainMenu = new MainMenu();
            MainMenu.Show();
            this.Close();

            if (txtPassword.Visibility == Visibility.Visible)
            {
                txtPasswordTextBox.Text = txtPassword.Password;
            }
            else
            {
                txtPassword.Password = txtPasswordTextBox.Text;
            }


            string userRole = LoginUser(txtUsername.Text, txtPassword.Password);

            if (userRole == "Teacher")
            {
                var LoginLogs = new LoginUser()
                {
                    Username = txtUsername.Text,
                    LogInTime = System.DateTime.Now,
                    Date = System.DateTime.Today,
                    Role = "User",
                    Remark = "Login Successfully"
                };

                appDbContext.LoginLogs.Add(LoginLogs);
                appDbContext.SaveLoginLog(LoginLogs);


                // Assuming 'dashboard' is an instance of the Dashboard class
                Dashboard dashboard = new Dashboard();
                dashboard.txtName.Text = "Logged as " + txtUsername.Text;

                dashboard.LoginLogs.Visibility    = Visibility.Hidden;
                dashboard.UserAccounts.Visibility = Visibility.Hidden;



                
                MainMenu MainMenu_open = new MainMenu();
                MainMenu_open.btn_LoginLogs.Visibility = Visibility.Hidden;
                MainMenu_open.btn_SystemAdministration.Visibility = Visibility.Hidden;
                MainMenu_open.LoginLogsManagement.Visibility = Visibility.Hidden;
                MainMenu_open.UserAccountManagement.Visibility = Visibility.Hidden;
                



                MainMenu_open.Show();
                this.Close();
            }
            else if (userRole == "Admin") // Assuming you have an Admin role
            {
                Dashboard Dashboard = new Dashboard();
                Dashboard.txtName.Text = "Welcome, " + txtUsername.Text.ToString();

            }
            else
            {
                MessageBox.Show("Username or password is wrong", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }


        public string LoginUser(string username, string password)
        {
            HashService hashService = new HashService();
            password = hashService.GetHash(password);

            bool name = appDbContext.Users.Any(x => x.UserName == username && username.Length > 4);
            bool passwords = appDbContext.Users.Any(x => x.PasswordHash == password);

            var user = appDbContext.Users.FirstOrDefault(x => x.UserName == username && x.PasswordHash == password);

            if (name == true && passwords == true)
            {
                return user.Role; // Assuming your User model has a Role property
            }

            if (username == null && password == null || username != null && password == null || password != null && username == null)
            {
                return "2";
            }

            if (name == true && passwords == false || name == false && passwords == true)
            {
                return "3";
            }
            return "3";
        }

        private void Border_MouseDown(object sender, MouseButtonEventArgs e)
        {
            if (e.LeftButton == MouseButtonState.Pressed)
            {
                DragMove();
                System.Diagnostics.Debug.Write("some action...");
            }
        }

        // Exit
        private void btnExit_Click(object sender, RoutedEventArgs e)
        {
            Application.Current.Shutdown();
        }


        // Register
        private void btnRegister_Click(object sender, RoutedEventArgs e)
        {
            Window1 window1 = new Window1();
            window1.Show();
            this.Close();
        }

        private void btnMinimize_Click(object sender, RoutedEventArgs e)
        {
            this.WindowState = WindowState.Minimized;
        }

        private void btnQRReader_Click(object sender, RoutedEventArgs e)
        {
            MainMenu MainMenu = new MainMenu();
            MainMenu.Show();
        }

        private void btnShowPassword_Click(object sender, RoutedEventArgs e)
        {
            if (txtPassword.Visibility == Visibility.Visible)
            {
                txtPasswordTextBox.Text = txtPassword.Password;
                txtPasswordTextBox.Width = txtPassword.ActualWidth;
                txtPassword.Visibility = Visibility.Hidden;
                txtPasswordTextBox.Visibility = Visibility.Visible;

                iconShowPassword.Kind = MaterialDesignThemes.Wpf.PackIconKind.Show;
                btnShowPassword.Background = new SolidColorBrush((Color)ColorConverter.ConvertFromString("#FF02545A"));
            }
            else
            {
                txtPassword.Password = txtPasswordTextBox.Text;

                txtPasswordTextBox.Width = 0;
                txtPassword.Visibility = Visibility.Visible;
                txtPasswordTextBox.Visibility = Visibility.Hidden;

                iconShowPassword.Kind = MaterialDesignThemes.Wpf.PackIconKind.Hide;
                btnShowPassword.Background = new SolidColorBrush((Color)ColorConverter.ConvertFromString("#FF001011"));
            }

        }

        private void btnMainMenu1_Click(object sender, RoutedEventArgs e)
        {
            MainMenu MainMenu = new MainMenu();
            MainMenu.Show();
        }

        private void btnMainMenu2_Click(object sender, RoutedEventArgs e)
        {
            MainMenu2 MainMenu2 = new MainMenu2();
            MainMenu2.Show();
        }

        private void txtPasswordTextBox_TextInput(object sender, TextCompositionEventArgs e)
        {
            txtPassword.Password = txtPasswordTextBox.Text;
        }

        private void txtPassword_TextInput(object sender, TextCompositionEventArgs e)
        {
            txtPasswordTextBox.Text = txtPassword.Password;
        }

        private void txtPasswordTextBox_KeyDown(object sender, KeyEventArgs e)
        {
            txtPassword.Password = txtPasswordTextBox.Text;
        }

        private void txtPassword_KeyDown(object sender, KeyEventArgs e)
        {
            txtPasswordTextBox.Text = txtPassword.Password;
        }
    }
}