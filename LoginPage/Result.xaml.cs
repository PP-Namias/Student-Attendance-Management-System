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
            txtDate.Text = currentDateTime.ToString("MMM dd, yyyy");
        }

        /*
        public void ValidateBarcode(string barcodeText)
        {
            // Use the Dispatcher to execute the UI-related code on the UI thread
            Application.Current.Dispatcher.Invoke(() =>
            {
                if (barcodeText == "20220260-N")
                {
                    txtName.Text = "Jhon Keneth Namias";
                    BitmapImage bitmapImage = new BitmapImage(new Uri("/Jhon Keneth Namias.jpg", UriKind.RelativeOrAbsolute));
                    imgProfile.Source = bitmapImage;
                }
                else if (barcodeText == "8996001311059")
                {
                    txtName.Text = "Malkist";
                    BitmapImage bitmapImage = new BitmapImage(new Uri("/Malkist.jpg", UriKind.RelativeOrAbsolute));
                    imgProfile.Source = bitmapImage;
                }
                else if (barcodeText == "8991001112118")
                {
                    txtName.Text = "Take-it";
                    BitmapImage bitmapImage = new BitmapImage(new Uri("/Take-it.jpg", UriKind.RelativeOrAbsolute));
                    imgProfile.Source = bitmapImage;
                }
                else
                {
                    txtName.Text = "Invalid Code Scanned";
                    BitmapImage bitmapImage = new BitmapImage(new Uri("/Jhon Keneth Namias.jpg", UriKind.RelativeOrAbsolute));
                    imgProfile.Source = bitmapImage;
                }
            });
        }
        */

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
