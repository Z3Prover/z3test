using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace ClusterExperiment
{
    /// <summary>
    /// Interaction logic for ShowResults.xaml
    /// </summary>
    public partial class ShowResults : Window
    {
        public SqlConnection sql = null;
        int experimentID = 0;
        string timeout;
        string basedir = "";

        public static RoutedCommand ReclassifyOK = new RoutedCommand();
        public static RoutedCommand ReclassifyBug = new RoutedCommand();
        public static RoutedCommand ReclassifyError = new RoutedCommand();
        public static RoutedCommand ReclassifyTimeout = new RoutedCommand();
        public static RoutedCommand ReclassifyMemout = new RoutedCommand();
        public static RoutedCommand Requeue = new RoutedCommand();
        public static RoutedCommand CopyFilename = new RoutedCommand();

        public ShowResults(int experimentID, SqlConnection sql)
        {
            InitializeComponent();
            this.sql = sql;
            this.experimentID = experimentID;

            CommandBinding customCommandBinding = new CommandBinding(ReclassifyOK, showReclassifyOK, canShowReclassify);
            CommandBindings.Add(customCommandBinding);
            customCommandBinding = new CommandBinding(ReclassifyBug, showReclassifyBug, canShowReclassify);
            CommandBindings.Add(customCommandBinding);
            customCommandBinding = new CommandBinding(ReclassifyError, showReclassifyError, canShowReclassify);
            CommandBindings.Add(customCommandBinding);
            customCommandBinding = new CommandBinding(ReclassifyTimeout, showReclassifyTimeout, canShowReclassify);
            CommandBindings.Add(customCommandBinding);
            customCommandBinding = new CommandBinding(ReclassifyMemout, showReclassifyMemout, canShowReclassify);
            CommandBindings.Add(customCommandBinding);
            customCommandBinding = new CommandBinding(Requeue, showRequeue, canShowRequeue);
            CommandBindings.Add(customCommandBinding);
            customCommandBinding = new CommandBinding(CopyFilename, showCopyFilename, canShowCopyFilename);
            CommandBindings.Add(customCommandBinding);

            SqlCommand cmd = new SqlCommand("SELECT Timeout, SharedDir FROM Experiments WHERE ID=" + experimentID, sql);
            SqlDataReader r = cmd.ExecuteReader();
            if (!r.Read())
                throw new Exception("Error reading from SQL connection");
            this.timeout = (string)r["Timeout"];
            this.basedir = (string)r["SharedDir"];
            r.Close();

            Title = "Experiment " + experimentID;
            txtSharedDir.Text = basedir;
            updateGrid(radioAll);
        }

        private void dataGrid_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            if (dataGrid.SelectedItems.Count != 1)
                return;

            Mouse.OverrideCursor = System.Windows.Input.Cursors.Wait;

            DataRowView rowView = (DataRowView)dataGrid.SelectedItem;
            int id = (int)rowView[0];

            ShowOutput w = new ShowOutput(id, sql);
            //w.Owner = this;

            w.Show();
            Mouse.OverrideCursor = null;
        }

        private void RadioButton_Click(object sender, RoutedEventArgs e)
        {
            updateGrid(sender);
        }

        private void updateGrid(object sender)
        {
            Mouse.OverrideCursor = System.Windows.Input.Cursors.Wait;

            retry:
            try
            {
                SqlDataAdapter da = null;

                if ((RadioButton)sender == radioAll)
                    da = new SqlDataAdapter("SELECT Data.ID as ID,Strings.s as Filename,Returnvalue,ResultCode,SAT,UNSAT,UNKNOWN,Runtime,Worker FROM Data,Strings WHERE FilenameP=Strings.ID AND ExperimentID=" + experimentID, sql);
                else if ((RadioButton)sender == radioSAT)
                    da = new SqlDataAdapter("SELECT Data.ID as ID,Strings.s as Filename,Returnvalue,ResultCode,SAT,UNSAT,UNKNOWN,Runtime,Worker FROM Data,Strings WHERE FilenameP=Strings.ID AND ResultCode=0 AND SAT>0 AND ExperimentID=" + experimentID, sql);
                else if ((RadioButton)sender == radioUNSAT)
                    da = new SqlDataAdapter("SELECT Data.ID as ID,Strings.s as Filename,Returnvalue,ResultCode,SAT,UNSAT,UNKNOWN,Runtime,Worker FROM Data,Strings WHERE FilenameP=Strings.ID AND ResultCode=0 AND UNSAT>0 AND ExperimentID=" + experimentID, sql);
                else if ((RadioButton)sender == radioUNKNOWN)
                    da = new SqlDataAdapter("SELECT Data.ID as ID,Strings.s as Filename,Returnvalue,ResultCode,SAT,UNSAT,UNKNOWN,Runtime,Worker FROM Data,Strings WHERE FilenameP=Strings.ID AND ResultCode=0 AND UNKNOWN>0 AND ExperimentID=" + experimentID, sql);
                else if ((RadioButton)sender == radioBUGS)
                    da = new SqlDataAdapter("SELECT Data.ID as ID,Strings.s as Filename,Returnvalue,ResultCode,SAT,UNSAT,UNKNOWN,Runtime,Worker FROM Data,Strings WHERE FilenameP=Strings.ID AND ResultCode=3 AND ExperimentID=" + experimentID, sql);
                else if ((RadioButton)sender == radioERROR)
                    da = new SqlDataAdapter("SELECT Data.ID as ID,Strings.s as Filename,Returnvalue,ResultCode,SAT,UNSAT,UNKNOWN,Runtime,Worker FROM Data,Strings WHERE FilenameP=Strings.ID AND ResultCode=4 AND ExperimentID=" + experimentID, sql);
                else if ((RadioButton)sender == radioMemouts)
                    da = new SqlDataAdapter("SELECT Data.ID as ID,Strings.s as Filename,Returnvalue,ResultCode,SAT,UNSAT,UNKNOWN,Runtime,Worker FROM Data,Strings WHERE FilenameP=Strings.ID AND ResultCode=6 AND ExperimentID=" + experimentID, sql);
                else if ((RadioButton)sender == radioTimeouts)
                    da = new SqlDataAdapter("SELECT Data.ID as ID,Strings.s as Filename,Returnvalue,ResultCode,SAT,UNSAT,UNKNOWN,Runtime,Worker FROM Data,Strings WHERE FilenameP=Strings.ID AND ResultCode=5 AND ExperimentID=" + experimentID, sql);
                else if ((RadioButton)sender == radioOver)
                    da = new SqlDataAdapter("SELECT Data.ID as ID,Strings.s as Filename,Returnvalue,ResultCode,SAT,UNSAT,UNKNOWN,Runtime,Worker FROM Data,Strings WHERE FilenameP=Strings.ID AND ResultCode=0 AND (SAT+UNSAT > TargetSAT+TargetUNSAT AND UNKNOWN < TargetUNKNOWN) AND ExperimentID=" + experimentID, sql);
                else if ((RadioButton)sender == radioUnder)
                    da = new SqlDataAdapter("SELECT Data.ID as ID,Strings.s as Filename,Returnvalue,ResultCode,SAT,UNSAT,UNKNOWN,Runtime,Worker FROM Data,Strings WHERE FilenameP=Strings.ID AND (SAT+UNSAT < TargetSAT+TargetUNSAT OR UNKNOWN > TargetUNKNOWN) AND ExperimentID=" + experimentID, sql);
                else if ((RadioButton)sender == radioMoreThan)
                {
                    int limit;
                    try
                    {
                        limit = Convert.ToInt32(txtSeconds.Text);
                    }
                    catch (FormatException)
                    {
                        txtSeconds.Text = "0";
                        limit = 0;
                    }
                    da = new SqlDataAdapter("SELECT Data.ID as ID,Strings.s as Filename,Returnvalue,ResultCode,SAT,UNSAT,UNKNOWN,Runtime,Worker FROM Data,Strings WHERE FilenameP=Strings.ID AND (Runtime=NULL OR Runtime >= " + limit + ") AND ExperimentID=" + experimentID, sql);
                }
                else if ((RadioButton)sender == radioOutputContains)
                    da = new SqlDataAdapter("SELECT Data.ID as ID,Strings.s as Filename,Returnvalue,ResultCode,SAT,UNSAT,UNKNOWN,Runtime,Worker FROM Data,Strings WHERE FilenameP=Strings.ID AND (stdOut LIKE '%" + txtOutputMatch.Text + "%' OR stdErr LIKE '%" + txtOutputMatch.Text + "%') AND ExperimentID=" + experimentID, sql);
                else if ((RadioButton)sender == radioFNSAT)
                    da = new SqlDataAdapter("SELECT Data.ID as ID,Strings.s as Filename,Returnvalue,ResultCode,SAT,UNSAT,UNKNOWN,Runtime,Worker FROM Data,Strings WHERE FilenameP=Strings.ID AND (Strings.s LIKE '%sat%' AND NOT Strings.s LIKE '%unsat%') AND ExperimentID=" + experimentID, sql);
                else if ((RadioButton)sender == radioFNUNSAT)
                    da = new SqlDataAdapter("SELECT Data.ID as ID,Strings.s as Filename,Returnvalue,ResultCode,SAT,UNSAT,UNKNOWN,Runtime,Worker FROM Data,Strings WHERE FilenameP=Strings.ID AND (Strings.s LIKE '%unsat%') AND ExperimentID=" + experimentID, sql);
                else if ((RadioButton)sender == radioFNTEXT)
                    da = new SqlDataAdapter("SELECT Data.ID as ID,Strings.s as Filename,Returnvalue,ResultCode,SAT,UNSAT,UNKNOWN,Runtime,Worker FROM Data,Strings WHERE FilenameP=Strings.ID AND (Strings.s LIKE '%" + txtFilename.Text + "%') AND ExperimentID=" + experimentID, sql);

                DataSet ds = new DataSet();
                da.SelectCommand.CommandTimeout = 0;
                da.Fill(ds, "Data");
                dataGrid.ItemsSource = ds.Tables[0].DefaultView;
            }
            catch (SqlException ex)
            {
                if (ex.Number == -2) /* timeout */ goto retry; else throw ex;
            }

            Mouse.OverrideCursor = null;
        }

        private void txtSeconds_KeyUp(object sender, KeyEventArgs e)
        {
            if (e.Key == Key.Enter)
            {
                updateGrid(radioMoreThan);
                radioMoreThan.IsChecked = true;
            }
        }

        private void txtOutputMatch_KeyUp(object sender, KeyEventArgs e)
        {
            if (e.Key == Key.Enter)
            {
                updateGrid(radioOutputContains);
                radioOutputContains.IsChecked = true;
            }
        }

        private void txtFilename_KeyUp(object sender, KeyEventArgs e)
        {
            if (e.Key == Key.Enter)
            {
                updateGrid(radioFNTEXT);
                radioFNTEXT.IsChecked = true;
            }
        }

        private void canShowReclassify(object Sender, CanExecuteRoutedEventArgs e)
        {
            e.CanExecute = (sql != null) && (dataGrid.SelectedItems.Count > 0);
        }

        private void Reclassify(int id, int rc)
        {
            SqlCommand cmd = new SqlCommand("UPDATE Data SET ResultCode=" + rc + " WHERE id=" + id + ";", sql);
            cmd.CommandTimeout = 0;
            cmd.ExecuteNonQuery();
            if (rc == 5)
            {
                cmd = new SqlCommand("UPDATE Data SET Runtime=" + timeout + " WHERE id=" + id + ";", sql);
                cmd.CommandTimeout = 0;
                cmd.ExecuteNonQuery();
            }
        }
        private void ReclassifySelected(int rc)
        {
            try
            {
                foreach (DataRowView drv in dataGrid.SelectedItems)
                {
                    int id = (int)drv["ID"];
                    Reclassify(id, rc);
                }

                System.Console.WriteLine();
            }
            catch (Exception ex)
            {
                System.Windows.MessageBox.Show(this, "Exception: " + ex.Message, "Error",
                                                MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        //public const int OK = 0;
        //public const int BUG = 3;
        //public const int ERROR = 4;
        //public const int TIME = 5;
        //public const int MEMORY = 6;

        private void showReclassifyOK(object sender, ExecutedRoutedEventArgs e)
        {
            Mouse.OverrideCursor = System.Windows.Input.Cursors.Wait;
            ReclassifySelected(0);
            dataGrid.Items.Refresh();
            Mouse.OverrideCursor = null;
        }

        private void showReclassifyBug(object sender, ExecutedRoutedEventArgs e)
        {
            Mouse.OverrideCursor = System.Windows.Input.Cursors.Wait;
            ReclassifySelected(3);
            dataGrid.Items.Refresh();
            Mouse.OverrideCursor = null;
        }

        private void showReclassifyError(object sender, ExecutedRoutedEventArgs e)
        {
            Mouse.OverrideCursor = System.Windows.Input.Cursors.Wait;
            ReclassifySelected(4);
            dataGrid.Items.Refresh();
            Mouse.OverrideCursor = null;
        }

        private void showReclassifyTimeout(object sender, ExecutedRoutedEventArgs e)
        {
            Mouse.OverrideCursor = System.Windows.Input.Cursors.Wait;
            ReclassifySelected(5);
            dataGrid.Items.Refresh();
            Mouse.OverrideCursor = null;
        }
        private void showReclassifyMemout(object sender, ExecutedRoutedEventArgs e)
        {
            Mouse.OverrideCursor = System.Windows.Input.Cursors.Wait;
            ReclassifySelected(6);
            dataGrid.Items.Refresh();
            Mouse.OverrideCursor = null;
        }

        private void canShowRequeue(object Sender, CanExecuteRoutedEventArgs e)
        {
            e.CanExecute = (sql != null) && (dataGrid.SelectedItems.Count >= 1);
        }

        private void showRequeue(object sender, ExecutedRoutedEventArgs e)
        {
            Mouse.OverrideCursor = System.Windows.Input.Cursors.Wait;

            try
            {
                foreach (DataRowView drv in dataGrid.SelectedItems)
                {
                    string fn = (string)drv["Filename"];
                    int id = (int)drv["ID"];
                    SqlCommand cmd = new SqlCommand("AQ " + experimentID + ",'" + fn + "';" +
                                                    "DELETE FROM Data WHERE ID=" + id + "", sql);
                    cmd.CommandTimeout = 0;
                    cmd.ExecuteNonQuery();
                }

                System.Console.WriteLine();
            }
            catch (Exception ex)
            {
                System.Windows.MessageBox.Show(this, "Exception: " + ex.Message, "Error",
                                                MessageBoxButton.OK, MessageBoxImage.Error);
            }

            Mouse.OverrideCursor = null;
        }

        private void canShowCopyFilename(object Sender, CanExecuteRoutedEventArgs e)
        {
            e.CanExecute = (sql != null) && (dataGrid.SelectedItems.Count == 1);
        }

        private void showCopyFilename(object sender, ExecutedRoutedEventArgs e)
        {
            Mouse.OverrideCursor = System.Windows.Input.Cursors.Wait;
            Clipboard.SetDataObject((string)((DataRowView)dataGrid.SelectedItem)["Filename"]);
            Mouse.OverrideCursor = null;
        }
    }
}
