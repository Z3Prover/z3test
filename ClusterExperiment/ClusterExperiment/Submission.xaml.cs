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

        public Submission(string db, bool reconnect) // Connect...
        {
            InitializeComponent();
            Mouse.OverrideCursor = System.Windows.Input.Cursors.Wait;
            Title = reconnect ? "Reconnecting..." : "Connecting...";

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
            l.Content = reconnect ? "Reconnecting..." : "Connecting...";
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
                          string executable, string parameters, string cluster, string nodegroup, string locality, string limitsMin, string limitsMax,
                          string username, int priority, string extension, string note, bool parametricity,
                          string pFrom, string pTo, string pStep,
                          bool createGroup, string groupName,
                          string jobTemplate,
                          int jobTimeout, int taskTimeout)
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
                //Random rng = new Random((int)DateTime.Now.Ticks);
                for (Int64 i = from; i <= to; i += step, count++)
                {
                    //byte[] rbs = new byte[4];
                    //rng.NextBytes(rbs);
                    //uint r = ((uint) rbs[0] << 24) | (uint) rbs[1] << 16 | ((uint) rbs[2] << 8) | ((uint) rbs[3]);
                    submit(db, categories, sharedDir, memout, timeout, executor,
                           parameters.Replace("{0}", i.ToString()),
                           // parameters.Replace("{0}", r.ToString()),
                           cluster, nodegroup, locality, limitsMin, limitsMax,
                           username, priority, extension,
                           "(" + count.ToString() + "/" + total.ToString() + ") " + note,
                           jobTemplate,
                           jobTimeout, taskTimeout);
                }
            }
            else
                submit(db, categories, sharedDir, memout, timeout, executor, parameters,
                       cluster, nodegroup, locality, limitsMin, limitsMax, username, priority, extension, note,
                       jobTemplate, jobTimeout, taskTimeout);
        }

        // Submit a job...
        public Submission(string db, string categories, string sharedDir, string memout, string timeout, string executor,
                          string executable, string parameters, string cluster, string nodegroup, string locality, string limitsMin, string limitsMax,
                          string username, int priority, string extension, string note,
                          string jobTemplate,
                          int jobTimeout, int taskTimeout)
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
                   cluster, nodegroup, locality, limitsMin, limitsMax, username, priority, extension, note,
                   jobTemplate, jobTimeout, taskTimeout);
        }

        // Copy a job...
        public Submission(string db, string backupdb, Int32Collection jobs, bool move = false)
        {
            InitializeComponent();
            Mouse.OverrideCursor = System.Windows.Input.Cursors.Wait;
            Title = move ? "Moving..." : "Copying...";

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
                l.Content = (move ? "Moving" : "Copying") + " Job #" + jobID.ToString() + "...";
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
                String[] args = { "Copy", db, backupdb, jobID.ToString(), move.ToString() };
                workers.Add(workers.Count(), w);
                w.RunWorkerAsync(args);
            }

            Mouse.OverrideCursor = null;
        }

        // Submit reinforcement job...
        public Submission(string db, int jobid, string cluster, string jobTemplate, int numWorkers, int priority, int jobTimeout, int taskTimeout)
        {
            InitializeComponent();
            Mouse.OverrideCursor = System.Windows.Input.Cursors.Wait;
            Title = "Calling reinforcements ...";

            ColumnDefinition c1 = new ColumnDefinition();
            ColumnDefinition c2 = new ColumnDefinition();
            c1.Width = new GridLength(170);
            c2.Width = new GridLength(75);
            outerGrid.ColumnDefinitions.Add(c1);
            outerGrid.ColumnDefinitions.Add(c2);

            workers.Clear();

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
            l.Content = "Job #" + jobid.ToString() + "...";
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
            Object[] args = { "Reinforce", db, jobid, cluster, numWorkers, priority, jobTemplate, jobTimeout, taskTimeout};
            workers.Add(workers.Count(), w);
            w.RunWorkerAsync(args);

            Mouse.OverrideCursor = null;
        }

        // Recovery job submission
        public Submission(string db, int jobid, string cluster, string jobTemplate, int numWorkers, int priority, string executor, int jobTimeout, int taskTimeout)
        {
            InitializeComponent();
            Mouse.OverrideCursor = System.Windows.Input.Cursors.Wait;
            Title = "Submit recovery job...";

            ColumnDefinition c1 = new ColumnDefinition();
            ColumnDefinition c2 = new ColumnDefinition();
            c1.Width = new GridLength(170);
            c2.Width = new GridLength(75);
            outerGrid.ColumnDefinitions.Add(c1);
            outerGrid.ColumnDefinitions.Add(c2);

            workers.Clear();

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
            l.Content = "Job #" + jobid.ToString() + "...";
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
            Object[] args = { "Recovery", db, jobid, cluster, priority, numWorkers, executor, jobTemplate, jobTimeout, taskTimeout };
            workers.Add(workers.Count(), w);
            w.RunWorkerAsync(args);

            Mouse.OverrideCursor = null;
        }

        // Catchall job submission
        public Submission(string db, string cluster, string locality, int priority, string nodegroup, string executor, string min, string max, string jobTemplate, int jobTimeout, int taskTimeout)
        {
            InitializeComponent();
            Mouse.OverrideCursor = System.Windows.Input.Cursors.Wait;
            Title = "Submitting catchall job...";

            ColumnDefinition c1 = new ColumnDefinition();
            ColumnDefinition c2 = new ColumnDefinition();
            c1.Width = new GridLength(170);
            c2.Width = new GridLength(75);
            outerGrid.ColumnDefinitions.Add(c1);
            outerGrid.ColumnDefinitions.Add(c2);

            workers.Clear();

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
            l.Content = "Catchall...";
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
            Object[] args = { "Catchall", db, cluster, locality, priority, nodegroup, executor, min, max, jobTemplate, jobTimeout, taskTimeout};
            workers.Add(workers.Count(), w);
            w.RunWorkerAsync(args);

            Mouse.OverrideCursor = null;
        }


        private void submit(string db, string categories, string sharedDir, string memout, string timeout, string executor,
                            string parameters, string cluster, string nodegroup, string locality, string limitsMin, string limitsMax,
                            string username, int priority, string extension, string note,
                            string jobTemplate,
                            int jobTimeout, int taskTimeout)
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
                                  parameters, cluster, nodegroup, locality, limitsMin, limitsMax, username, priority, extension, note,
                                  jobTemplate, jobTimeout, taskTimeout};

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
                    string sExecutor = "";
                    int jobid =
                    w.SetupExperiment((string)args[1], (string)args[2], (string)args[3],
                                      (string)args[4], (string)args[5], (string)args[6], (string)args[7],
                                      (string)args[8], (string)args[9], (string)args[10], (string)args[11], (string)args[12],
                                      (string)args[13], (int)args[14], (string)args[15], (string)args[16],
                                      (string)args[17], (int)args[18], (int)args[19],
                                      ref haveBinId, ref binId, ref sExecutor);
                    w.SubmitHPCJob((string)args[1], true, jobid, (string)args[8], (string)args[9], (int)args[14], 
                                   (string)args[10], (string)args[11], (string)args[12],
                                   (string)args[3], sExecutor, (string)args[17], (int)args[18], (int)args[19]);

                    // e.Result = "1 experiment with " + jobs + " jobs submitted.";
                }
                else if (cmd == "Copy")
                {
                    w.Copy((string)args[1], (string)args[2], (string)args[3], ((string)args[4] == "True"));
                }
                else if (cmd == "Reinforce")
                {
                    w.Reinforce((string)args[1], (int)args[2], (string)args[3], (int)args[4], (int)args[5], (string)args[6], (int)args[7], (int)args[8]);
                }
                else if (cmd == "Recovery")
                {
                    w.SubmitHPCRecoveryJob((string)args[1], (int)args[2], (string)args[3],
                                           (int)args[4], (int)args[5], (string)args[6], (string)args[7],
                                           (int)args[8], (int)args[9]);
                }
                else if (cmd == "Catchall")
                {
                    w.SubmitCatchall((string)args[1], (string)args[2], (string)args[3], (int)args[4],
                                     (string)args[5], (string)args[6], (string)args[7], (string)args[8],
                                     (string)args[9], (int)args[10], (int)args[11]);
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
