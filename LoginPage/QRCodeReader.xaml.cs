using System.Linq;
using System.Windows;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Threading;
using AForge.Video;
using AForge.Video.DirectShow;
using ZXing;
using System.Drawing;
using System.IO;
using System.Threading;
using System;
using System.Drawing.Imaging;

namespace LoginPage
{
    /// <summary>
    /// Interaction logic for QRCodeReader.xaml
    /// </summary>
    public partial class QRCodeReader : Window
    {
        FilterInfoCollection videoDevices;
        private VideoCaptureDevice videoDevice;
        private VideoCapabilities[] videoCapabilities;
        BarcodeReader barcodeReader = new BarcodeReader();
        int decodedCount = 0;
        bool showFrames = false;
        int camCount, currentCam = 0;
        int frameCounter = 0;
        bool record = false;

        public QRCodeReader()
        {
            InitializeComponent();
        }

        private void StartStopButton_Click(object sender, RoutedEventArgs e)
        {
            onOff();
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
                recordButton.Opacity = 1.00;
                StartStopButton.Background = new SolidColorBrush(System.Windows.Media.Color.FromRgb(58, 175, 185));
                showFrames = !showFrames;
                refreshCam(currentCam);
                videoDevice.NewFrame += VideoDevice_NewFrame;
                videoDevice.Start();
            }
            else
            {
                recordButton.Opacity = 0.25;
                StartStopButton.Background = new SolidColorBrush(System.Windows.Media.Color.FromRgb(9, 58, 62));
                showFrames = !showFrames;
                videoDevice.NewFrame -= VideoDevice_NewFrame;
                videoDevice.SignalToStop();
                videoDevice = null;
            }
        }

        private void VideoDevice_NewFrame(object sender, NewFrameEventArgs eventArgs)
        {
            decodeframe(eventArgs.Frame);
            string picFile = @".\frame_" + frameCounter.ToString() + "_" + DateTime.Now.ToString(@"MM_dd_yyyy_HH_mm") + ".png";
            Dispatcher.Invoke(new ThreadStart(delegate { FrameCounterTextBlock.Text = "frames recorded: " + frameCounter.ToString(); }));
            BitmapImage bi = new BitmapImage();
            if (record)
            {
                frameCounter++;
                eventArgs.Frame.Save(picFile, ImageFormat.Png);
            }
            bi = BitmapToImageSource(eventArgs.Frame);
            bi.Freeze();
            var picShow = Dispatcher.Invoke(new ThreadStart(delegate { showImage(bi); }));
        }



        private void HandleKeyPress(object sender, KeyEventArgs e)
        {
            if (e.Key == Key.Escape)
            {
                System.Environment.Exit(1);
            }
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
                decodedCount++;
                Dispatcher.Invoke(new ThreadStart(delegate { QRTextBlock.Text = barcodeResult.BarcodeFormat.ToString() + " " + barcodeResult.Text; }));
                Dispatcher.Invoke(new ThreadStart(delegate { QRCounterTextBlock.Text = "BAR/QR codes decoded: " + decodedCount.ToString(); }));


                // Create an instance of ValidationForm
                // Result validationForm = new Result();
                // validationForm.ValidateBarcode(barcodeResult.Text);
                // validationForm.Show();

                bool result = false;

                if (result == false)
                {
                    // Create an instance of ValidationForm
                    //Result Result = new Result();
                    //Result.Show();

                    //result = true;
                }



                // barcodeResult.Text
                // Result Result = new Result();
                // Result.Show();
                // this.Close();
            }
        }

        private void helpButton_Click(object sender, RoutedEventArgs e)
        {
            string message = "Bar-code Compatible formats : UPC-A, UPC-E, EAN-8, QR, ITF, EAN-13, RSS-14, Data, Matrix, Codabar, PDF, 417, Aztec, PDF417" + Environment.NewLine + Environment.NewLine + "Controls:" + Environment.NewLine + "Start/Stop: Start and stop the video stream." + Environment.NewLine + "Switch Camera: Switch between cameras available in the system." + Environment.NewLine + "Record: record frames into c:\\frames as pngs." + Environment.NewLine + Environment.NewLine + "Keyboard Controls:" + Environment.NewLine + "Space: Start and stop the video stream." + Environment.NewLine + "Shift+S: Switch between cameras available in the system." + Environment.NewLine + "ESC: Exit application.";
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

        private void recordButton_Click(object sender, RoutedEventArgs e)
        {
            record = !record;
        }

        private void btnMinimize_Click(object sender, RoutedEventArgs e)
        {
            this.WindowState = WindowState.Minimized;
        }

        private void btnExit_Click(object sender, RoutedEventArgs e)
        {
            Application.Current.Shutdown();
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


        private void btnRefresh_Click(object sender, RoutedEventArgs e)
        {
            DateTime currentDateTime = DateTime.Now;

            txtTime.Text = currentDateTime.ToString("T");
            txtDate.Text = currentDateTime.ToString("MMM dd, yyyy");
        }

    }
}
