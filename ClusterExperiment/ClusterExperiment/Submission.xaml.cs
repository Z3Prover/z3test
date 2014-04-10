using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
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
using Microsoft.Hpc.Scheduler;
using Microsoft.Hpc.Scheduler.Properties;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.ComponentModel;
using Microsoft.Win32;

using SubmissionLib;

namespace ClusterExperiment
{
    /// <summary>
    /// Interaction logic for Submission.xaml
    /// </summary>
    public partial class Submission : Window
    {
        public Exception lastError = null;
        public SqlConnection returnSQL;

        private Dictionary<int, SubmissionWorker> workers = new Dictionary<int, SubmissionWorker>();
        private Dictionary<int, ProgressBar> pbars = new Dictionary<int, ProgressBar>();
        private int binId = 0;
        private bool haveBinId = false;

        private bool createJobgroup = false;
        private string jobgroupName = null;
        private string db = null;
        private string username = null;
        private string categories = null;

        public Submission(string db) // Connect...
        {
            InitializeComponent();
            Mouse.OverrideCursor = System.Windows.Input.Cursors.Wait;
            Title = "Connecting...";

            WindowInteropHelper helper = new WindowInteropHelper(this);
            SubmissionWorker w = new SubmissionWorker(helper.Handle, workers.Count());
            w.DoWork += new DoWorkEventHandler(worker_DoWork);
            w.ProgressChanged += new ProgressChangedEventHandler(worker_ProgressChanged);
            w.RunWorkerCompleted += new RunWorkerCompletedEventHandler(worker_RunWorkerCompleted);
            w.WorkerReportsProgress = true;
            w.WorkerSupportsCancellation = false;

            Mouse.OverrideCursor = System.Windows.Input.Cursors.Wait;
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
            l.Content = "Connecting...";
            l.Height = 26;
            Grid.SetRow(l, 0);
            Grid.SetColumn(l, 0);
            outerGrid.Children.Add(l);

            ProgressBar p = new ProgressBar();
            p.Height = 26;
            p.Width = 75;
            Grid.SetRow(p, outerGrid.RowDefinitions.Count() - 1);
            Grid.SetColumn(p, 1);
            outerGrid.Children.Add(p);

            returnSQL = null;
            String[] args = { "Connect", db };
            workers.Add(workers.Count(), w);
            w.RunWorkerAsync(args);
        }

        public Submission(SqlConnection sql) // Disconnect ...
        {
            InitializeComponent();
            Mouse.OverrideCursor = System.Windows.Input.Cursors.Wait;
            Title = "Disconnecting...";

            WindowInteropHelper helper = new WindowInteropHelper(this);
            SubmissionWorker w = new SubmissionWorker(helper.Handle, workers.Count());
            w.DoWork += new DoWorkEventHandler(worker_DoWork);
            w.ProgressChanged += new ProgressChangedEventHandler(worker_ProgressChanged);
            w.RunWorkerCompleted += new RunWorkerCompletedEventHandler(worker_RunWorkerCompleted);
            w.WorkerReportsProgress = true;
            w.WorkerSupportsCancellation = false;

            Mouse.OverrideCursor = System.Windows.Input.Cursors.Wait;
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
            l.Content = "Disconnecting...";
            l.Height = 26;
            Grid.SetRow(l, 0);
            Grid.SetColumn(l, 0);
            outerGrid.Children.Add(l);

            ProgressBar p = new ProgressBar();
            p.Height = 26;
            p.Width = 75;
            Grid.SetRow(p, outerGrid.RowDefinitions.Count() - 1);
            Grid.SetColumn(p, 1);
            outerGrid.Children.Add(p);

            pbars.Add(w.id, p);
            returnSQL = null;
            Object[] args = { "Disconnect", sql };
            workers.Add(workers.Count(), w);
            w.RunWorkerAsync(args);
        }

