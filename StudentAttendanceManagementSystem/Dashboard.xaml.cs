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

using System.ComponentModel;
using System.Timers;

namespace StudentAttendanceManagementSystem
{
    public partial class Dashboard : UserControl, INotifyPropertyChanged
    {
        public SeriesCollection SeriesCollection { get; set; }
        public string[] Labels { get; set; }
        public Func<double, string> Formatter { get; set; }


        public SeriesCollection LoginLogsSeriesCollection { get; set; }
        public string[] LoginLogsLabels { get; set; }
        public Func<double, string> Formatter2 { get; set; }

        public Dashboard()
        {
            InitializeComponent();
            LoadAttendanceData();
            LoadLoginLogsData();

            DataContext = this;
            StartTimer();

            Day.Text  = DateTime.Now.ToString("dddd");
            Date.Text = DateTime.Now.ToString("MMM dd, yyyy");


            using (var context = new AppDbContext())
            {
                var nonArchivedLoginLogs = context.LoginLogs
                                                  .Where(log => !log.Archived)
                                                  .ToList();
                txtLoginLogs.Text = nonArchivedLoginLogs.Count.ToString();
            }

            using (var context = new AppDbContext())
            {
                var nonArchivedAttendance = context.Attendance
                                                  .Where(log => !log.Archived)
                                                  .ToList();
                txtAttendance.Text = nonArchivedAttendance.Count.ToString();
            }

            using (var context = new AppDbContext())
            {
                var nonArchivedStudents = context.Students
                                                  .Where(log => !log.Archived)
                                                  .ToList();
                txtDatabase.Text = nonArchivedStudents.Count.ToString();
            }

            using (var context = new AppDbContext())
            {
                var nonArchivedAccounts = context.Users
                                                  .ToList();
                txtAccounts.Text = nonArchivedAccounts.Count.ToString();
            }

        }

        private string _currentTime;

        public event PropertyChangedEventHandler PropertyChanged;

        public string CurrentTime
        {
            get { return _currentTime; }
            set
            {
                _currentTime = value;
                PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(nameof(CurrentTime)));
            }
        }

        private void StartTimer()
        {
            Timer timer = new Timer();
            timer.Interval = 1000; // 1 second
            timer.Elapsed += Timer_Elapsed;
            timer.Start();
        }

        private void Timer_Elapsed(object sender, ElapsedEventArgs e)
        {
            // Update the CurrentTime property with the current time in 12-hour format
            CurrentTime = DateTime.Now.ToString("hh:mm:ss tt"); // "tt" for AM/PM
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
                            Stroke = new SolidColorBrush(Color.FromRgb(255, 156, 76)),  // Hex #3C2A21
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


        private void LoadLoginLogsData()
        {
            try
            {
                using (var context = new AppDbContext())
                {
                    // Fetch login logs data from the database
                    var loginLogsData = context.LoginLogs
                        .GroupBy(log => log.Date)
                        .Select(g => new
                        {
                            Date = g.Key,
                            Count = g.Count()
                        })
                        .OrderBy(x => x.Date)
                        .ToList();

                    // Prepare the series collection for login logs chart
                    LoginLogsSeriesCollection = new SeriesCollection
                    {
                        new ColumnSeries
                        {
                            Title = "Login Count",
                            Values = new ChartValues<ObservableValue>(
                                loginLogsData.Select(x => new ObservableValue(x.Count)).ToList()
                            ),
                            DataLabels = true,
                            Fill = new SolidColorBrush(Color.FromArgb(108, 255, 156, 76)),  // 50% opacity with hex #3C2A21
                            Stroke = new SolidColorBrush(Color.FromRgb(255, 156, 76)),  // Hex #3C2A21
                            LabelPoint = point => point.Y.ToString(), // Display the value on top of each bar
                        }
                    };

                    // Prepare the labels for login logs chart
                    LoginLogsLabels = loginLogsData.Select(x => x.Date.ToShortDateString()).ToArray();

                    // Formatter for Y-axis labels
                    Formatter2 = value => value.ToString();

                    // Set the data context to bind the login logs chart
                    DataContext = this;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show($"An error occurred while loading login logs data: {ex.Message}", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
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
