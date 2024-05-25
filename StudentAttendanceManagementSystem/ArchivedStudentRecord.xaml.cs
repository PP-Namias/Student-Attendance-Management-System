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
    /// Interaction logic for ArchivedStudentRecord.xaml
    /// </summary>
    public partial class ArchivedStudentRecord : UserControl
    {
        public ArchivedStudentRecord()
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
                    var archivedAttendanceRecords = context.Attendance
                                                      .Where(record => record.Archived)
                                                      .ToList();

                    var archivedAttendanceViewModels = archivedAttendanceRecords
                                                         .Select(record => new ArchivedAttendanceViewModel(record))
                                                         .ToList();

                    tblStudentRecords.ItemsSource = archivedAttendanceViewModels;
                    NumberOfLogs.Text = $"Number of records: {archivedAttendanceRecords.Count}";
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show($"An error occurred while loading data: {ex.Message}", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void btnArchive_Click(object sender, RoutedEventArgs e)
        {
            var selectedRecord = tblStudentRecords.SelectedItem as ArchivedAttendanceViewModel;
            if (selectedRecord != null)
            {
                try
                {
                    using (var context = new AppDbContext())
                    {
                        var recordToArchive = context.Attendance.Find(selectedRecord.Id);
                        if (recordToArchive != null)
                        {
                            recordToArchive.Archived = false;
                            context.SaveChanges();
                            MessageBox.Show("Record unarchived successfully.", "Success", MessageBoxButton.OK, MessageBoxImage.Information);
                        }
                    }
                    LoadData();
                }
                catch (Exception ex)
                {
                    MessageBox.Show($"An error occurred while unarchiving record: {ex.Message}", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
            else
            {
                MessageBox.Show("Please select a record to unarchive.", "No Selection", MessageBoxButton.OK, MessageBoxImage.Warning);
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
                        LoadData();
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show($"An error occurred while saving changes: {ex.Message}", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void btnOpenArchived_Click(object sender, RoutedEventArgs e)
        {
            StudentRecord x = new StudentRecord();
            UserPages.Children.Clear();
            UserPages.Children.Add(x);
        }
    }
    public class ArchivedAttendanceViewModel
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

        public ArchivedAttendanceViewModel(Students_Attendance record)
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
