using StudentAttendanceManagementSystem.DbContexts;
using StudentAttendanceManagementSystem.Interfaces;
using StudentAttendanceManagementSystem.Models;
using StudentAttendanceManagementSystem.Services;
using System.Linq;
using System.Net.PeerToPeer;
using System.Windows;
using System.Windows.Input;
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

        // Login 
        private void btnLogin_Click(object sender, RoutedEventArgs e)
        {
            if (LoginUser(txtUsername.Text, txtPassword.Password) == 1)
            {

                var LoginLogs = new LoginUser()
                {
                    Username = txtUsername.Text,
                    LogInTime = System.DateTime.Now,
                    Date = System.DateTime.Now,
                    Role = "User",
                    Remark = "Login Successfully"
                };
                
                appDbContext.LoginLogs.Add(LoginLogs);
                appDbContext.SaveLoginLog(LoginLogs);


                /*
                 * 
                 * wtih this code as example
                var user = new LoginLog()
                {
                    UserName = username,
                    PhoneNumber = phonenumber,
                    PasswordHash = hashService.GetHash(password),
                };

                appDbContext.Users.Add(user);
                appDbContext.SaveChanges();

                make an record for login logs 
                and save it to the database

                -- Table: LoginLogs
                CREATE TABLE LoginLogs (
                    Id SERIAL PRIMARY KEY,
                    UserId INTEGER REFERENCES Users(Id),
                    Username VARCHAR,
                    LoginTime TIMESTAMP,
                    LogoutTime TIMESTAMP,
                    Date DATE,
                    Role VARCHAR,
                    Remark VARCHAR
                );

                



                var LoginLogss = new LoginUser()
                {
                    Username = txtUsername.Text,
                    LoginTime = System.DateTime.Now,
                    Date = System.DateTime.Now,
                    Role = "User",
                    Remark = "Login Successfully"
                };

                appDbContext.LoginLogs.Add(LoginLogss);
                appDbContext.SaveLoginLog();

                                */

                //MessageBox.Show("Login Successfully", "Congratulations " + txtUsername.Text, MessageBoxButton.OK, MessageBoxImage.Information);
                MainMenu MainMenu = new MainMenu();
                MainMenu.Show();
                this.Close();
            }
            if (LoginUser(txtUsername.Text, txtPassword.Password) == 3)
            {
                MessageBox.Show("Username or password is wrong", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }


        public int LoginUser(string username, string password)
        {
            HashService hashService = new HashService();
            password = hashService.GetHash(password);

            bool name = appDbContext.Users.Any(x => x.UserName == username && username.Length > 4);
            bool passwords = appDbContext.Users.Any(x => x.PasswordHash == password);

            if (name == true && passwords == true)
            {
                return 1;
            }

            if (username == null && password == null || username != null && password == null || password != null && username == null)
            {
                return 2;
            }

            if (name == true && passwords == false || name == false && passwords == true)
            {
                return 3;
            }
            return 3;
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

    }
}
