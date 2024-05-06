using LoginPage.DbContexts;
using LoginPage.Services;
using System.Linq;
using System.Windows;
using System.Windows.Input;
using System.Windows.Media;

namespace LoginPage
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
                MessageBox.Show("Login Successfully", "Congratulations " + txtUsername.Text, MessageBoxButton.OK, MessageBoxImage.Information);
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
            QRCodeReader QRCodeReader = new QRCodeReader();
            QRCodeReader.Show();
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

        private void btnLogin_Initialized(object sender, System.EventArgs e)
        {
            MainMenu MainMenu = new MainMenu();
            MainMenu.Show();
            this.Close();
        }

        private void Window_Initialized(object sender, System.EventArgs e)
        {

        }
    }
}
