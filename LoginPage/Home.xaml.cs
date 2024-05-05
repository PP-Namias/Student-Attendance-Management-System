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

        private void ButtonEmployees_Click(object sender, RoutedEventArgs e)
        {
            this.mainscrollviewer.Visibility = Visibility.Collapsed;
            this.topgrid.Visibility = Visibility.Collapsed;
            this.homePopupBox.Visibility = Visibility.Collapsed;

            /*
            HomeEmployees x = new HomeEmployees();
            UserPages.Children.Clear();
            UserPages.Children.Add(x);
            */
        }

        private void ButtonProducts_Click(object sender, RoutedEventArgs e)
        {
            this.mainscrollviewer.Visibility = Visibility.Collapsed;
            this.topgrid.Visibility = Visibility.Collapsed;
            this.homePopupBox.Visibility = Visibility.Collapsed;

            /*
            HomeProducts x = new HomeProducts();
            UserPages.Children.Clear();
            UserPages.Children.Add(x);
            */
        }

        private void ButtonCompanies_Click(object sender, RoutedEventArgs e)
        {
            this.mainscrollviewer.Visibility = Visibility.Collapsed;
            this.topgrid.Visibility = Visibility.Collapsed;
            this.homePopupBox.Visibility = Visibility.Collapsed;

            /*
            HomeCompanies x = new HomeCompanies();
            UserPages.Children.Clear();
            UserPages.Children.Add(x);
            */
        }

        private void ButtonProjects_Click(object sender, RoutedEventArgs e)
        {
            this.mainscrollviewer.Visibility = Visibility.Collapsed;
            this.topgrid.Visibility = Visibility.Collapsed;
            this.homePopupBox.Visibility = Visibility.Collapsed;

            /*
            HomeProjects x = new HomeProjects();
            UserPages.Children.Clear();
            UserPages.Children.Add(x);
            */
        }

        private void ButtonPurchaseSelling_Click(object sender, RoutedEventArgs e)
        {
            this.mainscrollviewer.Visibility = Visibility.Collapsed;
            this.topgrid.Visibility = Visibility.Collapsed;
            this.homePopupBox.Visibility = Visibility.Collapsed;

            /*
            HomePurchaseSelling x = new HomePurchaseSelling();
            UserPages.Children.Clear();
            UserPages.Children.Add(x);
            */
        }
        #endregion

        #region socialbuttons

        // Social Buttons
        private void TwitterButton_OnClick(object sender, RoutedEventArgs e)
        {
            //Process.Start("http://twitter.com/shuayb_ashraf");
        }

        private void ChatButton_OnClick(object sender, RoutedEventArgs e)
        {
            //Process.Start("https://gitter.im/shuayb_ashraf");
        }

        private void EmailButton_OnClick(object sender, RoutedEventArgs e)
        {
            //Process.Start("mailto://shuayb@gmx.com");
        }

        // Information Links
        private void TextBlock_WebOrdersMouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            //Process.Start("http://alphaelectric.shuayb.me/");
        }
        #endregion
    }
}
