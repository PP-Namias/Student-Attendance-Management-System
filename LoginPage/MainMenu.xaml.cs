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
    /// Interaction logic for MainMenu.xaml
    /// </summary>
    public partial class MainMenu : Window
    {
        public MainMenu()
        {
            InitializeComponent();
        }

        private void btnExit_Click1(object sender, RoutedEventArgs e)
        {
            Application.Current.Shutdown();
        }

        private void btnQRReader_Click(object sender, RoutedEventArgs e)
        {
            QRCodeReader QRCodeReader = new QRCodeReader();
            QRCodeReader.Show();
        }

        private void StackPanel_Initialized()
        {

        }
    }
}
