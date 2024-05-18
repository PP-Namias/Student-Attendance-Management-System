using MaterialDesignThemes.Wpf;
using System.Collections.Generic;
using System.Windows;
using System.Windows.Controls;

namespace LoginPage
{
    /// <summary>
    /// Interaction logic for LoginLogsViewer.xaml
    /// </summary>
    public partial class LoginLogsViewer : UserControl
    {
        public LoginLogsViewer()
        {
            InitializeComponent();
            LoadData();
            PopupBox.Visibility = Visibility.Visible;
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {

        }

        void LoadData()
        {
            //List<LgginLogs> LgginLogs = new LgginLogs().SelectAll();
            //DataGrid.ItemsSource = LgginLogs;
        }

        private void PopUp_AddNewEmployee(object sender, RoutedEventArgs e)
        {
            //Window win = new Window();
            //AddNewLog eDoc = new AddNewLog();
            //win.Content = eDoc;
            //win.Title = "Add Product";
            //win.Width = 350;
            //win.Height = 450;
            //win.WindowStartupLocation = WindowStartupLocation.CenterScreen;
            //win.Show();
            //AddNewLog userControl1 = new AddNewLog();
            //this.InitializeComponent();
            // UserControl win = new UserControl();
            //AddNewLog eDoc = new AddNewLog();
            //win.Content = eDoc;
            //win.Title = "Add Product";
            //win.Width = 350;
            //win.Height = 450;
            //win.WindowStartupLocation = WindowStartupLocation.CenterScreen;
            //win.Show();
            //LoginLogsViewer LoginLogsViewer = new LoginLogsViewer();


            //TextBlock_TitleName.Visibility = Visibility.Collapsed;
            //DataGrid.Visibility = Visibility.Collapsed;
            //PopupBox.Visibility = Visibility.Collapsed;

            //AddNewLog x = new AddNewLog();
            //UserPages.Children.Clear();
            //UserPages.Children.Add(x);
            //PopupBoxWithClose.Visibility = Visibility.Visible;
        }

        private void PopUp_Close(object sender, RoutedEventArgs e)
        {
            UserPages.Children.Clear();
            PopupBoxWithClose.Visibility = Visibility.Hidden;

            //LoadData();
            //TextBlock_TitleName.Visibility = Visibility.Visible;
            //DataGrid.Visibility = Visibility.Visible;
            PopupBox.Visibility = Visibility.Visible;
        }

        private void PopUp_EditEmployee(object sender, RoutedEventArgs e)
        {
            //TextBlock_TitleName.Visibility = Visibility.Collapsed;
            //DataGrid.Visibility = Visibility.Collapsed;
            //PopupBox.Visibility = Visibility.Collapsed;

            //ModifyLog x = new ModifyLog();
            //UserPages.Children.Clear();
            //UserPages.Children.Add(x);
            //PopupBoxWithClose.Visibility = Visibility.Visible;
        }
    }
}
