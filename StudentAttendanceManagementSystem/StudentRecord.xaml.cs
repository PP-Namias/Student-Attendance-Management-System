using StudentAttendanceManagementSystem.DbContexts;
using StudentAttendanceManagementSystem.Models;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using System;
using System.Collections.Generic;

namespace StudentAttendanceManagementSystem
{
    /// <summary>
    /// Interaction logic for StudentRecord.xaml
    /// </summary>
    public partial class StudentRecord : UserControl
    {
        public StudentRecord()
        {
            InitializeComponent();
            LoadData();
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            // Any additional initialization if needed
        }

        void LoadData()
        {
            try
            {
                using (var context = new AppDbContext())
                {
                    var attendanceRecords = context.Attendance
                                          .Where(record => !record.Archived)
                                          .ToList();

                    var attendanceViewModels = attendanceRecords
                                             .Select(record => new AttendanceViewModel(record))
                                             .ToList();

                    tblStudentRecords.ItemsSource = attendanceViewModels;
                    NumberOfLogs.Text = $"Number of records: {attendanceRecords.Count}";
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show($"An error occurred while loading data: {ex.Message}", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
        private void btnArchive_Click(object sender, RoutedEventArgs e)
        {
            var selectedRecord = tblStudentRecords.SelectedItem as AttendanceViewModel;
            if (selectedRecord != null)
            {
                try
                {
                    using (var context = new AppDbContext())
                    {
                        var recordToUnarchive = context.Attendance.Find(selectedRecord.Id);
                        if (recordToUnarchive != null)
                        {
                            recordToUnarchive.Archived = true; // Set Archived to false to unarchive the record
                            context.SaveChanges();
                            MessageBox.Show("Record archived successfully.", "Success", MessageBoxButton.OK, MessageBoxImage.Information);
                        }
                    }
                    LoadData(); // Reload the data after unarchiving
                }
                catch (Exception ex)
                {
                    MessageBox.Show($"An error occurred while archiving record: {ex.Message}", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
            else
            {
                MessageBox.Show("Please select a record to archive.", "No Selection", MessageBoxButton.OK, MessageBoxImage.Warning);
            }
        }

        private void btnSaveChanges_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                using (var context = new AppDbContext())
                {
                    var modifiedRecords = tblStudentRecords.ItemsSource as List<AttendanceViewModel>;
                    if (modifiedRecords != null)
                    {
                        foreach (var modifiedRecord in modifiedRecords)
                        {
                            var recordToUpdate = context.Attendance.Find(modifiedRecord.Id);
                            if (recordToUpdate != null)
                            {
                                recordToUpdate.Name = modifiedRecord.Name;
                                recordToUpdate.Course = modifiedRecord.Course;
                                recordToUpdate.Year = modifiedRecord.Year;
                                recordToUpdate.Section = modifiedRecord.Section;
                                recordToUpdate.Status = modifiedRecord.Status;
                                recordToUpdate.Archived = modifiedRecord.Archived;
                                recordToUpdate.Date = modifiedRecord.Date;
                                // Update other properties as needed
                            }
                        }

                        context.SaveChanges();
                        MessageBox.Show("Changes saved successfully.", "Success", MessageBoxButton.OK, MessageBoxImage.Information);
                        LoadData();
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show($"An error occurred while saving changes: {ex.Message}", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void btnRefresh_Click(object sender, RoutedEventArgs e)
        {
            LoadData();
        }

        private void btnSave_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                using (var context = new AppDbContext())
                {
                    var modifiedRecords = tblStudentRecords.ItemsSource as List<AttendanceViewModel>;
                    if (modifiedRecords != null)
                    {
                        foreach (var modifiedRecord in modifiedRecords)
                        {
                            var recordToUpdate = context.Attendance.Find(modifiedRecord.Id);
                            if (recordToUpdate != null)
                            {
                                recordToUpdate.Name = modifiedRecord.Name;
                                recordToUpdate.Course = modifiedRecord.Course;
                                recordToUpdate.Year = modifiedRecord.Year;
                                recordToUpdate.Section = modifiedRecord.Section;
                                recordToUpdate.Status = modifiedRecord.Status;
                                recordToUpdate.Archived = modifiedRecord.Archived;
                                recordToUpdate.Date = modifiedRecord.Date;
                                // Update other properties as needed
                            }
                        }

                        context.SaveChanges();
                        MessageBox.Show("Changes saved successfully.", "Success", MessageBoxButton.OK, MessageBoxImage.Information);
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show($"An error occurred while saving changes: {ex.Message}", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void btnStudentDatabase_Click(object sender, RoutedEventArgs e)
        {
            StudentsDatabase x = new StudentsDatabase();
            UserPages.Children.Clear();
            UserPages.Children.Add(x);
        }

        private void btnOpenArchived_Click(object sender, RoutedEventArgs e)
        {
            ArchivedStudentRecord x = new ArchivedStudentRecord();
            UserPages.Children.Clear();
            UserPages.Children.Add(x);
        }
    }

    public class AttendanceViewModel
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Course { get; set; }
        public string Year { get; set; }
        public string Section { get; set; }
        public string Status { get; set; }
        public bool Archived { get; set; }
        public DateTime Date { get; set; }
        public string Time { get; set; }
        public string StudentId { get; set; }

        public AttendanceViewModel(Students_Attendance record)
        {
            Id = record.Id;
            Status = record.Status;
            Name = record.Name;
            Course = record.Course;
            Year = record.Year;
            Section = record.Section;
            Date = record.Date;
            Time = record.Time.ToString("T");
            StudentId = record.StudentId;
        }
    }
}
