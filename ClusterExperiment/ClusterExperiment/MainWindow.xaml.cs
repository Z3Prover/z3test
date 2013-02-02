using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using System.Collections;
using System.Data;
using System.Data.SqlClient;
using System.Security.Principal;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Interop;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Windows.Threading;
using System.Windows.Forms;
using Microsoft.Hpc.Scheduler;
using Microsoft.Hpc.Scheduler.Properties;
using Microsoft.Win32;

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

        public MainWindow()
        {
            InitializeComponent();

            CommandBinding customCommandBinding = new CommandBinding(CompareCommand, showCompare, canShowCompare);
            CommandBindings.Add(customCommandBinding);
            customCommandBinding = new CommandBinding(CopyCommand, showCopy, canShowCopy);
            CommandBindings.Add(customCommandBinding);
            customCommandBinding = new CommandBinding(MoveCommand, showMove, canShowMove);
            CommandBindings.Add(customCommandBinding);
            customCommandBinding = new CommandBinding(ScatterplotCommand, showScatterplot, canShowScatterplot);
            CommandBindings.Add(customCommandBinding);

            Loaded += new RoutedEventHandler(MainWindow_Loaded);
        }

        void MainWindow_Loaded(object sender, RoutedEventArgs e)
        {
            string[] args = Environment.GetCommandLineArgs();
            if (args.Count() >= 2)
            {
                txtDatabase.Text = args[1];
                doConnect();
            }
            else
                txtDatabase.Text = (string)Registry.GetValue(keyName, "Database", "");
        }

        void updateDataGrid()
        {
            Mouse.OverrideCursor = System.Windows.Input.Cursors.Wait;

            SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM TitleScreen ORDER BY SubmissionTime DESC", sql);
            DataSet ds = new DataSet();
            da.Fill(ds, "Experiments");
            dataGrid.ItemsSource = ds.Tables[0].DefaultView;

            Mouse.OverrideCursor = null;
        }

        private void doConnect()
        {
            Submission dlg;

            if (sql != null && sql.State == ConnectionState.Open)
                dlg = new Submission(sql);
            else
                dlg = new Submission(txtDatabase.Text);

            dlg.Owner = this;
            dlg.ShowDialog();
            sql = dlg.returnSQL;

            if (dlg.lastError != null)
                System.Windows.MessageBox.Show(this, dlg.lastError.Message, "Error",
                   System.Windows.MessageBoxButton.OK,
                   System.Windows.MessageBoxImage.Error);

            updateState();
        }

        private void btnConnect_Click(object sender, RoutedEventArgs e)
        {
            Mouse.OverrideCursor = System.Windows.Input.Cursors.Wait;
            IsEnabled = false;

            doConnect();

            IsEnabled = true;
            Mouse.OverrideCursor = null;
        }

        private void OnClosing(object sender, System.ComponentModel.CancelEventArgs e)
        {
            Registry.SetValue(keyName, "Database", txtDatabase.Text, RegistryValueKind.String);
        }

        private void btnNewJob_Click(object sender, RoutedEventArgs e)
        {
            NewJobDialog dlg = new NewJobDialog();
            dlg.Owner = this;
            if (dlg.ShowDialog() == true)
            {
                string bin = dlg.txtExecutable.Text;
                if (dlg.chkMostRecentBinary.IsChecked == true)
                    bin = "";
                Submission sdlg = new Submission(txtDatabase.Text, dlg.txtCategories.Text,
                                                 dlg.txtSharedDir.Text,
                                                 dlg.txtMemout.Text, dlg.txtTimeout.Text, dlg.txtExecutor.Text,
                                                 bin, dlg.txtParameters.Text,
                                                 dlg.txtCluster.Text, dlg.cmbNodeGroup.Text, dlg.cmbLocality.Text,
                                                 WindowsIdentity.GetCurrent().Name.ToString(),
                                                 dlg.cmbPriority.SelectedIndex,
                                                 dlg.txtExtension.Text, dlg.txtNote.Text,
                                                 dlg.chkParametricity.IsChecked == true,
                                                 dlg.txtParametricityFrom.Text,
                                                 dlg.txtParametricityTo.Text,
                                                 dlg.txtParametricityStep.Text);
                sdlg.Owner = this;
                sdlg.ShowDialog();

                if (sdlg.lastError != null)
                    System.Windows.MessageBox.Show(this, sdlg.lastError.Message, "Error",
                    System.Windows.MessageBoxButton.OK,
                    System.Windows.MessageBoxImage.Error);

                updateState();
            }
        }

        void updateState()
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

            ShowResults r = new ShowResults(id, sql);
            // r.Owner = this;

            r.Show();
            Mouse.OverrideCursor = null;
        }

        private void btnUpdate_Click(object sender, RoutedEventArgs e)
        {
            Mouse.OverrideCursor = System.Windows.Input.Cursors.Wait;
            updateDataGrid();
            Mouse.OverrideCursor = null;
        }

        void showProperties(object target, ExecutedRoutedEventArgs e)
        {
            Mouse.OverrideCursor = System.Windows.Input.Cursors.Wait;

            DataRowView rowView = (DataRowView)dataGrid.SelectedItem;
            int id = (int)rowView["ID"];
            ExperimentProperties dlg = new ExperimentProperties(id, sql);

            dlg.Owner = this;
            dlg.Show();

            Mouse.OverrideCursor = null;
        }

        void deleteExperiment(object target, ExecutedRoutedEventArgs e)
        {
            Mouse.OverrideCursor = System.Windows.Input.Cursors.Wait;

            System.Windows.MessageBoxResult r =
              System.Windows.MessageBox.Show("Are you sure you want to delete the selected experiments?", "Sure?", MessageBoxButton.YesNo, MessageBoxImage.Question, MessageBoxResult.No);

            if (r == System.Windows.MessageBoxResult.Yes)
            {
                for (int i = 0; i < dataGrid.SelectedItems.Count; i++)
                {
                    DataRowView rowView = (DataRowView)dataGrid.SelectedItems[i];
                    int id = (int)rowView["ID"];

                    SqlCommand cmd = new SqlCommand("SELECT Cluster,ClusterJobID,SharedDir,Executor FROM Experiments WHERE ID=" + id.ToString(), sql);
                    cmd.CommandTimeout = 0;
                    SqlDataReader rd = cmd.ExecuteReader();

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
            }

            Mouse.OverrideCursor = null;

            updateDataGrid();
        }

        void showCompare(object target, ExecutedRoutedEventArgs e)
        {
            Mouse.OverrideCursor = System.Windows.Input.Cursors.Wait;

            DataRowView rowView = (DataRowView)dataGrid.SelectedItems[0];
            int id1 = (int)rowView["ID"];
            rowView = (DataRowView)dataGrid.SelectedItems[1];
            int id2 = (int)rowView["ID"];

            CompareExperiments dlg = new CompareExperiments(id1, id2, sql);
            //Scatterplot dlg = new Scatterplot(id1, id2, sql);
            dlg.Show();

            Mouse.OverrideCursor = null;
        }


        void showScatterplot(object target, ExecutedRoutedEventArgs e)
        {
            Mouse.OverrideCursor = System.Windows.Input.Cursors.Wait;

            DataRowView rowView = (DataRowView)dataGrid.SelectedItems[0];
            int id1 = (int)rowView["ID"];
            rowView = (DataRowView)dataGrid.SelectedItems[1];
            int id2 = (int)rowView["ID"];

            Scatterplot sp = new Scatterplot(id1, id2, sql);
            sp.Show();

            Mouse.OverrideCursor = null;
        }

        void showSave(object target, ExecutedRoutedEventArgs e)
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

                DataRowView rowView = (DataRowView)dataGrid.SelectedItems[0];
                int pivot_id = (int)rowView["ID"];
                string cmdStr = "SELECT s as Filename,";
                string selectStr = "j_" + pivot_id + ".Returnvalue as R" + pivot_id + ",j_" + pivot_id + ".Runtime as T" + pivot_id + 
                                   ",j_" + pivot_id + ".SAT as SAT" + pivot_id + ",j_" + pivot_id + ".UNSAT as UNSAT" + pivot_id;
                string fromStr = "FROM Strings, Data as j_" + pivot_id + "";
                string condStr = "WHERE j_" + pivot_id + ".FilenameP=Strings.ID AND j_" + pivot_id + ".ExperimentID=" + pivot_id;

                for (int i = 1; i < dataGrid.SelectedItems.Count; i++)
                {
                    rowView = (DataRowView)dataGrid.SelectedItems[i];
                    int id = (int)rowView["ID"];

                    selectStr += ",j_" + id + ".Returnvalue as R" + id + ",j_" + id + ".Runtime as T" + id +
                                 ",j_" + id + ".SAT as SAT" + id + ",j_" + id + ".UNSAT as UNSAT" + id;
                    fromStr += ", Data as j_" + id;
                    condStr += " AND j_" + id + ".ExperimentID=" + id + " AND j_" + id + ".FilenameP=j_" + pivot_id + ".FilenameP";
                }

                cmdStr += selectStr + " " + fromStr + " " + condStr + " ORDER BY Filename";

                f.Write(",");
                for (int i = 0; i < dataGrid.SelectedItems.Count; i++)
                {
                    rowView = (DataRowView)dataGrid.SelectedItems[i];
                    int id = (int)rowView["ID"];
                    SqlCommand c = new SqlCommand("SELECT Parameters FROM Experiments WHERE ID=" + id.ToString(), sql);
                    SqlDataReader rd = c.ExecuteReader();                    
                    if (rd.Read())
                        f.Write((string)rd[0]);                    
                    rd.Close();
                    f.Write(",,,,");
                }
                f.WriteLine();

                SqlCommand cmd = new SqlCommand(cmdStr, sql);
                SqlDataReader r = cmd.ExecuteReader();

                for (int i = 0; i < r.FieldCount; i++)
                    f.Write(r.GetName(i) + ",");
                f.WriteLine();

                while (r.Read())
                {
                    for (int i = 0; i < r.FieldCount; i++)
                        f.Write(r[i] + ",");
                    f.WriteLine();
                }

                r.Close();
                f.Close();
            }

            Mouse.OverrideCursor = null;
        }

        void canShowProperties(object sender, CanExecuteRoutedEventArgs e)
        {
            e.CanExecute = (sql != null) && (dataGrid.SelectedItems.Count == 1);
        }

        void canDeleteExperiment(object sender, CanExecuteRoutedEventArgs e)
        {
            e.CanExecute = (sql != null) && (dataGrid.SelectedItems.Count >= 1);
        }

        void canShowCompare(object sender, CanExecuteRoutedEventArgs e)
        {
            e.CanExecute = (sql != null) && (dataGrid.SelectedItems.Count == 2);
        }

        void canShowScatterplot(object sender, CanExecuteRoutedEventArgs e)
        {
            e.CanExecute = (sql != null) && (dataGrid.SelectedItems.Count == 2);
        }

        void canSave(object Sender, CanExecuteRoutedEventArgs e)
        {
            e.CanExecute = (sql != null) && (dataGrid.SelectedItems.Count >= 1);
        }

        void showCopy(object target, ExecutedRoutedEventArgs e)
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

                Submission sdlg = new Submission(txtDatabase.Text, backupDB, jobIDs, false /* no move */);
                sdlg.Owner = this;
                sdlg.ShowDialog();

                if (sdlg.lastError != null)
                    System.Windows.MessageBox.Show(this, sdlg.lastError.Message, "Error",
                    System.Windows.MessageBoxButton.OK,
                    System.Windows.MessageBoxImage.Error);
            }
        }

        void canShowCopy(object Sender, CanExecuteRoutedEventArgs e)
        {
            e.CanExecute = (sql != null) && (dataGrid.SelectedItems.Count >= 1);
        }

        void showMove(object target, ExecutedRoutedEventArgs e)
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

                Submission sdlg = new Submission(txtDatabase.Text, backupDB, jobIDs, true);
                sdlg.Owner = this;
                sdlg.ShowDialog();

                if (sdlg.lastError != null)
                    System.Windows.MessageBox.Show(this, sdlg.lastError.Message, "Error",
                    System.Windows.MessageBoxButton.OK,
                    System.Windows.MessageBoxImage.Error);
            }
        }

        void canShowMove(object Sender, CanExecuteRoutedEventArgs e)
        {
            e.CanExecute = (sql != null) && (dataGrid.SelectedItems.Count >= 1);
        }
    }
}