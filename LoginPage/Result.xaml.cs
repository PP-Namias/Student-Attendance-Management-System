using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace LoginPage
{
    /// <summary>
    /// Interaction logic for Result.xaml
    /// </summary>
    public partial class Result : Window
    {

        public Result()
        {
            InitializeComponent();
        }



        private void btnRefresh_Click(object sender, RoutedEventArgs e)
        {
            DateTime currentDateTime = DateTime.Now;

            txtTime.Text = currentDateTime.ToString("T");
            txtDate.Text = currentDateTime.ToString("MMM dd, yyyy"); //December 08, 2105.

        }


        private void btnMinimize_Click(object sender, RoutedEventArgs e)
        {
            this.WindowState = WindowState.Minimized;
        }

        private void btnExit_Click(object sender, RoutedEventArgs e)
        {
            Application.Current.Shutdown();
        }
    }
}