        // Submit a job...
        public Submission(string db, string categories, string sharedDir, string memout, string timeout, string executor,
                          string executable, string parameters, string cluster, string nodegroup, string locality, string username,
                          int priority, string extension, string note, bool parametricity,
                          string pFrom, string pTo, string pStep,
                          bool createGroup, string groupName)
        {
            InitializeComponent();
            Mouse.OverrideCursor = System.Windows.Input.Cursors.Wait;
            Title = "Submitting...";

            this.db = db;
            this.username = username;
            this.categories = categories;

            ColumnDefinition c1 = new ColumnDefinition();
            ColumnDefinition c2 = new ColumnDefinition();
            c1.Width = new GridLength(170);
            c2.Width = new GridLength(75);
            outerGrid.ColumnDefinitions.Add(c1);
            outerGrid.ColumnDefinitions.Add(c2);

            uploadBinary(db, executable);

            if (parametricity)
            {
                Int64 from = Convert.ToInt64(pFrom);
                Int64 to = Convert.ToInt64(pTo);
                Int64 step = Convert.ToInt64(pStep);

                Int64 total = ((to - from) / step) + 1;

                this.createJobgroup = createGroup;
                this.jobgroupName = groupName;

                int count = 1;
                for (Int64 i = from; i <= to; i += step, count++)
                {
                    submit(db, categories, sharedDir, memout, timeout, executor,
                           parameters.Replace("{0}", i.ToString()),
                           cluster, nodegroup, locality, username, priority, extension,
                           "(" + count.ToString() + "/" + total.ToString() + ") " + note);
                }
            }
            else
                submit(db, categories, sharedDir, memout, timeout, executor, parameters,
                     cluster, nodegroup, locality, username, priority, extension, note);
        }

        // Submit a job...
        public Submission(string db, string categories, string sharedDir, string memout, string timeout, string executor,
                          string executable, string parameters, string cluster, string nodegroup, string locality, string username,
                          int priority, string extension, string note)
        {
            InitializeComponent();
            Mouse.OverrideCursor = System.Windows.Input.Cursors.Wait;
            Title = "Submitting...";

            ColumnDefinition c1 = new ColumnDefinition();
            ColumnDefinition c2 = new ColumnDefinition();
            c1.Width = new GridLength(170);
            c2.Width = new GridLength(75);
            outerGrid.ColumnDefinitions.Add(c1);
            outerGrid.ColumnDefinitions.Add(c2);

            uploadBinary(db, executable);
            submit(db, categories, sharedDir, memout, timeout, executor, parameters,
                   cluster, nodegroup, locality, username, priority, extension, note);
        }

        // Copy a job...
        public Submission(string DB, string backupDB, Int32Collection jobs, bool move = false)
        {
            InitializeComponent();
            Mouse.OverrideCursor = System.Windows.Input.Cursors.Wait;
            Title = "Copying...";

            ColumnDefinition c1 = new ColumnDefinition();
            ColumnDefinition c2 = new ColumnDefinition();
            c1.Width = new GridLength(170);
            c2.Width = new GridLength(75);
            outerGrid.ColumnDefinitions.Add(c1);
            outerGrid.ColumnDefinitions.Add(c2);

            workers.Clear();

            Int32Collection.Enumerator e = jobs.GetEnumerator();
            while (e.MoveNext())
            {
                int jobID = e.Current;

                WindowInteropHelper helper = new WindowInteropHelper(this);
                SubmissionWorker w = new SubmissionWorker(helper.Handle, workers.Count());
                w.DoWork += new DoWorkEventHandler(worker_DoWork);
                w.ProgressChanged += new ProgressChangedEventHandler(worker_ProgressChanged);
                w.RunWorkerCompleted += new RunWorkerCompletedEventHandler(worker_RunWorkerCompleted);
                w.WorkerReportsProgress = true;
                w.WorkerSupportsCancellation = false;

                RowDefinition r = new RowDefinition();
                outerGrid.RowDefinitions.Add(r);
                r.Height = new GridLength(26);
                Label l = new Label();
                l.Content = "Copying Job #" + jobID.ToString() + "...";
                l.Height = 26;
                Grid.SetRow(l, outerGrid.RowDefinitions.Count() - 1);
                Grid.SetColumn(l, 0);
                outerGrid.Children.Add(l);

                ProgressBar p = new ProgressBar();
                p.Height = 26;
                p.Width = 75;
                Grid.SetRow(p, outerGrid.RowDefinitions.Count() - 1);
                Grid.SetColumn(p, 1);
                outerGrid.Children.Add(p);

                pbars.Add(w.id, p);
                String[] args = { "Copy", DB, backupDB, jobID.ToString(), move.ToString() };
                workers.Add(workers.Count(), w);
                w.RunWorkerAsync(args);
            }

            Mouse.OverrideCursor = null;
        }


