using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using System.Diagnostics;
using AForge.Video.DirectShow;
using AForge.Video;
using System.Drawing.Imaging;
using System.Drawing;
using System.IO;
using System.Threading;
using System.Windows.Media.Imaging;
using System.Windows.Media;
using System;
using System.Linq;
using System.Windows.Threading;
using ZXing;
using Color = System.Drawing.Color;
using StudentAttendanceManagementSystem.DbContexts;
using System.Xml.Linq;
using StudentAttendanceManagementSystem.Models;


namespace StudentAttendanceManagementSystem
{
    /// <summary>
    /// Interaction logic for BarcodeScanningInterface.xaml
    /// </summary>
    public partial class BarcodeScanningInterface : UserControl
    {
        AppDbContext appDbContext = new AppDbContext();

        FilterInfoCollection videoDevices;
        private VideoCaptureDevice videoDevice;
        private VideoCapabilities[] videoCapabilities;
        BarcodeReader barcodeReader = new BarcodeReader();
        int decodedCount = 0;
        bool showFrames = false;
        int camCount, currentCam = 0;
        int frameCounter = 0;

        public BarcodeScanningInterface()
        {
            InitializeComponent();
            appDbContext = new AppDbContext();
            // WelcomeMessage.Text = "Welcome " + LoggedInUser.Instance.Info.Name + "!";
        }

        private void StartStopButton_Click(object sender, RoutedEventArgs e)
        {
            onOff();
        }

        private void Clear(object sender, RoutedEventArgs e)
        {
            QRTextBlock.Text = "Waiting for Bar/QR Code...";
            QRCounterTextBlock.Text = "BAR/QR codes decoded: 0";

            txtName.Text = "Name";
            txtStudentId.Text = "Student ID";
            txtClass.Text = "Year & Section";
            txtDate.Text = "Date";
            txtTime.Text = "Time";
            imgProfile.Source = new BitmapImage(new Uri("pack://application:,,,/Images/profile.png"));
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            var window = Window.GetWindow(this);
            window.KeyDown += HandleKeyPress;
            refreshCam(currentCam);
        }

        void refreshCam(int camNumber)
        {
            videoDevices = new FilterInfoCollection(FilterCategory.VideoInputDevice);
            camCount = videoDevices.Count;
            videoDevice = new VideoCaptureDevice(videoDevices[camNumber].MonikerString);
            camsLabel.Content = "Camera" + (camNumber + 1).ToString() + "/" + videoDevices.Count.ToString() + ": " + videoDevices[camNumber].Name;
            videoCapabilities = videoDevice.VideoCapabilities;
            videoDevice.VideoResolution = (from VideoCapabilities vidcap in videoCapabilities where (vidcap.FrameSize.Height >= 600 && vidcap.FrameSize.Width >= 800) orderby vidcap.FrameSize.Height descending select vidcap).ToList()[0];
        }

        void onOff()
        {
            if (!showFrames)
            {
                StartStopButton.Background = new SolidColorBrush(System.Windows.Media.Color.FromRgb(30, 144, 255));
                showFrames = !showFrames;
                refreshCam(currentCam);
                videoDevice.NewFrame += VideoDevice_NewFrame;
                videoDevice.Start();


                StartStop.Kind = MaterialDesignThemes.Wpf.PackIconKind.Stop;
                StartStopButton.Background = new SolidColorBrush((System.Windows.Media.Color)System.Windows.Media.ColorConverter.ConvertFromString("#D5CEA3"));
                StartStopButton.Foreground = new SolidColorBrush((System.Windows.Media.Color)System.Windows.Media.ColorConverter.ConvertFromString("#3C2A21"));
            }
            else
            {
                StartStopButton.Background = new SolidColorBrush(System.Windows.Media.Color.FromRgb(60, 42, 33));
                showFrames = !showFrames;
                videoDevice.NewFrame -= VideoDevice_NewFrame;
                videoDevice.SignalToStop();
                videoDevice = null;

                StartStop.Kind = MaterialDesignThemes.Wpf.PackIconKind.Play;
                StartStopButton.Background = new SolidColorBrush((System.Windows.Media.Color)System.Windows.Media.ColorConverter.ConvertFromString("#3C2A21"));
                StartStopButton.Foreground = new SolidColorBrush((System.Windows.Media.Color)System.Windows.Media.ColorConverter.ConvertFromString("#D5CEA3"));
            }
        }

        private void VideoDevice_NewFrame(object sender, NewFrameEventArgs eventArgs)
        {
            decodeframe(eventArgs.Frame);
            BitmapImage bi = new BitmapImage();

            bi = BitmapToImageSource(eventArgs.Frame);
            bi.Freeze();
            var picShow = Dispatcher.Invoke(new ThreadStart(delegate { showImage(bi); }));
        }



        private void HandleKeyPress(object sender, KeyEventArgs e)
        {
            if (e.Key == Key.Space)
            {
                onOff();
            }
            if (e.Key == Key.S && (Keyboard.Modifiers == ModifierKeys.Shift))
            {
                switchCam();
            }
        }

        BitmapImage BitmapToImageSource(Bitmap bitmap)
        {
            using (MemoryStream memory = new MemoryStream())
            {
                bitmap.Save(memory, System.Drawing.Imaging.ImageFormat.Bmp);
                memory.Position = 0;
                BitmapImage bitmapimage = new BitmapImage();
                bitmapimage.BeginInit();
                bitmapimage.StreamSource = memory;
                bitmapimage.CacheOption = BitmapCacheOption.OnLoad;
                bitmapimage.EndInit();
                return bitmapimage;
            }
        }

