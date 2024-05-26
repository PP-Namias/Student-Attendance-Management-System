using LiveCharts;
using LiveCharts.Defaults;
using LiveCharts.Wpf;
using MaterialDesignThemes.Wpf;
using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace StudentAttendanceManagementSystem
{
    /// <summary>
    /// Interaction logic for Dashboard.xaml
    /// </summary>
    public partial class Dashboard : UserControl
    {
        public SeriesCollection SeriesCollection { get; set; }
        public SeriesCollection LastHourSeries { get; set; }
        public SeriesCollection LastHourSeries1 { get; set; }
        public string[] Labels { get; set; }
        public Func<double, string> Formatter { get; set; }
        public Dashboard()
        {
            InitializeComponent();
            SeriesCollection = new SeriesCollection
            {
                new StackedColumnSeries
                {
                    Values = new ChartValues<double> {7,6,5,4,3,2,1},
                    StackMode = StackMode.Values,
                    DataLabels = true
                }
            };
            LastHourSeries = new SeriesCollection
            {
                new LineSeries
                {
                    AreaLimit = -10,
                    Values = new ChartValues<ObservableValue>
                    {
                        new ObservableValue(3),
                        new ObservableValue(1),
                        new ObservableValue(9),
                        new ObservableValue(4),
                        new ObservableValue(5),
                        new ObservableValue(3),
                        new ObservableValue(1),
                        new ObservableValue(2),
                        new ObservableValue(3),
                        new ObservableValue(7),
                    }
                }
            };
            LastHourSeries1 = new SeriesCollection
            {
                new LineSeries
                {
                    AreaLimit = -10,
                    Values = new ChartValues<ObservableValue>
                    {
                        new ObservableValue(13),
                        new ObservableValue(11),
                        new ObservableValue(9),
                        new ObservableValue(14),
                        new ObservableValue(5),
                        new ObservableValue(3),
                        new ObservableValue(12),
                        new ObservableValue(2),
                        new ObservableValue(3),
                        new ObservableValue(7),
                    }
                }
            };
            Labels = new[] { "May 20", "May 21", "May 22", "May 23", "May 24", "May 25", "May 26" };
            Formatter = value => value.ToString();
            DataContext = this;
        
        }

        private void Card_MouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {

            var sMessageDialog = new MessageDialog
            {
                //Message = { Text = ((ButtonBase)sender).Content.ToString() }
                Message = { Text =
                    "Student Attendance Management System" +
                    "\nFinal Reports on " +
                    "\nHCI and Programming Languages" +
                    "\n" +
                    "\nMembers:" +
                    "\nChristian Perez" +
                    "\nJhon Keneth Ryan B. Namias" +
                    "\nKarl Miranda" +
                    "\nMark Acedo" +
                    "\nMike Caram" +
                    "\n" +

                    "\nMade with ♡ BSCS 2A"
                }
            };

            DialogHost.Show(sMessageDialog, "RootDialog");
        }
    }
}