        private void submit(string db, string categories, string sharedDir, string memout, string timeout, string executor,
                            string parameters, string cluster, string nodegroup, string locality, string username,
                            int priority, string extension, string note)
        {
            string[] cats = categories.Split(',');
            foreach (string category in cats)
            {
                WindowInteropHelper helper = new WindowInteropHelper(this);
                SubmissionWorker w = new SubmissionWorker(helper.Handle, workers.Count());
                w.DoWork += new DoWorkEventHandler(worker_DoWork);
                w.ProgressChanged += new ProgressChangedEventHandler(worker_ProgressChanged);
                w.RunWorkerCompleted += new RunWorkerCompletedEventHandler(worker_RunWorkerCompleted);
                w.WorkerReportsProgress = true;
                w.WorkerSupportsCancellation = false;

                RowDefinition r = new RowDefinition();
                outerGrid.RowDefinitions.Add(r);
                r.Height = new GridLength(26);
                Label l = new Label();
                l.Content = category.Replace("_", "__");
                l.Height = 26;
                Grid.SetRow(l, outerGrid.RowDefinitions.Count() - 1);
                Grid.SetColumn(l, 0);
                outerGrid.Children.Add(l);

                ProgressBar p = new ProgressBar();
                p.Height = 26;
                p.Width = 75;
                Grid.SetRow(p, outerGrid.RowDefinitions.Count() - 1);
                Grid.SetColumn(p, 1);
                outerGrid.Children.Add(p);

                pbars.Add(w.id, p);
                Object[] args = { "Submit", db, category, sharedDir, memout, timeout, executor,
                          parameters, cluster, nodegroup, locality, username, priority, extension, note };

                workers.Add(workers.Count(), w);
                w.RunWorkerAsync(args);
            }
        }

        private void uploadBinary(string db, string executable)
        {
            haveBinId = false;

            WindowInteropHelper helper = new WindowInteropHelper(this);
            SubmissionWorker w = new SubmissionWorker(helper.Handle, workers.Count());
            w.DoWork += new DoWorkEventHandler(worker_DoWork);
            w.ProgressChanged += new ProgressChangedEventHandler(worker_ProgressChanged);
            w.RunWorkerCompleted += new RunWorkerCompletedEventHandler(worker_RunWorkerCompleted);
            w.WorkerReportsProgress = true;
            w.WorkerSupportsCancellation = false;

            RowDefinition row = new RowDefinition();
            outerGrid.RowDefinitions.Add(row);
            row.Height = new GridLength(26);
            Label l = new Label();
            l.Content = "Upload binary...";
            l.Height = 26;
            Grid.SetRow(l, outerGrid.RowDefinitions.Count() - 1);
            Grid.SetColumn(l, 0);
            outerGrid.Children.Add(l);

            ProgressBar p = new ProgressBar();
            p.Height = 26;
            p.Width = 75;
            Grid.SetRow(p, outerGrid.RowDefinitions.Count() - 1);
            Grid.SetColumn(p, 1);
            outerGrid.Children.Add(p);

            DoubleAnimation a = new DoubleAnimation(0.0, 100.0, new Duration(TimeSpan.FromSeconds(1)));
            a.RepeatBehavior = RepeatBehavior.Forever;
            a.AutoReverse = true;
            p.BeginAnimation(System.Windows.Controls.ProgressBar.ValueProperty, a);

            pbars.Add(w.id, p);
            Object[] args = { "Upload", db, executable };
            workers.Add(w.id, w);
            w.RunWorkerAsync(args);
        }

