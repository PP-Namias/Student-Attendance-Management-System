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
    /// Interaction logic for StudentsDatabase.xaml
    /// </summary>
    public partial class StudentsDatabase : UserControl
    {
        public StudentsDatabase()
        {
            InitializeComponent();
            LoadData();
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            // Any additional initialization if needed
        }

        private void LoadData()
        {
            try
            {
                using (var context = new AppDbContext())
                {
                    var studentRecords = context.Students
                                          .Where(record => !record.Archived)
                                          .ToList();

                    var studentViewModels = studentRecords
                                             .Select(record => new StudentViewModel(record))
                                             .ToList();

                    tblStudentRecords.ItemsSource = studentViewModels;
                    NumberOfLogs.Text = $"Number of records: {studentRecords.Count}";
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show($"An error occurred while loading data: {ex.Message}", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void btnSave_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                using (var context = new AppDbContext())
                {
                    var modifiedRecords = tblStudentRecords.ItemsSource as List<StudentViewModel>;
                    if (modifiedRecords != null)
                    {
                        foreach (var modifiedRecord in modifiedRecords)
                        {
                            var recordToUpdate = context.Students.Find(modifiedRecord.Id);
                            if (recordToUpdate != null)
                            {
                                recordToUpdate.Name = modifiedRecord.Name;
                                recordToUpdate.Course = modifiedRecord.Course;
                                recordToUpdate.Year = modifiedRecord.Year;
                                recordToUpdate.Section = modifiedRecord.Section;
                                recordToUpdate.StudentId = modifiedRecord.StudentId;
                                recordToUpdate.Archived = modifiedRecord.Archived;
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

        private void btnArchive_Click(object sender, RoutedEventArgs e)
        {
            var selectedRecord = tblStudentRecords.SelectedItem as StudentViewModel;
            if (selectedRecord != null)
            {
                try
                {
                    using (var context = new AppDbContext())
                    {
                        var recordToArchive = context.Students.Find(selectedRecord.Id);
                        if (recordToArchive != null)
                        {
                            recordToArchive.Archived = true;
                            context.SaveChanges();
                            MessageBox.Show("Record archived successfully.", "Success", MessageBoxButton.OK, MessageBoxImage.Information);
                        }
                    }
                    LoadData();
                }
                catch (Exception ex)
                {
                    MessageBox.Show($"An error occurred while archiving the record: {ex.Message}", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
            else
            {
                MessageBox.Show("Please select a record to archive.", "No Selection", MessageBoxButton.OK, MessageBoxImage.Warning);
            }
        }

        private void btnRefresh_Click(object sender, RoutedEventArgs e)
        {
            LoadData();
        }

        private void btnStudentDatabase_Click(object sender, RoutedEventArgs e)
        {
            StudentRecord x = new StudentRecord();
            UserPages.Children.Clear();
            UserPages.Children.Add(x);
        }

        public class StudentViewModel
        {
            public int Id { get; set; }
            public string Name { get; set; }
            public string Course { get; set; }
            public string Year { get; set; }
            public string Section { get; set; }
            public string StudentId { get; set; }
            public bool Archived { get; set; }

            public StudentViewModel(Students student)
            {
                Id = student.Id;
                Name = student.Name;
                Course = student.Course;
                Year = student.Year;
                Section = student.Section;
                StudentId = student.StudentId;
                Archived = student.Archived;
            }
        }

        private void btnOpenArchived_Click(object sender, RoutedEventArgs e)
        {
            ArchivedStudentsDatabase x = new ArchivedStudentsDatabase();
            UserPages.Children.Clear();
            UserPages.Children.Add(x);
        }
    }
}
