using System.Diagnostics;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;

//using DevExpress.Xpf.Printing;

namespace StudentAttendanceManagementSystem
{
    /// <summary>
    /// Interaction logic for Home.xaml
    /// </summary>
    public partial class StudentAttendance : UserControl
    {
        public StudentAttendance()
        {
            InitializeComponent();
            //WelcomeMessage.Text = "Welcome " + LoggedInUser.Instance.Info.Name + "!";
        }

        private void AttendanceEntry_Click(object sender, RoutedEventArgs e)
        {

        }

        private void BarcodeScanner_Click(object sender, RoutedEventArgs e)
        {

        }

        private void PrintAttendance_Click(object sender, RoutedEventArgs e)
        {

        }
    }
}
