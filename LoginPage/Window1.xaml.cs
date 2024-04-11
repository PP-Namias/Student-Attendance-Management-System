using LoginPage.DbContexts;
using LoginPage.Models;
using LoginPage.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows;
using System.Windows.Input;

namespace LoginPage
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

        // X niki yani chiqish
        private void btnExit_Click(object sender, RoutedEventArgs e)
        {
            Application.Current.Shutdown();
        }

        // Ptichka 
        private void CheckBox_Checked(object sender, RoutedEventArgs e)
        {

        }


        public int RegisterUser(string username, string password)
        {

            //Kamida 8 ta belgidan iborat bo’lishi kerak;
            //Kamida bitta raqam qatnashishi kerak;
            //Kamida bitta maxsus belgi qatnashishi kerak. Maxsus belgilar: !@#$%^&*()-+

            HashService hashService = new HashService();

            if (appDbContext.Users.Any(x => x.UserName == username))
            {
                return 1; // Register database da bor
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
                                PasswordHash = hashService.GetHash(password),
                            };

                            appDbContext.Users.Add(user);
                            appDbContext.SaveChanges();
                            return 3;// Register to the database
                        }
                    }
                }
                return 4;

  

            }
        }

        private void btnRegister_Click(object sender, RoutedEventArgs e)
        {
            if (RegisterUser(txtUsername.Text, txtPassword.Password) == 1)
            {
                MessageBox.Show("Username is exist", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            else if (RegisterUser(txtUsername.Text, txtPassword.Password) == 4)
            {
                MessageBox.Show("Password is wrong", "Please enter Login or Password", MessageBoxButton.OK, MessageBoxImage.Warning);
            }
            else
            {
                MessageBox.Show("Register Successfully", "Congratulations", MessageBoxButton.OK, MessageBoxImage.Information);
            }


        }

        //Buni ham bilmadim
        private void txtUsername_TextChanged(object sender, System.Windows.Controls.TextChangedEventArgs e)
        {

        }

        private void btnGoBack_Click(object sender, RoutedEventArgs e)
        {
            MainWindow mainWindow = new MainWindow();
            mainWindow.Show();
            this.Close();
        }

    }
}