        bool showImage(BitmapImage bi)
        {
            videoFrame.Source = bi;
            return true;
        }
        void decodeframe(Bitmap img)
        {
            var barcodeResult = barcodeReader.Decode(img);
            if (barcodeResult != null)
            {
                DateTime currentDateTime = DateTime.Now;

                decodedCount++;
                Dispatcher.Invoke(() => {
                    QRTextBlock.Text = $"{barcodeResult.BarcodeFormat} {barcodeResult.Text}";
                    QRCounterTextBlock.Text = $"BAR/QR codes decoded: {decodedCount}";
                });

                using (var appDbContext = new StudentAttendanceManagementSystem.DbContexts.AppDbContext())
                {
                    var student = appDbContext.Students.SingleOrDefault(s => s.StudentId == barcodeResult.Text);
                    if (student != null)
                    {
                        Dispatcher.Invoke(() => {
                            txtName.Text      = student.Name;
                            txtStudentId.Text = student.StudentId;
                            txtClass.Text     = student.Course + "-" + student.Year + student.Section ;

                            txtCourse.Text    = student.Course;
                            txtYear.Text      = student.Year;
                            txtSection.Text   = student.Section;

                            //imgProfile.Source = new BitmapImage(new Uri($"pack://application:,,,/Images/{student.ProfileImage}"));

                            txtTime.Text = currentDateTime.ToString("h:mm tt");
                            txtDate.Text = currentDateTime.ToString("MMM dd, yyyy");
                            imgProfile.Source = new BitmapImage(new Uri("pack://application:,,,/Images/" + student.StudentId + ".png"));

                        });
                    }
                    else
                    {
                        Dispatcher.Invoke(() => {
                            txtName.Text = "Unknown Student";
                            txtStudentId.Text = "Unknown ID";
                            txtClass.Text = "Unknown Class";
                            imgProfile.Source = new BitmapImage(new Uri("pack://application:,,,/Images/profile.png"));
                        });
                    }
                }
            }
        }

        private void helpButton_Click(object sender, RoutedEventArgs e)
        {
            string message = "Bar-code Compatible formats : UPC-A, UPC-E, EAN-8, QR, ITF, EAN-13, RSS-14, Data, Matrix, Codabar, PDF, 417, Aztec, PDF417" + Environment.NewLine + Environment.NewLine + "Controls:" + Environment.NewLine + "Start/Stop: Start and stop the video stream." + Environment.NewLine + "Switch Camera: Switch between cameras available in the system." + Environment.NewLine + "Record: record frames into c:\\frames as pngs." + Environment.NewLine + Environment.NewLine + "Keyboard Controls:" + Environment.NewLine + "Space: Start and stop the video stream." + Environment.NewLine + "Shift+S: Switch between cameras available in the system.";
            string caption = "About";
            MessageBoxButton buttons = MessageBoxButton.OK;
            MessageBoxImage icon = MessageBoxImage.Asterisk;
            MessageBoxResult defaultResult = MessageBoxResult.OK;
            MessageBoxOptions options = MessageBoxOptions.None;
            MessageBoxResult result = MessageBox.Show(message, caption, buttons, icon, defaultResult, options);
        }

        private void camSwitchButton_Click(object sender, RoutedEventArgs e)
        {
            switchCam();
        }

        void switchCam()
        {
            if (videoDevice != null)
            {
                if (videoDevice.IsRunning)
                {
                    onOff();
                    currentCam = (currentCam + 1) % camCount;
                    refreshCam(currentCam);
                    onOff();
                }
                else
                {
                    currentCam = (currentCam + 1) % camCount;
                    refreshCam(currentCam);
                }
            }
            else
            {
                currentCam = (currentCam + 1) % camCount;
                refreshCam(currentCam);
            }
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {

        }

        private void btnClear_Click(object sender, RoutedEventArgs e)
        {
            Clear(sender, e);
        }

        private void btnConfirm_Click(object sender, RoutedEventArgs e)
        {
            var student = appDbContext.Students.SingleOrDefault(s => s.StudentId == txtStudentId.Text);
            if (student != null)
            {
                Dispatcher.Invoke(() => {

                    var studentAttendance = new Students_Attendance()
                    {
                        Name = txtName.Text,
                        Course = txtCourse.Text,
                        Year = txtYear.Text,
                        Section = txtSection.Text,
                        StudentId = txtStudentId.Text,
                        Status = "Present",
                        Archived = false,
                        Date = System.DateTime.Today,
                        Time = System.DateTime.Now
                    };

                    appDbContext.Attendance.Add(studentAttendance);
                    appDbContext.SaveStudentAttendance(studentAttendance);

                    MessageBox.Show("Attendance recorded successfully", "Success", MessageBoxButton.OK, MessageBoxImage.Information);
                });
            }
            else if (student == null)
            {
                Dispatcher.Invoke(() =>
                {
                    MessageBox.Show("Student not found", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
                });
            }
            else
            {
                Dispatcher.Invoke(() => {
                    MessageBox.Show("Student not found [ ERROR 101 ]", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
                });
            }




            Clear(sender, e);

        }

    }
}
