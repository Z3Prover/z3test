using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using System.IO.Packaging;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Security.Principal;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Forms;
using System.Windows.Input;
using System.Windows.Interop;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Windows.Threading;
using Microsoft.Hpc.Scheduler;
using Microsoft.Hpc.Scheduler.Properties;
using Microsoft.Win32;

using SubmissionLib;

namespace ClusterExperiment
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        SqlConnection sql = null;

        public delegate void ConnectionDelegate();
        const string userRoot = "HKEY_CURRENT_USER";
        const string subkey = "ClusterExperiments";
        const string keyName = userRoot + "\\" + subkey;
        public static RoutedCommand CompareCommand = new RoutedCommand();
        public static RoutedCommand CopyCommand = new RoutedCommand();
        public static RoutedCommand MoveCommand = new RoutedCommand();
        public static RoutedCommand ScatterplotCommand = new RoutedCommand();
        public static RoutedCommand CreateGroupCommand = new RoutedCommand();
        public static RoutedCommand GroupScatterplotCommand = new RoutedCommand();
        public static RoutedCommand SaveBinaryCommand = new RoutedCommand();
        public static RoutedCommand ReinforcementsCommand = new RoutedCommand();
        public static RoutedCommand FlagCommand = new RoutedCommand();
        public static RoutedCommand DuplicatesCommand = new RoutedCommand();
        public static RoutedCommand TallyCommand = new RoutedCommand();
        public static RoutedCommand RecoveryCommand = new RoutedCommand();
        public static RoutedCommand UpdateBinaryCommand = new RoutedCommand();
        public static RoutedCommand ChangePriorityCommand = new RoutedCommand();
        public static RoutedCommand SaveMetaCSVCommand = new RoutedCommand();
        public static RoutedCommand SaveMatrixCommand = new RoutedCommand();
        public static RoutedCommand SaveOutputCommand = new RoutedCommand();
        public static RoutedCommand RequeueIErrorsCommand = new RoutedCommand();
        public static RoutedCommand RestartCommand = new RoutedCommand();

        public MainWindow()
        {
            InitializeComponent();

            Loaded += new RoutedEventHandler(MainWindow_Loaded);

            btnConnect.Focus();
        }

        void MainWindow_Loaded(object sender, RoutedEventArgs e)
        {
            string[] args = Environment.GetCommandLineArgs();
            if (args.Count() >= 2)
            {
                txtDatabase.Text = args[1];
                ensureConnected();
            }
            else
                txtDatabase.Text = (string)Registry.GetValue(keyName, "Database", "");

            string okn = keyName + "\\Options";
            if (Registry.GetValue(okn, "", "") != null)
            {
                mnuOptProgress.IsChecked = ((Int32)Registry.GetValue(okn, "ShowProgress", 0)) == 1;
                mnuOptResolveTimeoutDupes.IsChecked = ((Int32)Registry.GetValue(okn, "ResolveTimeoutDupes", 0)) == 1;
                mnuOptResolveSameTimeDupes.IsChecked = ((Int32)Registry.GetValue(okn, "ResolveSameTimeDupes", 0)) == 1;
                mnuOptResolveSlowestDupes.IsChecked = ((Int32)Registry.GetValue(okn, "ResolveSlowestDupes", 0)) == 1;
            }
        }
        private void OnClosing(object sender, System.ComponentModel.CancelEventArgs e)
        {
            Registry.SetValue(keyName, "Database", txtDatabase.Text, RegistryValueKind.String);

            string okn = keyName + "\\Options";
            Registry.SetValue(okn, "ShowProgress", mnuOptProgress.IsChecked ? 1 : 0, RegistryValueKind.DWord);
            Registry.SetValue(okn, "ResolveTimeoutDupes", mnuOptResolveTimeoutDupes.IsChecked ? 1 : 0, RegistryValueKind.DWord);
            Registry.SetValue(okn, "ResolveSameTimeDupes", mnuOptResolveSameTimeDupes.IsChecked ? 1 : 0, RegistryValueKind.DWord);
            Registry.SetValue(okn, "ResolveSlowestDupes", mnuOptResolveSlowestDupes.IsChecked ? 1 : 0, RegistryValueKind.DWord);
        }

        private void updateDataGrid()
        {
            bool retry = true;
            while (retry)
            {
                try
                {
                    ensureConnected();

                    Mouse.OverrideCursor = System.Windows.Input.Cursors.Wait;

                    SqlDataAdapter da;
                    string cmd = "SELECT * FROM TitleScreen ";
                    bool showProgress = mnuOptProgress.IsChecked;

                    SortDescription[] sdc = null;
                    if (dataGrid.Items.SortDescriptions.Count > 0)
                    {
                        sdc = new SortDescription[dataGrid.Items.SortDescriptions.Count];
                        dataGrid.Items.SortDescriptions.CopyTo(sdc, 0);
                    }

                    if (showProgress)
                    {
                        cmd = "SELECT TitleScreen.*, Done, Queued, Total " +
                                //", (CASE WHEN Queued = 0 THEN 'Done.' ELSE " +
                                // "CONVERT(varchar, CONVERT(time, DATEADD(s, (Queued * (-DateDiff(s, GetDate(), SubmissionTime) / Done)), 0))) END) as Projection " +
                                // ", Progress" +
                                "FROM TitleScreen, " +
                                "(SELECT DCT.ID, Done, Queued, (Done+Queued) as Total " +
                                // ", STR(100.0 * Done/NULLIF(Done+Queued, 0), 6, 2) + '%' as Progress " +
                                "FROM " +
                                    "(SELECT TitleScreen.ID, COUNT(Data.ID) as Done " +
                                    "FROM TitleScreen LEFT JOIN Data " +
                                    "ON TitleScreen.ID=Data.ExperimentID " +
                                    "GROUP BY " +
                                    "TitleScreen.ID) as DCT " +
                                    ", " +
                                    "(SELECT TitleScreen.ID, COUNT(JobQueue.ID) as Queued " +
                                    "FROM TitleScreen LEFT JOIN JobQueue " +
                                    "ON TitleScreen.ID=JobQueue.ExperimentID " +
                                    "GROUP BY " +
                                    "TitleScreen.ID) as JCT " +
                                "WHERE " +
                                "DCT.ID = JCT.ID) as ProgressT " +
                            "WHERE " +
                            "TitleScreen.ID = ProgressT.ID ";
                    }

                    if (txtFilter.Text != "")
                    {
                        cmd += showProgress ? "AND " : "WHERE ";
                        cmd += "(Category like '%" + txtFilter.Text + "%' OR " +
                               "Note like '%" + txtFilter.Text + "%' OR " +
                               "Creator like '%" + txtFilter.Text + "%') ";
                    }

                    cmd += "ORDER BY SubmissionTime DESC";
                    da = new SqlDataAdapter(cmd, sql);
                    DataSet ds = new DataSet();

                    da.SelectCommand.CommandTimeout = 0;
                    da.Fill(ds, "Experiments");
                    dataGrid.ItemsSource = ds.Tables[0].DefaultView;

                    if (sdc != null)
                    {
                        foreach (SortDescription sd in sdc)
                            dataGrid.Items.SortDescriptions.Add(new SortDescription(sd.PropertyName, sd.Direction));
                        dataGrid.Items.Refresh();
                    }

                    da = new SqlDataAdapter("SELECT * FROM JobgroupsView ORDER BY ID DESC", sql);
                    ds = new DataSet();
                    da.SelectCommand.CommandTimeout = 0;
                    da.Fill(ds, "Jobgroups");
                    jobgroupGrid.ItemsSource = ds.Tables[0].DefaultView;

                    da = new SqlDataAdapter("SELECT " +
                                            "    loginame as 'User', " +
                                            "    cpu as 'CPU Time (cum sec)', " +
                                            "    memusage as 'Memory (pgs)', " +
                                            "    login_time as Since, " +
                                            "    last_batch as 'Last Batch', " +
                                            "    hostname as Host, " +
                                            "    program_name as Program, " +
                                            "    cmd as 'Current Command' " +
                                            "FROM " +
                                            "    sys.sysprocesses " +
                                            "WHERE " +
                                            "    dbid > 0 " +
                                            "ORDER BY " +
                                            "    'User'", sql);
                    ds = new DataSet();
                    da.SelectCommand.CommandTimeout = 0;
                    da.Fill(ds, "Database Connections");
                    connectionsGrid.ItemsSource = ds.Tables[0].DefaultView;

                    retry = false;
                }
                catch (SqlException ex)
                {
                    Console.WriteLine("Retrying after error loading main tables: " + ex.Message);
                    try { sql.Close(); sql.Dispose(); } catch { }
                    sql = null;
                    retry = true;
                }
            }

            Mouse.OverrideCursor = null;
        }

        private void ensureConnected()
        {
            if (sql != null && sql.State == ConnectionState.Open)
                return;

            Mouse.OverrideCursor = System.Windows.Input.Cursors.Wait;
            IsEnabled = false;
            bool first = true;
            uint max_retries = 1, retries = 0;

            while (sql == null || sql.State != ConnectionState.Open)
            {
                sql = null;
                Submission dlg;

                dlg = new Submission(txtDatabase.Text, !first);
                dlg.Owner = this;
                dlg.ShowDialog();

                if (dlg.lastError != null)
                {
                    if (++retries == max_retries)
                    {
                        System.Windows.MessageBox.Show(this, 
                            "Could not connect to database after " + max_retries + " attempts. Last error: " +
                            dlg.lastError.Message, "Error",
                            System.Windows.MessageBoxButton.OK,
                            System.Windows.MessageBoxImage.Error);
                        sql = null;
                        updateState();
                        goto bailout;
                    }
                }
                else
                {
                    sql = dlg.returnSQL;
                }

                updateState();
                first = false;
            }

            bailout:
            IsEnabled = true;
            Mouse.OverrideCursor = null;
        }

        private void ensureDisconnected()
        {
            if (sql != null)
            {
                Mouse.OverrideCursor = System.Windows.Input.Cursors.Wait;
                IsEnabled = false;

                try { sql.Close(); sql.Dispose(); } catch { }
                sql = null;

                updateState();
                IsEnabled = true;
                Mouse.OverrideCursor = null;
            }
        }

        private void btnConnect_Click(object sender, RoutedEventArgs e)
        {
            if (sql == null)
                ensureConnected();
            else
                ensureDisconnected();
        }

        private void btnNewJob_Click(object sender, RoutedEventArgs e)
        {
            showNewJob(sender, e);
        }

        private void canShowNewJob(object sender, CanExecuteRoutedEventArgs e)
        {
            e.CanExecute = true;
        }
        private void showNewJob(object sender, RoutedEventArgs e)
        {
            NewJobDialog dlg = new NewJobDialog();
            dlg.Owner = this;
            if (dlg.ShowDialog() == true)
            {
                string bin = dlg.txtExecutable.Text;
                if (dlg.chkMostRecentBinary.IsChecked == true)
                    bin = "";

                string parameters = dlg.txtParameters.Text;
                if (dlg.chkReplaceCheckSat.IsChecked == true)
                    parameters += " replace-check-sat=\"" + dlg.txtReplaceCheckSat.Text + "\"";

                Submission sdlg = new Submission(txtDatabase.Text, dlg.txtCategories.Text,
                                                 dlg.txtSharedDir.Text,
                                                 dlg.txtMemout.Text, dlg.txtTimeout.Text, dlg.txtExecutor.Text,
                                                 bin, parameters,
                                                 dlg.txtCluster.Text, dlg.cmbNodeGroup.Text, dlg.cmbLocality.Text,
                                                 dlg.txtLimitMin.Text, dlg.txtLimitMax.Text,
                                                 WindowsIdentity.GetCurrent().Name.ToString(),
                                                 dlg.cmbPriority.SelectedIndex,
                                                 dlg.txtExtension.Text, dlg.txtNote.Text,
                                                 dlg.chkParametricity.IsChecked == true,
                                                 dlg.txtParametricityFrom.Text,
                                                 dlg.txtParametricityTo.Text,
                                                 dlg.txtParametricityStep.Text,
                                                 dlg.chkJobgroup.IsChecked == true,
                                                 dlg.txtJobgroup.Text,
                                                 dlg.txtJobTemplate.Text,
                                                 dlg.timeJob.Value.HasValue ? Convert.ToInt32(dlg.timeJob.Value.Value.TotalSeconds) : 0,
                                                 dlg.timeTask.Value.HasValue ? Convert.ToInt32(dlg.timeTask.Value.Value.TotalSeconds) : 0);
                sdlg.Owner = this;
                sdlg.ShowDialog();

                if (sdlg.lastError != null)
                    System.Windows.MessageBox.Show(this, sdlg.lastError.Message, "Error",
                    System.Windows.MessageBoxButton.OK,
                    System.Windows.MessageBoxImage.Error);

                updateState();
            }
        }

        private void updateState()
        {
            if (sql != null && sql.State == ConnectionState.Open)
            {
                txtDatabase.IsEnabled = false;
                btnConnect.Content = "Disconnect";
                btnConnect.IsEnabled = true;
                updateDataGrid();
                btnNewJob.IsEnabled = true;
                btnUpdate.IsEnabled = true;
            }
            else
            {
                txtDatabase.IsEnabled = true;
                btnConnect.Content = "Connect";
                btnConnect.IsEnabled = true;
                dataGrid.ItemsSource = null;
                btnNewJob.IsEnabled = false;
                btnUpdate.IsEnabled = false;
            }
        }

        private void dataGrid_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            if (dataGrid.SelectedItems.Count != 1)
                return;

            Mouse.OverrideCursor = System.Windows.Input.Cursors.Wait;

            DataRowView rowView = (DataRowView)dataGrid.SelectedItem;
            int id = (int)rowView["ID"];

            ensureConnected();
            ShowResults r = new ShowResults(id, sql);

            r.Show();
            Mouse.OverrideCursor = null;
        }

        private void btnUpdate_Click(object sender, RoutedEventArgs e)
        {
            Mouse.OverrideCursor = System.Windows.Input.Cursors.Wait;
            updateDataGrid();
            Mouse.OverrideCursor = null;
        }

        private void showProperties(object target, ExecutedRoutedEventArgs e)
        {
            Mouse.OverrideCursor = System.Windows.Input.Cursors.Wait;

            DataRowView rowView = (DataRowView)dataGrid.SelectedItem;
            int id = (int)rowView["ID"];
            ensureConnected();
            ExperimentProperties dlg = new ExperimentProperties(id, sql);

            dlg.Owner = this;
            dlg.Show();

            Mouse.OverrideCursor = null;
        }

        private void deleteExperiment(object target, ExecutedRoutedEventArgs e)
        {
            Mouse.OverrideCursor = System.Windows.Input.Cursors.Wait;

            System.Windows.MessageBoxResult r =
              System.Windows.MessageBox.Show("Are you sure you want to delete the selected experiments?", "Sure?", MessageBoxButton.YesNo, MessageBoxImage.Question, MessageBoxResult.No);

            if (r == System.Windows.MessageBoxResult.Yes)
            {
                for (int i = 0; i < dataGrid.SelectedItems.Count; i++)
                {
                    int id = (int)((DataRowView)dataGrid.SelectedItems[i])["ID"];
                    SqlDataReader rd = null;

                    retry:
                    try
                    {
                        ensureConnected();
                        SqlCommand cmd = new SqlCommand("SELECT Cluster,ClusterJobID,SharedDir,Executor FROM Experiments WHERE ID=" + id.ToString(), sql);
                        cmd.CommandTimeout = 0;
                        rd = cmd.ExecuteReader();

                        if (rd.Read())
                        {
                            string cluster = (string)rd["Cluster"];
                            object jobid = rd["ClusterJobID"];
                            object sharedDir = rd["SharedDir"];
                            object executor = rd["Executor"];
                            rd.Close();

                            if (cluster != "" && !DBNull.Value.Equals(jobid))
                            {
                                try
                                {
                                    Scheduler scheduler = new Scheduler();
                                    scheduler.Connect(cluster);
                                    WindowInteropHelper helper = new WindowInteropHelper(this);
                                    scheduler.SetInterfaceMode(false, helper.Handle);
                                    scheduler.CancelJob((int)jobid, "Job aborted by user.");
                                }
                                catch { /* That's fine... */ }
                            }

                            if (!DBNull.Value.Equals(sharedDir) && !DBNull.Value.Equals(executor))
                            {
                                try
                                {
                                    File.Delete((string)sharedDir + "\\" + (string)executor);
                                }
                                catch { /* That's fine... */ }
                            }

                        }

                        cmd = new SqlCommand("DELETE FROM JobQueue WHERE ExperimentID=" + id.ToString() + ";" +
                                             "DELETE FROM Data WHERE ExperimentID=" + id.ToString() + ";" +
                                             "DELETE FROM Experiments WHERE ID=" + id.ToString(), sql);
                        cmd.CommandTimeout = 0;
                        cmd.ExecuteNonQuery();
                    }
                    catch (SqlException ex)
                    {
                        if (rd != null) { try { rd.Close(); } catch { } }
                        Console.WriteLine("Retrying after exception during deletion: " + ex.Message);
                        goto retry;
                    }
                    catch (Exception ex)
                    {
                        string msg = String.Format("Error: could not delete experiment #{0} because of: {1} ", id, ex.Message);
                        r = System.Windows.MessageBox.Show(msg, "Error", MessageBoxButton.OK, MessageBoxImage.Error, MessageBoxResult.OK);
                    }
                    finally
                    {
                        if (rd != null) rd.Close();
                    }
                }
            }

            Mouse.OverrideCursor = null;

            updateDataGrid();
        }

        private void showCompare(object target, ExecutedRoutedEventArgs e)
        {
            Mouse.OverrideCursor = System.Windows.Input.Cursors.Wait;

            DataRowView rowView = (DataRowView)dataGrid.SelectedItems[0];
            int id1 = (int)rowView["ID"];
            rowView = (DataRowView)dataGrid.SelectedItems[1];
            int id2 = (int)rowView["ID"];

            ensureConnected();
            CompareExperiments dlg = new CompareExperiments(id1, id2, sql);
            dlg.Show();

            Mouse.OverrideCursor = null;
        }

        private void showScatterplot(object target, ExecutedRoutedEventArgs e)
        {
            Mouse.OverrideCursor = System.Windows.Input.Cursors.Wait;

            DataRowView rowView = (DataRowView)dataGrid.SelectedItems[0];
            int id1 = (int)rowView["ID"];
            rowView = (DataRowView)dataGrid.SelectedItems[1];
            int id2 = (int)rowView["ID"];

            ensureConnected();
            Scatterplot sp = new Scatterplot(id1, id2, sql);
            sp.Show();

            Mouse.OverrideCursor = null;
        }

        class CSVDatum
        {
            public int? rv = null;
            public double runtime = 0.0;
            public int sat = 0, unsat = 0, unknown = 0;
        }

        private void canShowSaveCSV(object sender, CanExecuteRoutedEventArgs e)
        {
            e.CanExecute = dataGrid.SelectedItems.Count >= 1;
        }

        private void showSaveCSV(object target, ExecutedRoutedEventArgs e)
        {
            System.Windows.Forms.SaveFileDialog dlg = new System.Windows.Forms.SaveFileDialog();
            dlg.Filter = "CSV files (*.csv)|*.csv|All files (*.*)|*.*";
            dlg.FilterIndex = 1;
            dlg.RestoreDirectory = true;
            dlg.FileName = "summary.csv";

            if (dlg.ShowDialog() == System.Windows.Forms.DialogResult.OK)
            {
                Mouse.OverrideCursor = System.Windows.Input.Cursors.Wait;
                StreamWriter f = new StreamWriter(dlg.FileName, false);

                Dictionary<string, Dictionary<int, CSVDatum>> data =
                    new Dictionary<string, Dictionary<int, CSVDatum>>();

                // Headers and data
                f.Write(",");
                for (int i = 0; i < dataGrid.SelectedItems.Count; i++)
                {
                    DataRowView rowView = (DataRowView)dataGrid.SelectedItems[i];
                    int id = (int)rowView["ID"];

                    ensureConnected();

                    SqlCommand c = new SqlCommand("SELECT Note,Parameters,Longparams,Timeout FROM Experiments WHERE ID=" + id.ToString(), sql);
                    c.CommandTimeout = 0;

                    double ex_timeout = int.MaxValue;
                    SqlDataReader rd = c.ExecuteReader();
                    if (rd.Read())
                    {
                        f.Write(((string)rd["Note"]).Trim(' ') + ",");
                        if (rd["Parameters"].Equals(DBNull.Value))
                            f.Write("'" + ((string)rd["Longparams"]).Trim(' ') + "'");
                        else
                        {
                            string str = ((string)rd["Parameters"]).Trim(' ');
                            if (str != "")
                                f.Write("'" + str + "'");
                        }
                        ex_timeout = Convert.ToDouble((string)rd["Timeout"]);
                    }
                    rd.Close();
                    f.Write(",,,,");

                    double error_line = 10.0 * ex_timeout;

                    c = new SqlCommand("SELECT s as Filename," +
                                       " ResultCode," +
                                       " Returnvalue," +
                                       " Runtime," +
                                       " SAT," +
                                       " UNSAT," +
                                       " UNKNOWN" +
                                       " FROM Strings, Data WHERE" +
                                       " Strings.ID=Data.FilenameP AND" +
                                       " Data.ExperimentID=" + id.ToString(), sql);
                    c.CommandTimeout = 0;
                    rd = c.ExecuteReader();

                    while (rd.Read())
                    {
                        string fn = (string)rd["Filename"];
                        CSVDatum cur = new CSVDatum();
                        int rc = Convert.ToInt32((byte)rd["ResultCode"]);
                        cur.rv = (rd["ReturnValue"].Equals(System.DBNull.Value)) ? null : (int?)rd["Returnvalue"];
                        cur.runtime = (rd["Runtime"].Equals(System.DBNull.Value)) ? ex_timeout : (double)rd["Runtime"];
                        cur.sat = (int)rd["SAT"];
                        cur.unsat = (int)rd["UNSAT"];
                        cur.unknown = (int)rd["UNKNOWN"];

                        bool rv_ok = (rc != 4) &&
                                     ((rc == 5 && cur.rv == null) ||
                                     ((rc == 0) && (cur.rv == 0 || cur.rv == 10 || cur.rv == 20)));
                        if (cur.sat == 0 && cur.unsat == 0 && !rv_ok)
                            cur.runtime = error_line;

                        if (cur.runtime < 0.01)
                            cur.runtime = 0.01;

                        if (!data.ContainsKey(fn))
                            data.Add(fn, new Dictionary<int, CSVDatum>());
                        if (data[fn].ContainsKey(id))
                        {
                            System.Windows.MessageBox.Show(
                                String.Format("Duplicate in job #{0} ignored", id),
                                "Duplicate warning",
                                MessageBoxButton.OK,
                                MessageBoxImage.Warning,
                                MessageBoxResult.OK);
                        }
                        else
                            data[fn].Add(id, cur);
                    }

                    rd.Close();
                }
                f.WriteLine();

                // Write headers
                f.Write(",");
                for (int i = 0; i < dataGrid.SelectedItems.Count; i++)
                {
                    DataRowView rowView = (DataRowView)dataGrid.SelectedItems[i];
                    int id = (int)rowView["ID"];
                    f.Write("R" + id + ",T" + id + ",SAT" + id + ",UNSAT" + id + ",UNKNOWN" + id + ",");
                }
                f.WriteLine();

                // Write data.
                foreach (KeyValuePair<string, Dictionary<int, CSVDatum>> d in data.OrderBy(x => x.Key))
                {
                    bool skip = false;
                    for (int i = 0; i < dataGrid.SelectedItems.Count; i++)
                    {
                        DataRowView rowView = (DataRowView)dataGrid.SelectedItems[i];
                        int id = (int)rowView["ID"];
                        if (!d.Value.ContainsKey(id) || d.Value[id] == null)
                            skip = true;
                    }
                    if (skip)
                        continue;

                    f.Write(d.Key + ",");

                    for (int i = 0; i < dataGrid.SelectedItems.Count; i++)
                    {
                        DataRowView rowView = (DataRowView)dataGrid.SelectedItems[i];
                        int id = (int)rowView["ID"];

                        if (!d.Value.ContainsKey(id) || d.Value[id] == null)
                            f.Write("MISSING,,,,");
                        else
                        {
                            CSVDatum c = d.Value[id];
                            f.Write(c.rv + ",");
                            f.Write(c.runtime + ",");
                            f.Write(c.sat + ",");
                            f.Write(c.unsat + ",");
                            f.Write(c.unknown + ",");
                        }
                    }

                    f.WriteLine();
                }

                f.Close();
            }

            Mouse.OverrideCursor = null;
        }

        private void canShowSaveMetaCSV(object sender, CanExecuteRoutedEventArgs e)
        {
            e.CanExecute = dataGrid.SelectedItems.Count >= 1;
        }

        private List<int> computeUnique()
        {
            List<int> jobs = new List<int>();
            for (int i = 0; i < dataGrid.SelectedItems.Count; i++)
            {
                DataRowView rowView = (DataRowView)dataGrid.SelectedItems[i];
                int id = (int)rowView["ID"];
                jobs.Add(id);
            }

            string basecmd = "SELECT s FROM ";
            for (int j = 0; j < jobs.Count; j++)
                basecmd += "Data as d" + j + ", ";
            basecmd += "Strings WHERE ";

            for (int j = 0; j < jobs.Count; j++)
            {
                basecmd += "d" + j + ".ExperimentID=" + jobs[j] + " AND ";
                if (j > 0) basecmd += "d" + j + ".FilenameP = d0.FilenameP AND ";
            }
            basecmd += "d0.FilenameP = Strings.ID ";

            List<int> res = new List<int>();
            for (int i = 0; i < jobs.Count; i++)
            {
                string cmd_str = basecmd;

                for (int j = 0; j < jobs.Count; j++)
                    cmd_str += " AND d" + j + ".ResultCode" + ((i == j) ? "=" : "<>") + "0 ";

                cmd_str += ";";

                ensureConnected();
                SqlCommand cmd = new SqlCommand(cmd_str, sql);
                cmd.CommandTimeout = 0;
                SqlDataReader rd = cmd.ExecuteReader();

                List<string> filenames = new List<string>();
                while (rd.Read())
                    filenames.Add((string)rd[0]);
                rd.Close();

                res.Add(filenames.Count);
            }

            return res;
        }

        private void showSaveMetaCSV(object target, ExecutedRoutedEventArgs e)
        {
            System.Windows.Forms.SaveFileDialog dlg = new System.Windows.Forms.SaveFileDialog();
            dlg.Filter = "CSV files (*.csv)|*.csv|All files (*.*)|*.*";
            dlg.FilterIndex = 1;
            dlg.RestoreDirectory = true;
            dlg.FileName = "meta.csv";

            if (dlg.ShowDialog() == System.Windows.Forms.DialogResult.OK)
            {
                Mouse.OverrideCursor = System.Windows.Input.Cursors.Wait;
                StreamWriter f = new StreamWriter(dlg.FileName, false);

                List<int> unique = null;
                unique = computeUnique();

                f.WriteLine("\"ID\",\"# Total\",\"# SAT\",\"# UNSAT\",\"# UNKNOWN\",\"# Timeout\",\"# Memout\",\"# Bug\",\"# Error\",\"# Unique\",\"Parameters\",\"Note\"");

                for (int i = 0; i < dataGrid.SelectedItems.Count; i++)
                {
                    DataRowView rowView = (DataRowView)dataGrid.SelectedItems[i];
                    int id = (int)rowView["ID"];
                    string ps = "";
                    string note = "";

                    ensureConnected();
                    SqlCommand c = new SqlCommand("SELECT Parameters,Longparams,Note FROM Experiments WHERE ID=" + id.ToString(), sql);
                    c.CommandTimeout = 0;

                    SqlDataReader rd = c.ExecuteReader();
                    if (rd.Read())
                    {
                        if (rd["Parameters"].Equals(DBNull.Value))
                            ps = ((string)rd["Longparams"]).Trim(' ');
                        else
                        {
                            ps = ((string)rd["Parameters"]).Trim(' ');
                        }
                        note = ((string)rd["Note"]).Trim(' ');
                    }
                    rd.Close();


                    c = new SqlCommand("SELECT " +
                            "(SELECT COUNT(*) FROM Data WHERE ExperimentID=" + id.ToString() + ") as total, " +
                            "(SELECT COUNT(*) FROM Data WHERE ExperimentID=" + id.ToString() + " AND ResultCode=3) as bugs, " +
                            "(SELECT COUNT(*) FROM Data WHERE ExperimentID=" + id.ToString() + " AND ResultCode=4) as errors, " +
                            "(SELECT COUNT(*) FROM Data WHERE ExperimentID=" + id.ToString() + " AND ResultCode=5) as timeouts, " +
                            "(SELECT COUNT(*) FROM Data WHERE ExperimentID=" + id.ToString() + " AND ResultCode=6) as memouts, " +
                            "SUM(SAT) as ssat, " +
                            "SUM(UNSAT) as sunsat, " +
                            "SUM(UNKNOWN) as sunknown " +
                            "FROM Data WHERE " +
                            "ExperimentID=" + id.ToString() + " AND ResultCode=0", sql);
                    c.CommandTimeout = 0;
                    rd = c.ExecuteReader();

                    if (rd.Read())
                    {
                        int total = rd["total"] == System.DBNull.Value ? 0 : (int)rd["total"];
                        int sat = rd["ssat"] == System.DBNull.Value ? 0 : (int)rd["ssat"];
                        int unsat = rd["sunsat"] == System.DBNull.Value ? 0 : (int)rd["sunsat"];
                        int unknown = rd["sunknown"] == System.DBNull.Value ? 0 : (int)rd["sunknown"];
                        int timeouts = rd["timeouts"] == System.DBNull.Value ? 0 : (int)rd["timeouts"];
                        int memouts = rd["memouts"] == System.DBNull.Value ? 0 : (int)rd["memouts"];
                        int bugs = rd["bugs"] == System.DBNull.Value ? 0 : (int)rd["bugs"];
                        int errors = rd["errors"] == System.DBNull.Value ? 0 : (int)rd["errors"];

                        f.WriteLine(id + "," +
                                    total + "," +
                                    sat + "," +
                                    unsat + "," +
                                    unknown + "," +
                                    timeouts + "," +
                                    memouts + "," +
                                    bugs + "," +
                                    errors + "," +
                                    unique[i] + "," +
                                    "\"'" + ps + "\"," +
                                    "\"" + note + "\"");
                    }

                    rd.Close();
                }

                f.WriteLine();
                f.Close();
            }

            Mouse.OverrideCursor = null;
        }

        private void canShowUpdateBinaryCommand(object sender, CanExecuteRoutedEventArgs e)
        {
            e.CanExecute = dataGrid.SelectedItems.Count >= 1;
        }

        private static void CopyStream(Stream source, Stream target)
        {
            const int bufSize = 0x1000;
            byte[] buf = new byte[bufSize];
            int bytesRead = 0;
            while ((bytesRead = source.Read(buf, 0, bufSize)) > 0)
                target.Write(buf, 0, bytesRead);
        }

        private void showUpdateBinaryCommand(object target, ExecutedRoutedEventArgs e)
        {
            Mouse.OverrideCursor = System.Windows.Input.Cursors.Wait;

            System.Windows.Forms.OpenFileDialog dlg = new System.Windows.Forms.OpenFileDialog();

            dlg.DefaultExt = "exe";
            dlg.Filter = "Executable files (*.exe;*.dll)|*.exe;*.dll|All Files (*.*)|*.*";
            dlg.Multiselect = true;

            string exe = null;

            if (dlg.ShowDialog() == System.Windows.Forms.DialogResult.OK)
            {
                if (dlg.FileNames.Count() == 1)
                {
                    exe = dlg.FileName;
                }
                else if (dlg.FileNames.Count() > 1)
                {
                    // Create a ZipPackage
                    string fn = System.IO.Path.GetTempFileName();

                    ZipPackage pkg = (ZipPackage)ZipPackage.Open(fn, FileMode.Create);

                    string mainFile = "";
                    int exe_count = 0;
                    foreach (string f in dlg.FileNames)
                    {
                        if (f.EndsWith(".exe"))
                        {
                            mainFile = f;
                            exe_count++;
                        }
                    }

                    if (exe_count != 1)
                    {
                        SelectMainExe sme = new SelectMainExe();
                        foreach (string f in dlg.FileNames)
                            sme.lbFiles.Items.Add(f);
                        sme.Owner = this;
                        Mouse.OverrideCursor = null;
                        if (sme.ShowDialog() == true)
                            mainFile = sme.selectedFile;
                        Mouse.OverrideCursor = System.Windows.Input.Cursors.Wait;
                    }

                    foreach (string f in dlg.FileNames)
                    {
                        Uri uri = PackUriHelper.CreatePartUri(new Uri(System.IO.Path.GetFileName(f), UriKind.Relative));
                        ZipPackagePart p = (ZipPackagePart)pkg.CreatePart(uri, System.Net.Mime.MediaTypeNames.Application.Octet, CompressionOption.Maximum);
                        CopyStream(new FileStream(f, FileMode.Open, FileAccess.Read), p.GetStream());
                        if (f == mainFile)
                            pkg.CreateRelationship(uri, TargetMode.Internal, "http://schemas.openxmlformats.org/package/2006/relationships/meta data/thumbnail");
                    }

                    pkg.Close();

                    exe = fn;
                }
            }

            if (exe != null)
            {

                WindowInteropHelper helper = new WindowInteropHelper(this);
                SubmissionWorker w = new SubmissionWorker(helper.Handle, 0);
                bool haveBinID = false;
                int binID = 0;
                w.UploadBinary(txtDatabase.Text, exe, ref haveBinID, ref binID);

                if (!haveBinID || binID == 0)
                    System.Windows.MessageBox.Show("Error uploading binary.", "Error", MessageBoxButton.OK, MessageBoxImage.Error, MessageBoxResult.OK);
                else
                {
                    foreach (DataRowView j in dataGrid.SelectedItems)
                    {
                        ensureConnected();
                        SqlCommand cmd = new SqlCommand("UPDATE Experiments SET Binary=" + binID + ";", sql);
                        cmd.CommandTimeout = 0;
                        cmd.ExecuteNonQuery();
                    }
                }
            }
            else
                System.Windows.MessageBox.Show("No binary selected; did not update database.", "Error", MessageBoxButton.OK, MessageBoxImage.Error, MessageBoxResult.OK);

            Mouse.OverrideCursor = null;
        }

        private void canShowProperties(object sender, CanExecuteRoutedEventArgs e)
        {
            e.CanExecute = dataGrid.SelectedItems.Count == 1;
        }

        private void canDeleteExperiment(object sender, CanExecuteRoutedEventArgs e)
        {
            e.CanExecute = dataGrid.SelectedItems.Count >= 1;
        }

        private void canShowCompare(object sender, CanExecuteRoutedEventArgs e)
        {
            e.CanExecute = dataGrid.SelectedItems.Count == 2;
        }

        private void canShowScatterplot(object sender, CanExecuteRoutedEventArgs e)
        {
            e.CanExecute = dataGrid.SelectedItems.Count == 2;
        }

        private void canSave(object Sender, CanExecuteRoutedEventArgs e)
        {
            e.CanExecute = dataGrid.SelectedItems.Count >= 1;
        }

        private void showCopy(object target, ExecutedRoutedEventArgs e)
        {
            CopyDialog dlg = new CopyDialog();
            dlg.Owner = this;
            if (dlg.ShowDialog() == true)
            {
                string backupDB = dlg.txtDB.Text;

                if (txtDatabase.Text == backupDB)
                {
                    System.Windows.MessageBox.Show(this, "Refusing to copy to the same database.", "Error",
                                                    System.Windows.MessageBoxButton.OK,
                                                    System.Windows.MessageBoxImage.Error);
                    return;
                }

                Int32Collection jobIDs = new Int32Collection();
                IEnumerator den = dataGrid.SelectedItems.GetEnumerator();
                while (den.MoveNext())
                {
                    DataRowView x = (DataRowView)den.Current;
                    jobIDs.Add((int)x["ID"]);
                }

                Submission sdlg = null;

                do
                {
                    Int32Collection subset = null;
                    if (jobIDs.Count > 20)
                    {
                        subset = new Int32Collection();
                        for (int i = 0; i < 20; i++)
                        {
                            subset.Add(jobIDs[0]);
                            jobIDs.RemoveAt(0);
                        }
                    }
                    else
                    {
                        subset = new Int32Collection(jobIDs);
                        jobIDs.Clear();
                    }

                    sdlg = new Submission(txtDatabase.Text, backupDB, subset, false /* no move */);
                    sdlg.Owner = this;
                    sdlg.ShowDialog();

                    if (sdlg.lastError != null)
                        System.Windows.MessageBox.Show(this, sdlg.lastError.Message, "Error",
                        System.Windows.MessageBoxButton.OK,
                        System.Windows.MessageBoxImage.Error);
                }
                while (jobIDs.Count > 0 && sdlg.lastError == null);
            }
        }

        private void canShowCopy(object Sender, CanExecuteRoutedEventArgs e)
        {
            e.CanExecute = dataGrid.SelectedItems.Count >= 1;
        }

        private void showMove(object target, ExecutedRoutedEventArgs e)
        {
            CopyDialog dlg = new CopyDialog();
            dlg.Owner = this;
            if (dlg.ShowDialog() == true)
            {
                string backupDB = dlg.txtDB.Text;

                if (txtDatabase.Text == backupDB)
                {
                    System.Windows.MessageBox.Show(this, "Refusing to copy to the same database.", "Error",
                                                    System.Windows.MessageBoxButton.OK,
                                                    System.Windows.MessageBoxImage.Error);
                    return;
                }

                Int32Collection jobIDs = new Int32Collection();
                IEnumerator den = dataGrid.SelectedItems.GetEnumerator();
                while (den.MoveNext())
                {
                    DataRowView x = (DataRowView)den.Current;
                    jobIDs.Add((int)x["ID"]);
                }

                Submission sdlg = null;

                do
                {
                    Int32Collection subset = null;
                    if (jobIDs.Count > 20)
                    {
                        subset = new Int32Collection();
                        for (int i = 0; i < 20; i++)
                        {
                            subset.Add(jobIDs[0]);
                            jobIDs.RemoveAt(0);
                        }
                    }
                    else
                    {
                        subset = new Int32Collection(jobIDs);
                        jobIDs.Clear();
                    }

                    sdlg = new Submission(txtDatabase.Text, backupDB, subset, true /* move */);
                    sdlg.Owner = this;
                    sdlg.ShowDialog();
                }
                while (jobIDs.Count > 0 && sdlg.lastError == null);

                if (sdlg.lastError != null)
                    System.Windows.MessageBox.Show(this, sdlg.lastError.Message, "Error",
                    System.Windows.MessageBoxButton.OK,
                    System.Windows.MessageBoxImage.Error);
            }
        }

        private void canShowMove(object Sender, CanExecuteRoutedEventArgs e)
        {
            e.CanExecute = dataGrid.SelectedItems.Count >= 1;
        }

        private void showCreateGroup(object target, ExecutedRoutedEventArgs e)
        {
            bool first = true;
            string category = "";
            IEnumerator den = dataGrid.SelectedItems.GetEnumerator();
            DataRowView rv;
            while (den.MoveNext())
            {
                rv = (DataRowView)den.Current;
                string cur = (string)rv["Category"];
                if (first) { category = cur; first = false; }
                else if (cur != category)
                {
                    System.Windows.MessageBox.Show(this, "Jobs in a group need to have the same category.", "Error",
                                                System.Windows.MessageBoxButton.OK,
                                                System.Windows.MessageBoxImage.Error);
                    return;
                }
            }

            CreateGroupDialog dlg = new CreateGroupDialog();
            dlg.Owner = this;
            if (dlg.ShowDialog() == true)
            {
                Mouse.OverrideCursor = System.Windows.Input.Cursors.Wait;

                string name = dlg.txtGroupName.Text;
                string note = dlg.txtNote.Text;

                ensureConnected();
                SqlCommand cmd = new SqlCommand("SELECT * FROM JobGroups WHERE Name='" + name + "'", sql);
                cmd.CommandTimeout = 0;
                SqlDataReader r = cmd.ExecuteReader();
                if (r.HasRows)
                {
                    System.Windows.MessageBox.Show(this, "Jobgroup with the same name already exists.", "Error",
                                                    System.Windows.MessageBoxButton.OK,
                                                    System.Windows.MessageBoxImage.Error);
                    r.Close();
                    return;
                }
                r.Close();

                string username = WindowsIdentity.GetCurrent().Name.ToString();

                cmd = new SqlCommand("INSERT INTO JobGroups (Name,Creator,Category,Note) VALUES (" +
                                     "'" + name + "'," +
                                     "'" + username + "'," +
                                     "'" + category + "'," +
                                     "'" + note + "'); SELECT SCOPE_IDENTITY() as NewID;", sql);
                cmd.CommandTimeout = 0;
                r = cmd.ExecuteReader();
                if (!r.HasRows)
                {
                    System.Windows.MessageBox.Show(this, "Jobgroup creation failed.", "Error",
                                                    System.Windows.MessageBoxButton.OK,
                                                    System.Windows.MessageBoxImage.Error);
                    r.Close();
                    return;
                }
                r.Read();
                int jgid = Convert.ToInt32(r[0]);
                r.Close();

                den = dataGrid.SelectedItems.GetEnumerator();
                while (den.MoveNext())
                {
                    rv = (DataRowView)den.Current;
                    int jid = (int)rv["ID"];
                    cmd = new SqlCommand("INSERT INTO JobGroupData (JobID,GroupID) VALUES (" + jid + "," + jgid + ");", sql);
                    cmd.CommandTimeout = 0;
                    cmd.ExecuteNonQuery();
                }

                updateDataGrid();

                Mouse.OverrideCursor = null;
            }
        }

        private void canShowCreateGroup(object Sender, CanExecuteRoutedEventArgs e)
        {
            e.CanExecute = dataGrid.SelectedItems.Count >= 1;
        }

        private void jobgroupGrid_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {

        }

        private void canDeleteJobGroup(object sender, CanExecuteRoutedEventArgs e)
        {
            e.CanExecute = jobgroupGrid.SelectedItems.Count >= 1;
        }

        private void deleteJobGroup(object sender, ExecutedRoutedEventArgs e)
        {
            throw new Exception("Not implemented yet.");
        }

        private void canShowGroupScatterplot(object sender, CanExecuteRoutedEventArgs e)
        {
            e.CanExecute = jobgroupGrid.SelectedItems.Count == 2;
        }

        private void showGroupScatterplot(object target, ExecutedRoutedEventArgs e)
        {
            Mouse.OverrideCursor = System.Windows.Input.Cursors.Wait;

            DataRowView rowView = (DataRowView)jobgroupGrid.SelectedItems[0];
            int id1 = (int)rowView["ID"];
            rowView = (DataRowView)jobgroupGrid.SelectedItems[1];
            int id2 = (int)rowView["ID"];

            ensureConnected();
            GroupScatterPlot sp = new GroupScatterPlot(sql);
            if (sp.ShowPlot(id1, id2)) sp.Show();

            Mouse.OverrideCursor = null;
        }

        private void canShowSaveBinary(object Sender, CanExecuteRoutedEventArgs e)
        {
            e.CanExecute = dataGrid.SelectedItems.Count == 1;
        }

        private void showSaveBinary(object target, ExecutedRoutedEventArgs e)
        {
            DataRowView rowView = (DataRowView)dataGrid.SelectedItems[0];
            int id = (int)rowView["ID"];

            System.Windows.Forms.SaveFileDialog dlg = new System.Windows.Forms.SaveFileDialog();
            dlg.Filter = "Executable files (*.exe)|*.exe|All files (*.*)|*.*";
            dlg.FilterIndex = 1;
            dlg.RestoreDirectory = true;
            dlg.FileName = "binary_" + id + ".exe";

            if (dlg.ShowDialog() == System.Windows.Forms.DialogResult.OK)
            {
                Mouse.OverrideCursor = System.Windows.Input.Cursors.Wait;
                int binary_id = 0;

                ensureConnected();
                SqlCommand c = new SqlCommand("SELECT Binary FROM Experiments WHERE ID=" + id.ToString(), sql);
                c.CommandTimeout = 0;

                SqlDataReader rd = c.ExecuteReader();
                if (rd.Read())
                {
                    binary_id = (int)rd[0];
                    rd.Close();
                }
                else
                {
                    System.Windows.MessageBox.Show(this, "Could not get binary ID.", "Error",
                                                    System.Windows.MessageBoxButton.OK,
                                                    System.Windows.MessageBoxImage.Error);
                    rd.Close();
                    return;
                }

                string fn = dlg.FileName;
                FileStream file = File.Open(fn, System.IO.FileMode.OpenOrCreate, System.IO.FileAccess.Write);

                c = new SqlCommand("SELECT Binary FROM Binaries WHERE ID=" + binary_id.ToString(), sql);
                c.CommandTimeout = 0;

                rd = c.ExecuteReader();
                if (rd.Read())
                {
                    byte[] data = (byte[])rd[0];
                    file.Write(data, 0, data.Length);
                    file.Close();
                    rd.Close();
                }
                else
                {
                    System.Windows.MessageBox.Show(this, "Could not get binary data.", "Error",
                                                    System.Windows.MessageBoxButton.OK,
                                                    System.Windows.MessageBoxImage.Error);
                    file.Close();
                    rd.Close();
                }
            }

            Mouse.OverrideCursor = null;
        }

        private void canShowReinforcements(object Sender, CanExecuteRoutedEventArgs e)
        {
            e.CanExecute =  dataGrid.SelectedItems.Count == 1;
        }

        private void showReinforcements(object target, ExecutedRoutedEventArgs e)
        {
            ReinforcementsDialog dlg = new ReinforcementsDialog();
            dlg.Owner = this;
            if (dlg.ShowDialog() == true)
            {
                DataRowView rowView = (DataRowView)dataGrid.SelectedItems[0];

                string rcluster = dlg.txtRCluster.Text;
                int nworkers = Convert.ToInt32(dlg.txtNumWorkers.Text);
                int jid = (int)rowView["ID"];
                int priority = dlg.cmbPriority.SelectedIndex;
                string jobTemplate = dlg.txtJobTemplate.Text;
                int jobTimeout = dlg.timeJob.Value.HasValue ? Convert.ToInt32(dlg.timeJob.Value.Value.TotalSeconds) : 0;
                int taskTimeout = dlg.timeTask.Value.HasValue ? Convert.ToInt32(dlg.timeTask.Value.Value.TotalSeconds) : 0;

                Submission sdlg = null;

                sdlg = new Submission(txtDatabase.Text, jid, rcluster, jobTemplate, nworkers, priority, jobTimeout, taskTimeout);
                sdlg.Owner = this;
                sdlg.ShowDialog();

                if (sdlg.lastError != null)
                    System.Windows.MessageBox.Show(this, sdlg.lastError.Message, "Error",
                    System.Windows.MessageBoxButton.OK,
                    System.Windows.MessageBoxImage.Error);
            }
        }

        private void canShowFlag(object Sender, CanExecuteRoutedEventArgs e)
        {
            e.CanExecute = (sql != null) && (dataGrid.SelectedItems.Count >= 1);
        }

        private void showFlag(object target, ExecutedRoutedEventArgs e)
        {
            foreach (DataRowView drv in dataGrid.SelectedItems)
            {
                int id = (int)drv["ID"];
                bool old = System.DBNull.Value.Equals(drv["Flag"]) ? false : (bool)drv["Flag"];

                ensureConnected();
                SqlCommand c = new SqlCommand("UPDATE Experiments SET Flag=" + ((old == true) ? "0" : "1") + " WHERE ID=" + id, sql);
                c.CommandTimeout = 0;
                c.ExecuteNonQuery();

                drv.Row["Flag"] = (old == true) ? 0 : 1;
            }
        }

        private void txtFilter_KeyUp(object sender, System.Windows.Input.KeyEventArgs e)
        {
            if (e.Key == Key.Enter)
                updateDataGrid();
        }

        private void canFocusOnFilter(object Sender, CanExecuteRoutedEventArgs e)
        {
            e.CanExecute = true;
        }

        private void focusOnFilter(object sender, ExecutedRoutedEventArgs e)
        {
            txtFilter.SelectAll();
            txtFilter.Focus();
        }

        private void canShowDuplicates(object Sender, CanExecuteRoutedEventArgs e)
        {
            e.CanExecute = dataGrid.SelectedItems.Count >= 1;
        }

        private void showDuplicates(object sender, ExecutedRoutedEventArgs e)
        {
            Mouse.OverrideCursor = System.Windows.Input.Cursors.Wait;
            double total = (double)dataGrid.SelectedItems.Count;
            IList drviews = dataGrid.SelectedItems;
            bool stop = false;
            bool zero_duplicates = true;

            for (int i = 0; i < total && !stop; i++)
            {
                new Progress(this, dataGrid.SelectedItems.Count, "Resolving",
                    (sndr, ea) =>
                    {
                        ProgressWorker w = (ProgressWorker)sndr;
                        Object[] args = (Object[])ea.Argument;
                        DataRowView drv = (DataRowView)drviews[i];
                        int eid = (int)drv["ID"];

                        ensureConnected();
                        SqlCommand cmd = new SqlCommand("SELECT TOP 1 COUNT(*) as Count,FilenameP FROM Data WHERE ExperimentID=" + eid + " GROUP BY FilenameP HAVING COUNT(*)>1", sql);
                        cmd.CommandTimeout = 0;
                        SqlDataReader r = cmd.ExecuteReader();

                        bool have_rows = r.HasRows;
                        r.Close();

                        if (!have_rows)
                        {
                            cmd = new SqlCommand("SELECT TOP 1 COUNT(*) as Count,FilenameP FROM JobQueue WHERE ExperimentID=" + eid + " GROUP BY FilenameP HAVING COUNT(*)>1", sql);
                            cmd.CommandTimeout = 0;
                            r = cmd.ExecuteReader();
                            have_rows = r.HasRows;
                            r.Close();
                        }

                        if (!have_rows)
                        {
                            cmd = new SqlCommand("SELECT COUNT(*) FROM JobQueue " +
                                                    "WHERE " +
                                                    "ExperimentID=" + eid + " AND " +
                                                    "ID in (SELECT JobQueue.ID " +
                                                        "FROM JobQueue, Data  " +
                                                        "WHERE " +
                                                        "JobQueue.ExperimentID=" + eid + " AND " +
                                                        "Data.ExperimentID=" + eid + " AND " +
                                                        "Data.FilenameP = JobQueue.FilenameP); ", sql);
                            cmd.CommandTimeout = 0;
                            r = cmd.ExecuteReader();
                            if (r.HasRows && r.Read())
                                have_rows = ((int)r[0]) != 0;
                            r.Close();
                        }
                        else
                        {
                            Dispatcher.Invoke(new Action(() =>
                            {
                                Duplicates dlg = new Duplicates(eid,
                                    mnuOptResolveTimeoutDupes.IsChecked,
                                    mnuOptResolveSameTimeDupes.IsChecked,
                                    mnuOptResolveSlowestDupes.IsChecked,
                                    sql);
                                dlg.Owner = this;
                                dlg.ShowDialog();
                                zero_duplicates = false;
                            }
                            ));
                        }
                    }).Go();
            }

            if (zero_duplicates)
            {
                System.Windows.MessageBox.Show(this,
                            "There are no duplicates to resolve.", "No duplicates.",
                            System.Windows.MessageBoxButton.OK,
                            System.Windows.MessageBoxImage.Information);
            }
            else
                updateDataGrid();

            Mouse.OverrideCursor = null;
        }

        private void canShowTally(object Sender, CanExecuteRoutedEventArgs e)
        {
            e.CanExecute = dataGrid.SelectedItems.Count > 0;
        }

        private void showTally(object sender, ExecutedRoutedEventArgs e)
        {
            Mouse.OverrideCursor = System.Windows.Input.Cursors.Wait;

            double total = 0.0; // in hours

            foreach (DataRowView drv in dataGrid.SelectedItems)
            {
                int id = (int)drv["ID"];
                ensureConnected();
                SqlCommand cmd = new SqlCommand("SELECT SUM(Runtime)/3600 FROM Data WHERE ExperimentID=" + id, sql);
                cmd.CommandTimeout = 0;
                SqlDataReader r = cmd.ExecuteReader();
                while (r.Read())
                    total += (r[0] == DBNull.Value) ? 0.0 : (double)r[0];
                r.Close();
            }

            TimeSpan ts = TimeSpan.FromHours(total);

            System.Windows.MessageBox.Show(this,
                           "The total amount of runtime spent computing the selected results is " + ts.ToString() + ".", "Tally",
                           System.Windows.MessageBoxButton.OK,
                           System.Windows.MessageBoxImage.Information);

            Mouse.OverrideCursor = null;
        }

        private void canShowRecovery(object Sender, CanExecuteRoutedEventArgs e)
        {
            e.CanExecute = dataGrid.SelectedItems.Count > 0;
        }

        private void showRecovery(object sender, ExecutedRoutedEventArgs e)
        {
            RecoveryDialog dlg = new RecoveryDialog();
            dlg.Owner = this;
            if (dlg.ShowDialog() == true)
            {
                foreach (DataRowView drv in dataGrid.SelectedItems)
                {
                    int jobid = (int)drv["ID"];
                    string cluster = dlg.txtRCluster.Text;
                    int numWorkers = Convert.ToInt32(dlg.txtNumWorkers.Text);
                    int priority = dlg.cmbPriority.SelectedIndex;
                    string executor = dlg.txtExecutor.Text;
                    string jobTemplate = dlg.txtJobTemplate.Text;
                    int jobTimeout = dlg.timeJob.Value.HasValue ? Convert.ToInt32(dlg.timeJob.Value.Value.TotalSeconds) : 0;
                    int taskTimeout = dlg.timeTask.Value.HasValue ? Convert.ToInt32(dlg.timeTask.Value.Value.TotalSeconds) : 0;

                    Submission sdlg = new Submission(txtDatabase.Text, jobid, cluster, jobTemplate, numWorkers, priority, executor, jobTimeout, taskTimeout);
                    sdlg.Owner = this;
                    sdlg.ShowDialog();

                    if (sdlg.lastError != null)
                    {
                        System.Windows.MessageBox.Show(this, sdlg.lastError.Message, "Error",
                                                       System.Windows.MessageBoxButton.OK,
                                                       System.Windows.MessageBoxImage.Error);
                        break;
                    }
                }

                updateState();
            }
        }

        private void canChangePriority(object Sender, CanExecuteRoutedEventArgs e)
        {
            e.CanExecute = dataGrid.SelectedItems.Count > 0;
        }

        private void showChangePriority(object sender, ExecutedRoutedEventArgs e)
        {
            ChangePriorityDialog dlg = new ChangePriorityDialog();
            dlg.Owner = this;
            if (dlg.ShowDialog() == true)
            {
                Mouse.OverrideCursor = System.Windows.Input.Cursors.Wait;
                double total = (double)dataGrid.SelectedItems.Count;
                IList drviews = dataGrid.SelectedItems;
                bool stop = false;

                for (int i = 0; i < total && !stop; i++)
                {
                    new Progress(this, dataGrid.SelectedItems.Count, "Changing priority",
                        (sndr, ea) =>
                        {
                            ProgressWorker w = (ProgressWorker)sndr;
                            Object[] args = (Object[])ea.Argument;
                            DataRowView drv = (DataRowView)drviews[i];
                            int eid = (int)drv["ID"];

                            ensureConnected();
                            SqlCommand cmd = new SqlCommand("SELECT Cluster, ClusterJobID FROM Experiments WHERE ID=" + eid, sql);
                            cmd.CommandTimeout = 0;
                            SqlDataReader r = cmd.ExecuteReader();

                            try
                            {
                                if (r.Read())
                                {
                                    string cluster = (string)r["Cluster"];
                                    int cjid = (int)r["ClusterJobID"];

                                    Scheduler scheduler = new Scheduler();
                                    scheduler.Connect(cluster);
                                    ISchedulerJob job = scheduler.OpenJob(Convert.ToInt32(cjid));

                                    JobState state = job.State;
                                    if (state == JobState.Configuring ||
                                        state == JobState.Queued ||
                                        state == JobState.Running ||
                                        state == JobState.Submitted ||
                                        state == JobState.Validating)
                                    {
                                        switch (dlg.cmbPriority.SelectedIndex)
                                        {
                                            case 0: job.Priority = JobPriority.Lowest; break;
                                            case 1: job.Priority = JobPriority.BelowNormal; break;
                                            case 3: job.Priority = JobPriority.AboveNormal; break;
                                            case 4: job.Priority = JobPriority.Highest; break;
                                            default: job.Priority = JobPriority.Normal; break;
                                        }

                                        job.Commit();
                                    }
                                }

                                r.Close();

                                if (w.WorkerReportsProgress)
                                    w.ReportProgress((int)(100.0 * ((double)i / total)));
                            }
                            catch (Exception ex)
                            {
                                Dispatcher.Invoke(new Action(() =>
                                {
                                    System.Windows.MessageBox.Show(this, "Exception: " + ex.Message, "Error",
                                                                   MessageBoxButton.OK, MessageBoxImage.Error);
                                }));
                            }
                        }).Go();
                }
            }

            Mouse.OverrideCursor = null;
        }

        private void canShowRequeueIErrorsCommand(object Sender, CanExecuteRoutedEventArgs e)
        {
            e.CanExecute = dataGrid.SelectedItems.Count > 0;
        }
        private void showRequeueIErrorsCommand(object sender, ExecutedRoutedEventArgs e)
        {
            int ie_cnt = 0;
            ensureConnected();
            SqlTransaction t = sql.BeginTransaction();

            try
            {
                Mouse.OverrideCursor = System.Windows.Input.Cursors.Wait;

                double total = (double)dataGrid.SelectedItems.Count;
                IList drviews = dataGrid.SelectedItems;
                bool stop = false;

                for (int i = 0; i < total && !stop; i++)
                {
                    Progress p = new Progress(this, dataGrid.SelectedItems.Count, "Requeueing",
                        (sndr, ea) =>
                        {
                            ProgressWorker w = (ProgressWorker)sndr;
                            Object[] args = (Object[])ea.Argument;

                            DataRowView drv = (DataRowView)drviews[i];
                            int eid = (int)drv["ID"];

                            ensureConnected();
                            SqlCommand cmd = new SqlCommand("SELECT Data.ID, Strings.s as Filename FROM Data, Strings WHERE FilenameP=Strings.ID AND ExperimentID=" + eid + " AND ResultCode=4 AND (stderr like 'INFRASTRUCTURE ERROR%' OR ReturnValue=-1073741515)", sql, t);
                            cmd.CommandTimeout = 0;
                            SqlDataReader r = cmd.ExecuteReader();
                            Dictionary<int, string> d = new Dictionary<int, string>();
                            while (r.Read())
                            {
                                d[(int)r["ID"]] = (string)r["Filename"];
                            }
                            r.Close();

                            int count = d.Count;
                            if (count > 0)
                            {
                                string tmpCmd = "";
                                int j = 0;
                                foreach (KeyValuePair<int, string> kvp in d)
                                {
                                    tmpCmd += "EXECUTE AQ " + eid + ",'" + kvp.Value + "'; DELETE FROM Data WHERE ID=" + kvp.Key + "; ";
                                    j++;

                                    if (w.WorkerReportsProgress)
                                        w.ReportProgress((int)(100.0 * ((double)j / (double)d.Count)));

                                    if (j % 25 == 0)
                                    {
                                        cmd = new SqlCommand(tmpCmd, sql, t);
                                        cmd.CommandTimeout = 0;
                                        cmd.ExecuteNonQuery();

                                        t.Commit();
                                        t = sql.BeginTransaction();
                                        tmpCmd = "";
                                        count -= 25;
                                        ie_cnt += 25;
                                    }

                                    if (w.CancellationPending == true)
                                    {
                                        ea.Cancel = true;
                                        stop = true;
                                        return;
                                    }
                                }

                                cmd = new SqlCommand(tmpCmd, sql, t);
                                cmd.CommandTimeout = 0;
                                cmd.ExecuteNonQuery();

                                ie_cnt += count;
                                t.Commit();
                                t = sql.BeginTransaction();
                            }
                        });

                    p.Go();
                }
                Mouse.OverrideCursor = null;

                System.Windows.MessageBox.Show(this, "Re-queued " + ie_cnt + " infrastructure errors.", "Infrastructure errors",
                                                MessageBoxButton.OK, MessageBoxImage.Information);
                t.Dispose();
            }
            catch (Exception ex)
            {
                System.Windows.MessageBox.Show(this, "Exception: " + ex.Message, "Error",
                                                MessageBoxButton.OK, MessageBoxImage.Error);
                t.Rollback();
            }
        }

        private void canShowRestartCommand(object Sender, CanExecuteRoutedEventArgs e)
        {
            e.CanExecute = dataGrid.SelectedItems.Count > 0;
        }

        private void showRestartCommand(object sender, ExecutedRoutedEventArgs e)
        {
            Mouse.OverrideCursor = System.Windows.Input.Cursors.Wait;

            try
            {
                Mouse.OverrideCursor = System.Windows.Input.Cursors.Wait;

                double total = (double)dataGrid.SelectedItems.Count;
                IList drviews = dataGrid.SelectedItems;
                bool stop = false;

                for (int i = 0; i < total && !stop; i++)
                {
                    Progress p = new Progress(this, dataGrid.SelectedItems.Count, "Restarting",
                        (sndr, ea) =>
                        {
                            ProgressWorker w = (ProgressWorker)sndr;
                            Object[] args = (Object[])ea.Argument;
                            DataRowView drv = (DataRowView)drviews[i];
                            int eid = (int)drv["ID"];

                            string sharedDir = null;
                            string cluster = null;
                            string nodegroup = null;
                            string locality = null;
                            int clusterJobID = 0;
                            string executor = null;
                            string jobTemplate = null;
                            int jobTimeout = 0;
                            int taskTimeout = 0;

                            int priority = 2;
                            int min = 1, max = 100;

                            ensureConnected();
                            SqlCommand cmd = new SqlCommand("SELECT SharedDir, Cluster, Nodegroup, Locality, ClusterJobID, Executor, JobTemplate, JobTimeout, TaskTimeout FROM Experiments WHERE ID=" + eid + ";", sql);
                            cmd.CommandTimeout = 0;
                            SqlDataReader r = cmd.ExecuteReader();
                            while (r.Read())
                            {
                                sharedDir = (string)r[0];
                                cluster = (string)r[1];
                                nodegroup = (string)r[2];
                                locality = (string)r[3];
                                clusterJobID = (int)r[4];
                                executor = (string)r[5];
                                jobTemplate = (string)r[6];
                                jobTimeout = (int)r[7];
                                taskTimeout = (int)r[8];
                            }
                            r.Close();

                            Scheduler scheduler = new Scheduler();
                            scheduler.Connect(cluster);

                            try
                            {
                                ISchedulerJob job = scheduler.OpenJob(clusterJobID);
                                switch (job.Priority)
                                {
                                    case JobPriority.Lowest: priority = 0; break;
                                    case JobPriority.BelowNormal: priority = 1; break;
                                    case JobPriority.Normal: priority = 2; break;
                                    case JobPriority.AboveNormal: priority = 3; break;
                                    case JobPriority.Highest: priority = 4; break;
                                }

                                if (locality == "Socket")
                                {
                                    min = job.MinimumNumberOfSockets;
                                    max = job.MaximumNumberOfSockets;
                                }
                                else if (locality == "Core")
                                {
                                    min = job.MinimumNumberOfCores;
                                    max = job.MaximumNumberOfCores;
                                }
                                else if (locality == "Node")
                                {
                                    min = job.MinimumNumberOfNodes;
                                    max = job.MaximumNumberOfNodes;
                                }

                                JobState state = job.State;
                                if (state == JobState.Running || state == JobState.Queued ||
                                    state == JobState.Validating || state == JobState.Submitted ||
                                    state == JobState.ExternalValidation)
                                    scheduler.CancelJob(clusterJobID, "", true);
                            }
                            catch (SchedulerException)
                            {
                                // OK, job doesn't exist anymore.
                            }
                            catch (Exception ex)
                            {
                                Dispatcher.Invoke(new Action(() =>
                                    System.Windows.MessageBox.Show(this, "Exception: " + ex.Message, "Error",
                                                            MessageBoxButton.OK, MessageBoxImage.Error)));
                                return;
                            }

                            cmd = new SqlCommand("DELETE FROM Data WHERE ExperimentID=" + eid + ";" +
                                                 "DELETE FROM JobQueue WHERE ExperimentID=" + eid + ";", sql);
                            cmd.CommandTimeout = 0;
                            cmd.ExecuteNonQuery();

                            scheduler.Close();

                            string wrkrpath = System.IO.Path.Combine(sharedDir, executor);
                            if (!File.Exists(wrkrpath))
                            {
                                string exc = (string)Registry.GetValue(keyName, "Executor", "");
                                File.Copy(exc, wrkrpath, true);
                            }

                            if (w.CancellationPending == true)
                            {
                                stop = true;
                            }

                            Dispatcher.Invoke(new Action(() =>
                            {
                                WindowInteropHelper helper = new WindowInteropHelper(this);
                                SubmissionWorker sw = new SubmissionWorker(helper.Handle, 0);
                                sw.SubmitHPCJob(txtDatabase.Text, true, eid,
                                                cluster, nodegroup, priority,
                                                locality, min.ToString(), max.ToString(),
                                                sharedDir, executor, jobTemplate,
                                                jobTimeout, taskTimeout);
                            }));

                            if (w.WorkerReportsProgress)
                                w.ReportProgress((int)(100.0 * ((double)i / (double)total)));
                        });

                    p.Go();
                }
            }
            catch (Exception ex)
            {
                System.Windows.MessageBox.Show(this, "Exception: " + ex.Message, "Error",
                                                MessageBoxButton.OK, MessageBoxImage.Error);
            }

            Mouse.OverrideCursor = null;
        }

        private void canShowSaveMatrix(object sender, CanExecuteRoutedEventArgs e)
        {
            if (sql == null || dataGrid.SelectedItems.Count <= 1)
            {
                e.CanExecute = false;
                return;
            }
            else
            {
                string rc = (string)((DataRowView)dataGrid.SelectedItems[0])["Category"];
                foreach (DataRowView si in dataGrid.SelectedItems)
                {
                    if ((string)(si["Category"]) != rc)
                    {
                        e.CanExecute = false;
                        return;
                    }
                }
            }

            e.CanExecute = true;
        }

        private void MakeMatrix(StreamWriter f, string condition, string name, string filter)
        {
            int numItems = dataGrid.SelectedItems.Count;

            f.WriteLine(@"\begin{table}");
            f.WriteLine(@"  \centering");
            f.Write(@"  \begin{tabular}[h]{|l|");
            for (int i = 0; i < numItems; i++)
                f.Write(@"c|");
            f.WriteLine(@"}\cline{2-" + (numItems + 1) + "}");

            // Header line
            f.Write(@"    \multicolumn{1}{c|}{}");
            for (int i = 0; i < numItems; i++)
            {
                f.Write(@" & \rotatebox{90}{" +
                        ((string)((DataRowView)dataGrid.SelectedItems[i])["Note"]).Replace(@"\", @"\textbackslash ").Replace(@"_", @"\_") +
                        @"}");
            }
            f.WriteLine(@"\\\hline\hline");

            int example_value = 0;
            for (int i = 0; i < numItems; i++)
            {
                DataRowView rowI = (DataRowView)dataGrid.SelectedItems[i];
                f.Write(@"    " + ((string)rowI["Note"]).Replace(@"\", @"\textbackslash ").Replace(@"_", @"\_"));
                for (int j = 0; j < numItems; j++)
                {
                    if (i == j)
                        f.Write(@" & $\pm 0$");
                    else
                    {
                        DataRowView colJ = (DataRowView)dataGrid.SelectedItems[j];

                        ensureConnected();
                        SqlCommand cmd = new SqlCommand(
                            "SELECT COUNT(*) " +
                            "FROM Data as x, Data as y, Strings " +
                            "WHERE x.ExperimentID = " + rowI["ID"] + " AND " +
                            "y.ExperimentID = " + colJ["ID"] + " AND " +
                            "x.FilenameP = y.FilenameP AND " +
                            "x.Filenamep = Strings.ID AND " +
                            ((filter != "") ? "Strings.s LIKE '%" + filter + "%' AND " : "") +
                            condition + " AND " +
                            "(" +
                            " (x.ResultCode = 0 AND y.ResultCode <> 0) OR " +
                            " (x.ResultCode = 0 AND y.ResultCode = 0 AND x.Runtime < y.Runtime) " +
                            ") ", sql);
                        cmd.CommandTimeout = 0;
                        SqlDataReader rd = cmd.ExecuteReader();
                        while (rd.Read())
                        {
                            int q = (int)rd[0];
                            f.Write(@" & $" + (q > 0 ? @"+" : (q == 0) ? @"\pm" : @"") + q.ToString() + "$");
                            if (i == 1 && j == 0) example_value = q;
                        }
                        rd.Close();
                    }
                }

                f.WriteLine(@"\\\hline");
            }

            f.WriteLine(@"  \end{tabular}");
            f.Write(@"  \caption{\label{tbl:mtrx} " + name + " Matrix. ");
            f.Write(@"For instance, '" + ((DataRowView)dataGrid.SelectedItems[1])["Note"] + "' " +
                     "outperforms '" + ((DataRowView)dataGrid.SelectedItems[0])["Note"] + "' " +
                     "on " + example_value + " benchmarks. ");
            if (filter != "")
                f.Write("Filtered by '*" + filter.Replace(@"\", @"\textbackslash ").Replace(@"_", @"\_") + "*'.");
            f.WriteLine(@"}");
            f.WriteLine(@"\end{table}");
        }

        private void showSaveMatrix(object target, ExecutedRoutedEventArgs e)
        {
            System.Windows.Forms.SaveFileDialog dlg = new System.Windows.Forms.SaveFileDialog();
            dlg.Filter = "LaTeX files (*.tex)|*.tex|All files (*.*)|*.*";
            dlg.FilterIndex = 1;
            dlg.RestoreDirectory = true;
            dlg.FileName = "matrix.tex";

            if (dlg.ShowDialog() == System.Windows.Forms.DialogResult.OK)
            {
                Mouse.OverrideCursor = System.Windows.Input.Cursors.Wait;

                using (StreamWriter f = new StreamWriter(dlg.FileName, false))
                {
                    f.WriteLine("% -*- mode: latex; TeX-master: \"main.tex\"; -*-");
                    f.WriteLine();

                    MakeMatrix(f, "((x.SAT + y.SAT > 0) OR (x.UNSAT + y.UNSAT > 0))", "SAT+UNSAT", @"");
                    MakeMatrix(f, "(x.SAT + y.SAT > 0)", "SAT", @"");
                    MakeMatrix(f, "(x.UNSAT + y.UNSAT > 0)", "UNSAT", @"");
                }

                Mouse.OverrideCursor = null;
            }
        }


        private void MenuItemExit_Click(object sender, RoutedEventArgs e)
        {
            Close();
        }

        private void cannShowNewCatchall(object Sender, CanExecuteRoutedEventArgs e)
        {
            e.CanExecute = true;
        }

        private void showNewCatchall(object sender, RoutedEventArgs e)
        {
            CatchallDialog dlg = new CatchallDialog();
            dlg.Owner = this;
            if (dlg.ShowDialog() == true)
            {
                int jobTimeout = dlg.timeJob.Value.HasValue ? Convert.ToInt32(dlg.timeJob.Value.Value.TotalSeconds) : 0;
                int taskTimeout = dlg.timeTask.Value.HasValue ? Convert.ToInt32(dlg.timeTask.Value.Value.TotalSeconds) : 0;

                Submission sdlg = new Submission(txtDatabase.Text,
                                                 dlg.txtCluster.Text,
                                                 dlg.cmbLocality.Text,
                                                 dlg.cmbPriority.SelectedIndex,
                                                 dlg.cmbNodeGroup.Text,
                                                 dlg.txtExecutor.Text,
                                                 dlg.txtLimitMin.Text,
                                                 dlg.txtLimitMax.Text,
                                                 dlg.txtJobTemplate.Text,
                                                 jobTimeout, taskTimeout);

                sdlg.Owner = this;
                sdlg.ShowDialog();

                if (sdlg.lastError != null)
                {
                    System.Windows.MessageBox.Show(this, sdlg.lastError.Message, "Error",
                                                   System.Windows.MessageBoxButton.OK,
                                                   System.Windows.MessageBoxImage.Error);
                }

                updateState();
            }
        }


        private void showPurgeOrphans(object sender, RoutedEventArgs e)
        {
            Mouse.OverrideCursor = System.Windows.Input.Cursors.Wait;
            ensureConnected();
            SqlCommand cmd = new SqlCommand("DELETE FROM Binaries WHERE ID NOT IN (SELECT Binaries.ID FROM Experiments, Binaries WHERE Experiments.Binary = Binaries.ID)", sql);
            cmd.CommandTimeout = 0;
            cmd.ExecuteNonQuery();
            Mouse.OverrideCursor = null;
        }

        private void mnuOptProgress_Checked(object sender, RoutedEventArgs e)
        {
            int c = dataGrid.Columns.Count();
            dataGrid.Columns[c - 1].Visibility = System.Windows.Visibility.Visible;
            dataGrid.Columns[c - 2].Visibility = System.Windows.Visibility.Visible;
            dataGrid.Columns[c - 3].Visibility = System.Windows.Visibility.Visible;
            dataGrid.Columns[c - 4].Visibility = System.Windows.Visibility.Visible;
            dataGrid.Columns[c - 5].Visibility = System.Windows.Visibility.Visible;

            updateDataGrid();
        }

        private void mnuOptProgress_Unchecked(object sender, RoutedEventArgs e)
        {
            int c = dataGrid.Columns.Count();
            dataGrid.Columns[c - 1].Visibility = System.Windows.Visibility.Hidden;
            dataGrid.Columns[c - 2].Visibility = System.Windows.Visibility.Hidden;
            dataGrid.Columns[c - 3].Visibility = System.Windows.Visibility.Hidden;
            dataGrid.Columns[c - 4].Visibility = System.Windows.Visibility.Hidden;
            dataGrid.Columns[c - 5].Visibility = System.Windows.Visibility.Hidden;

            updateDataGrid();
        }
        private void canShowSaveOutput(object sender, CanExecuteRoutedEventArgs e)
        {
            e.CanExecute = dataGrid.SelectedItems.Count == 1;
        }

        private void showSaveOutput(object sender, ExecutedRoutedEventArgs e)
        {
            Mouse.OverrideCursor = System.Windows.Input.Cursors.Wait;
            System.Windows.Forms.FolderBrowserDialog dlg = new System.Windows.Forms.FolderBrowserDialog();
            dlg.ShowNewFolderButton = true;
            if (dlg.ShowDialog() == System.Windows.Forms.DialogResult.OK)
            {
                DataRowView drv = (DataRowView)dataGrid.SelectedItems[0];
                int eid = (int)drv["ID"];
                string drctry = string.Format(@"{0}\{1}", dlg.SelectedPath, eid.ToString());
                double total = 0.0;

                Directory.CreateDirectory(drctry);
                ensureConnected();
                SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM Data WHERE ExperimentID=" + eid, sql);
                cmd.CommandTimeout = 0;
                cmd.ExecuteNonQuery();

                SqlDataReader r = cmd.ExecuteReader();
                if (r.Read())
                    total = (double)(int)r[0];
                r.Close();

                List<string> filenames = new List<string>();
                List<int> data_ids = new List<int>();
                cmd = new SqlCommand(
                    "SELECT Data.ID as ID, Strings.s as Filename " +
                    "FROM Data, Strings " +
                    "WHERE " +
                    "Data.ExperimentID=" + eid + " AND " +
                    "Strings.ID = Data.FilenameP", sql);
                cmd.CommandTimeout = 0;
                r = cmd.ExecuteReader();
                while (r.Read())
                {
                    data_ids.Add((int)r["ID"]);
                    filenames.Add((string)r["Filename"]);
                }
                r.Close();

                Progress p = new Progress(this, (int)total, "Saving",
                    (sndr, ea) =>
                    {
                        ProgressWorker w = (ProgressWorker)sndr;

                        for (int i = 0; i < data_ids.Count(); i++)
                        {
                            int did = data_ids[i];
                            string filename = filenames[i];

                            ensureConnected();
                            cmd = new SqlCommand("SELECT stdout, stderr FROM Data WHERE ID=" + did, sql);
                            cmd.CommandTimeout = 0;
                            r = cmd.ExecuteReader();
                            if (r.Read())
                            {
                                UTF8Encoding enc = new UTF8Encoding();
                                string stdout = (string)r["stdout"];
                                string stderr = (string)r["stderr"];
                                string path = drctry + @"\" + filename;
                                Directory.CreateDirectory(path.Substring(0, path.LastIndexOf(@"\")));

                                if (stdout != null && stdout.Length > 0)
                                {
                                    FileStream stdoutf = File.Open(path + ".out.txt", FileMode.OpenOrCreate);
                                    stdoutf.Write(enc.GetBytes(stdout), 0, enc.GetByteCount(stdout));
                                    stdoutf.Close();
                                }

                                if (stderr != null && stderr.Length > 0)
                                {
                                    FileStream stderrf = File.Open(path + ".err.txt", FileMode.OpenOrCreate);
                                    stderrf.Write(enc.GetBytes(stderr), 0, enc.GetByteCount(stderr));
                                    stderrf.Close();
                                }
                            }
                            r.Close();

                            if (w.WorkerReportsProgress)
                                w.ReportProgress((int)(100.0 * ((double)i / total)));
                        }
                    });

                p.Go();

                Mouse.OverrideCursor = null;
            }

        }
    }
}