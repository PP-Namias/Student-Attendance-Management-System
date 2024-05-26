using StudentAttendanceManagementSystem.DbContexts;
using StudentAttendanceManagementSystem.Models;
using StudentAttendanceManagementSystem.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows;
using System.Windows.Input;

namespace StudentAttendanceManagementSystem
{
    /// <summary>
    /// Interaction logic for Window1.xaml
    /// </summary>
    public partial class Window1 : Window
    {
        AppDbContext appDbContext = new AppDbContext();

        List<string> check1 = new List<string>()
        {
            "!", "@", "#", "$", "%", "&","*","(",")"
        };

        public Window1()
        {
            InitializeComponent();
            appDbContext = new AppDbContext();
        }

        private void Border_MouseDown(object sender, MouseButtonEventArgs e)
        {

            if (e.LeftButton == MouseButtonState.Pressed)
            {
                DragMove();
                System.Diagnostics.Debug.Write("some action...");
            }
        }

        // Exit
        private void btnExit_Click(object sender, RoutedEventArgs e)
        {
            Application.Current.Shutdown();
        }

        // CheckBox 
        private void CheckBox_Checked(object sender, RoutedEventArgs e)
        {

        }

        public int RegisterUser(string username, string password, string phonenumber, string role)
        {
            //Must be at least 8 characters long
            //At least one number
            //At least one special character must be present. Special characters: !@#$%^&*()-+

            HashService hashService = new HashService();

            if (appDbContext.Users.Any(x => x.UserName == username))
            {
                return 1; // Username already exists
            }

            else if (password != txtConformPassword.Password)
            {
                return 2; // Passwords do not match
            }

            else if (phonenumber.Length <= 0)
            {
                return 5; // Enter Phone Number
            }

            else
            {
                var countV1 = 0;
                var countV2 = 0;
                var length = password.Length;
                if (length >= 8)
                {
                    foreach (var item in password)
                    {
                        var firstValidate = item == '!' || item == '@' || item == '#' || item == '$'
                            || item == '%' || item == '^' || item == '&' || item == '*' || item == '(' || item == ')';
                        var secondValidate = item == '1' || item == '2' || item == '3' || item == '4' || item == '5' || item == '6' || item == '7'
                            || item == '8' || item == '9' || item == '0';
                        if (firstValidate)
                        {
                            countV1++;
                        }
                        else if (secondValidate)
                        {
                            countV2++;
                        }

                        if (countV1 >= 1 && countV2 >= 1)
                        {
                            var user = new User()
                            {
                                UserName = username,
                                PhoneNumber = phonenumber,
                                PasswordHash = hashService.GetHash(password),
                                Role = role // Assign the role
                            };

                            appDbContext.Users.Add(user);
                            appDbContext.SaveChanges();
                            return 3; // Register to the database
                        }
                    }
                }
                return 4;
            }
        }

        private void btnRegister_Click(object sender, RoutedEventArgs e)
        {
            string role = cmbRole.Text; // Get the selected role from the ComboBox
            int result = RegisterUser(txtUsername.Text, txtPassword.Password, txtPhoneNumber.Text, role);
            if (result == 1)
            {
                MessageBox.Show("Username already exists.", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            else if (result == 2)
            {
                MessageBox.Show("Passwords do not match.", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            else if (result == 3)
            {
                MessageBox.Show("User registered successfully.", "Success", MessageBoxButton.OK, MessageBoxImage.Information);
                // Clear input fields after successful registration
                txtUsername.Clear();
                txtPassword.Clear();
                txtConformPassword.Clear();
                txtPhoneNumber.Clear();
            }
            else if (result == 4)
            {
                MessageBox.Show("Password must be at least 8 characters long and contain at least one special character and one number.", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            else if (result == 5)
            {
                MessageBox.Show("Please enter a phone number.", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void txtUsername_TextChanged(object sender, System.Windows.Controls.TextChangedEventArgs e)
        {

        }

        private void btnGoBack_Click(object sender, RoutedEventArgs e)
        {
            MainWindow mainWindow = new MainWindow();
            mainWindow.Show();
            this.Close();
        }

        private void btnMinimize_Click(object sender, RoutedEventArgs e)
        {
            this.WindowState = WindowState.Minimized;
        }
    }
}
