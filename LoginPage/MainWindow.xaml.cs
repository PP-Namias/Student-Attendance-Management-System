using LoginPage.DbContexts;
using LoginPage.Services;
using System.Linq;
using System.Windows;
using System.Windows.Input;

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
                MessageBox.Show("Login Successfully", "Congratulations" + txtUsername.Text, MessageBoxButton.OK, MessageBoxImage.Information);
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

        // CheckBox 
        private void CheckBox_Checked(object sender, RoutedEventArgs e)
        {

        }

        // CheckBox Changed Color
        private void CheckBox_ColorChanged(object sender, RoutedPropertyChangedEventArgs<System.Windows.Media.Color> e)
        {

        }

        // Register
        private void btnRegister_Click(object sender, RoutedEventArgs e)
        {
            Window1 window1 = new Window1();
            window1.Show();
            this.Close();
        }

        private void txtUsername_TextChanged(object sender, System.Windows.Controls.TextChangedEventArgs e)
        {

        }
    }
}
