using LiveCharts;
using LiveCharts.Defaults;
using LiveCharts.Wpf;
using MaterialDesignThemes.Wpf;
using StudentAttendanceManagementSystem.DbContexts;
using StudentAttendanceManagementSystem.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using System.Windows.Media;

namespace StudentAttendanceManagementSystem
{
    public partial class Dashboard : UserControl
    {
        public SeriesCollection SeriesCollection { get; set; }
        public string[] Labels { get; set; }
        public Func<double, string> Formatter { get; set; }

        public Dashboard()
        {
            InitializeComponent();
            LoadAttendanceData();
        }

        private void LoadAttendanceData()
        {
            try
            {
                using (var context = new AppDbContext())
                {
                    // Fetch attendance data from the database
                    var attendanceData = context.Attendance
                        .GroupBy(a => a.Date)
                        .Select(g => new
                        {
                            Date = g.Key,
                            Count = g.Count()
                        })
                        .OrderBy(x => x.Date)
                        .ToList();

                    // Prepare the series collection
                    SeriesCollection = new SeriesCollection
                    {
                        new LineSeries
                        {
                            Title = "Attendance",
                            Values = new ChartValues<ObservableValue>(
                                attendanceData.Select(x => new ObservableValue(x.Count)).ToList()
                            ),
                            DataLabels = true,
                            Fill = new SolidColorBrush(Color.FromArgb(108, 185,153,118)),  // 50% opacity with hex #3C2A21
                            Stroke = new SolidColorBrush(Color.FromRgb(185,153,118)),  // Hex #3C2A21
                            PointGeometry = DefaultGeometries.Circle,
                            PointGeometrySize = 10
                        }
                    };

                    // Prepare the labels
                    Labels = attendanceData.Select(x => x.Date.ToShortDateString()).ToArray();
                    Formatter = value => value.ToString();

                    // Set the data context to bind the chart
                    DataContext = this;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show($"An error occurred while loading attendance data: {ex.Message}", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void Card_MouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            var sMessageDialog = new MessageDialog
            {
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

        private void UserControl_Loaded(object sender, RoutedEventArgs e)
        {
            // Any additional initialization if needed
        }
    }
}