        private void worker_RunWorkerCompleted(object sender, RunWorkerCompletedEventArgs e)
        {
            if (e.Error != null)
                System.Windows.Forms.MessageBox.Show(e.Error.ToString(), "Error", System.Windows.Forms.MessageBoxButtons.OK, System.Windows.Forms.MessageBoxIcon.Error);
            else if (e.Cancelled)
                System.Windows.Forms.MessageBox.Show("Operation cancelled.", "Information");

            bool busy = false;
            foreach (KeyValuePair<int, SubmissionWorker> q in workers)
                if (q.Value.IsBusy)
                {
                    busy = true;
                    break;
                }

            if (!busy)
            {
                if (createJobgroup)
                {
                    SqlConnection sql = new SqlConnection(db);
                    sql.Open();

                    string[] cats = categories.Split(',');
                    foreach (string cat in cats)
                    {
                        SqlCommand cmd = new SqlCommand("INSERT INTO JobGroups (Name,Creator,Category,Note) VALUES (" +
                                         "'" + jobgroupName + "'," +
                                         "'" + username + "'," +
                                         "'" + cat + "'," +
                                         "''); SELECT SCOPE_IDENTITY() as NewID;", sql);
                        SqlDataReader r = cmd.ExecuteReader();
                        int gid = 0;
                        if (r.Read())
                            gid = (int)r[0];
                        else
                        {
                            System.Windows.Forms.MessageBox.Show("Jobgroup creation failed.", "Error", System.Windows.Forms.MessageBoxButtons.OK, System.Windows.Forms.MessageBoxIcon.Error);
                            r.Close();
                            goto JGCF;
                        }
                        r.Close();

                        foreach (KeyValuePair<int, SubmissionWorker> q in workers)
                            if (q.Value.haveJobId && q.Value.cat == cat)
                            {
                                cmd = new SqlCommand("INSERT INTO JobGroupData (JobID,GroupID) VALUES (" + q.Value.JobId + "," + gid + ");", sql);
                                cmd.ExecuteNonQuery();
                            }
                    }
                }

            JGCF:
                if (this.IsVisible)
                    DialogResult = true;
                Mouse.OverrideCursor = null;
                Close();
            }
        }

        private void worker_ProgressChanged(object sender, ProgressChangedEventArgs e)
        {
            SubmissionWorker w = (SubmissionWorker)sender;
            pbars[w.id].BeginAnimation(System.Windows.Controls.ProgressBar.ValueProperty, null);
            pbars[w.id].Value = e.ProgressPercentage;
        }

        private void worker_DoWork(object sender, DoWorkEventArgs e)
        {
            SubmissionWorker w = (SubmissionWorker)sender;
            Object[] args = (Object[])e.Argument;

            string cmd = (string)args[0];

            try
            {
                if (cmd == "Connect")
                {
                    returnSQL = w.Connect((string)args[1]);
                }
                else if (cmd == "Disconnect")
                {
                    w.Disconnect((SqlConnection)args[1]);
                }
                else if (cmd == "Upload")
                {
                    w.UploadBinary((string)args[1], (string)args[2], ref haveBinId, ref binId);
                }
                else if (cmd == "Submit")
                {
                    //int jobs =
                    w.SubmitJob((string)args[1], (string)args[2], (string)args[3],
                                (string)args[4], (string)args[5], (string)args[6], (string)args[7],
                                (string)args[8], (string)args[9], (string)args[10], (string)args[11],
                                (int)args[12], (string)args[13], (string)args[14],
                                ref haveBinId, ref binId);

                    // e.Result = "1 experiment with " + jobs + " jobs submitted.";
                }
                else if (cmd == "Copy")
                {
                    w.Copy((string)args[1], (string)args[2], (string)args[3], ((string)args[4] == "True"));
                }
                else
                    throw new Exception("Unknown submission operation: " + cmd);
            }
            catch (Exception ex)
            {
                lastError = ex;
            }
        }
    }
}
