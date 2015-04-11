using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Interop;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Media.Animation;
using System.Windows.Shapes;

namespace ClusterExperiment
{
    /// <summary>
    /// Interaction logic for Progress.xaml
    /// </summary>
    public partial class Progress : Window
    {
        private ProgressWorker pw = null;
        public ProgressBar pbar = null;
        public delegate void Work(object[] args);

        public Progress(Window owner, int total, String op_name, DoWorkEventHandler eh)
        {
            InitializeComponent();
            this.Owner = owner;

            Title = "Busy ...";
            
            pw = new ProgressWorker(this, 100);
                                                
            DoubleAnimation a = new DoubleAnimation(0.0, 100.0, new Duration(TimeSpan.FromSeconds(1)));
            a.RepeatBehavior = RepeatBehavior.Forever;
            a.AutoReverse = true;

            RowDefinition r = new RowDefinition();
            outerGrid.RowDefinitions.Add(r);
            r.Height = new GridLength(26);
            ColumnDefinition c1 = new ColumnDefinition();
            ColumnDefinition c2 = new ColumnDefinition();
            c1.Width = new GridLength(170);
            c2.Width = new GridLength(75);
            outerGrid.ColumnDefinitions.Add(c1);
            outerGrid.ColumnDefinitions.Add(c2);

            Label l = new Label();
            l.Content = op_name + " ...";
            l.Height = 26;
            Grid.SetRow(l, 0);
            Grid.SetColumn(l, 0);
            outerGrid.Children.Add(l);

            pbar = new ProgressBar();
            pbar.Height = 26;
            pbar.Width = 75;
            pbar.Minimum = 0.0;
            pbar.Maximum = 100.0;
            Grid.SetRow(pbar, outerGrid.RowDefinitions.Count() - 1);
            Grid.SetColumn(pbar, 1);
            outerGrid.Children.Add(pbar);

            pw.DoWork += new DoWorkEventHandler(MyDoWork);
            pw.RunWorkerCompleted += new RunWorkerCompletedEventHandler(MyRunWorkerCompleted);
            pw.ProgressChanged += new ProgressChangedEventHandler(MyProgressChanged);
            
            pw.DoWork += eh;            
        }

        public void Go()
        {
            pw.RunWorkerAsync();
            ShowDialog();
        }

        public Boolean IsBusy { get { return pw.IsBusy; } }

        private void MyDoWork(object sender, DoWorkEventArgs e)
        {
            ProgressWorker w = (ProgressWorker)sender;
            if (w.WorkerReportsProgress) w.ReportProgress(0);            
        }

        private void MyProgressChanged(object sender, ProgressChangedEventArgs e)
        {
            ProgressWorker w = (ProgressWorker)sender;
            pbar.BeginAnimation(System.Windows.Controls.ProgressBar.ValueProperty, null);
            pbar.Value = e.ProgressPercentage;
        }

        private void MyRunWorkerCompleted(object sender, RunWorkerCompletedEventArgs e)
        {
            ProgressWorker w = (ProgressWorker)sender;
            // if (w.WorkerReportsProgress) w.ReportProgress(100);

            if (e.Error != null)
                System.Windows.MessageBox.Show(this, e.Error.ToString(), "Error",
                    System.Windows.MessageBoxButton.OK,
                    System.Windows.MessageBoxImage.Error,
                    System.Windows.MessageBoxResult.None);
            else if (e.Cancelled)
                System.Windows.MessageBox.Show(this, "Operation cancelled.", "Information");

            if (IsVisible)
                DialogResult = true;

            pw = null;
            Close();
        }

        private void Window_Closing(object sender, CancelEventArgs e)
        {
            if (pw != null)
            {
                pw.CancelAsync();
                e.Cancel = true;
            }
        }
    }
}
