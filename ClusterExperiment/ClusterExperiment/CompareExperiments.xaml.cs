using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using System.Data;
using System.Data.SqlClient;

namespace ClusterExperiment
{
    /// <summary>
    /// Interaction logic for CompareExperiments.xaml
    /// </summary>
    public partial class CompareExperiments : Window
    {
        public SqlConnection sql = null;
        int eID1 = 0, eID2 = 0;

        string prefix1 = "", prefix2 = "";
        string category1 = "", category2 = "";

        public static RoutedCommand CopyFilename = new RoutedCommand();

        private string mk_query(string condition)
        {
            if (chkIgnoreFNPrefix.IsChecked.Value ||
                chkIgnoreFNCategory.IsChecked.Value ||
                chkIgnoreFNPostfix.IsChecked.Value)
            {
                string ext1 = txtExtensionLeft.Text;
                string ext2 = txtExtensionRight.Text;

                if (!chkIgnoreFNPrefix.IsChecked.Value && prefix1 != prefix2)
                    return "SELECT NULL";
                else if (!chkIgnoreFNCategory.IsChecked.Value && category1 != category2)
                    return "SELECT NULL";
                else if (!chkIgnoreFNPostfix.IsChecked.Value && ext1 != ext2)
                    return "SELECT NULL";
                else
                {
                    return "SELECT " +
                      "SUBSTRING(sa.s, " + (category1.Length + 2) + ", IIF(sa.s is null, 0, LEN(sa.s))-(" + (category1.Length + ext1.Length + 1) + ")) as 'Filename (Base)', " +
                      "a.Runtime as 'Runtime (" + eID1 + ")', " +
                      "b.Runtime as 'Runtime (" + eID2 + ")', " +
                      "a.ResultCode as 'ResultCode (" + eID1 + ")', " +
                      "b.ResultCode as 'ResultCode (" + eID2 + ")', " +
                      "a.Returnvalue as 'Returnvalue (" + eID1 + ")', " +
                      "b.Returnvalue as 'Returnvalue (" + eID2 + ")', " +
                      "a.Runtime-b.Runtime as Diff, " +
                      "a.SAT as 'SAT (" + eID1 + ")', " +
                      "a.UNSAT as 'UNSAT (" + eID1 + ")', " +
                      "a.UNKNOWN as 'UNKNOWN (" + eID1 + ")', " +
                      "b.SAT as 'SAT (" + eID2 + ")', " +
                      "b.UNSAT as 'UNSAT (" + eID2 + ")', " +
                      "b.UNKNOWN as 'UNKNOWN (" + eID2 + ")', " +
                      "a.ID as 'ID1', b.ID as 'ID2' " +
                    "FROM  " +
                      "Data a, Data b, Strings sa, Strings sb " +
                    "WHERE " +
                      "a.filenamep=sa.id AND b.filenamep=sb.id AND " +
                      "a.ExperimentID=" + eID1 + " AND b.ExperimentID=" + eID2 + " AND " +
                      "LEN(sa.s) > 0 AND LEN(sb.s) > 0 AND " +
                      "LEN(sa.s) > (" + (category1.Length + ext1.Length + 2) + ") AND " +
                      "LEN(sb.s) > (" + (category2.Length + ext2.Length + 2) + ") AND " +
                      "SUBSTRING(sa.s, " + (category1.Length + 2) + ", LEN(sa.s)-" + (category1.Length + ext1.Length + 1) + ") = " +
                      "SUBSTRING(sb.s, " + (category2.Length + 2) + ", LEN(sb.s)-" + (category2.Length + ext2.Length + 1) + ") " +
                      (condition == "" ? "" : (" AND " + condition + " ")) +
                    "ORDER BY  " +
                        "ABS(a.Runtime-b.Runtime) Desc";
                }
            }
            else
            {
                return "SELECT " +
                                "sa.s as Filename," +
                                "a.Runtime as 'Runtime (" + eID1 + ")'," +
                                "b.Runtime as 'Runtime (" + eID2 + ")'," +
                                "a.ResultCode as 'ResultCode (" + eID1 + ")', " +
                                "b.ResultCode as 'ResultCode (" + eID2 + ")', " +
                                "a.Returnvalue as 'Returnvalue (" + eID1 + ")'," +
                                "b.Returnvalue as 'Returnvalue (" + eID2 + ")'," +
                                "a.Runtime-b.Runtime as Diff," +
                                "a.SAT as 'SAT (" + eID1 + ")'," +
                                "a.UNSAT as 'UNSAT (" + eID1 + ")'," +
                                "a.UNKNOWN as 'UNKNOWN (" + eID1 + ")'," +
                                "b.SAT as 'SAT (" + eID2 + ")'," +
                                "b.UNSAT as 'UNSAT (" + eID2 + ")'," +
                                "b.UNKNOWN as 'UNKNOWN (" + eID2 + ")'," +
                                "a.ID as 'ID1', b.ID as 'ID2' " +
                       "FROM Data a, Data b, Strings sa " +
                       "WHERE a.ExperimentID=" + eID1 + " AND " +
                         "b.ExperimentID=" + eID2 + " AND " +
                         "a.FilenameP=b.FilenameP AND a.FilenameP=sa.ID " +
                         (condition == "" ? "" : (" AND " + condition + " ")) +
                       "ORDER BY ABS(a.Runtime-b.Runtime) Desc";
            }
        }

        public void GetMetaData()
        {
            SqlCommand cmd = new SqlCommand("SELECT SharedDir, Category, Extension FROM Experiments WHERE ID=" + eID1, sql);
            SqlDataReader r = cmd.ExecuteReader();
            if (r.Read())
            {
                prefix1 = (string)r["SharedDir"];
                category1 = (string)r["Category"];
                txtExtensionLeft.Text = "." + (string)r["Extension"];
            }
            r.Close();

            cmd = new SqlCommand("SELECT SharedDir, Category, Extension FROM Experiments WHERE ID=" + eID2, sql);
            r = cmd.ExecuteReader();
            if (r.Read())
            {
                prefix2 = (string)r["SharedDir"];
                category2 = (string)r["Category"];
                txtExtensionRight.Text = "." + (string)r["Extension"];
            }
            r.Close();
        }


        public CompareExperiments(int eID1, int eID2, SqlConnection sql)
        {
            InitializeComponent();
            this.eID1 = eID1;
            this.eID2 = eID2;
            this.sql = sql;

            Title = "Comparison: " + eID1.ToString() + " vs. " + eID2.ToString();

            GetMetaData();

            SqlDataAdapter da = new SqlDataAdapter(mk_query(""), sql);

            DataSet ds = new DataSet();
            da.Fill(ds, "Data");
            dataGrid.ItemsSource = ds.Tables[0].DefaultView;

            CommandBinding ccb = new CommandBinding(CopyFilename, showCopyFilename, canShowCopyFilename);
            CommandBindings.Add(ccb);
        }

        private void updateGrid(RadioButton sender = null)
        {
            Mouse.OverrideCursor = System.Windows.Input.Cursors.Wait;

        retry:
            try
            {
                SqlDataAdapter da = null;

                if (sender == radioAll || sender == null)
                    da = new SqlDataAdapter(mk_query(""), sql);
                else if (sender == radioBOTHSAT)
                    da = new SqlDataAdapter(mk_query("a.SAT>0 AND b.SAT>0"), sql);
                else if (sender == radioBOTHUNSAT)
                    da = new SqlDataAdapter(mk_query("a.UNSAT>0 AND b.UNSAT>0"), sql);
                else if (sender == radioBOTHUNKNOWN)
                    da = new SqlDataAdapter(mk_query("a.UNKNOWN>0 AND b.UNKNOWN>0"), sql);
                else if (sender == radioONESAT)
                    da = new SqlDataAdapter(mk_query("(a.SAT>0 OR b.SAT>0)"), sql);
                else if (sender == radioONEUNSAT)
                    da = new SqlDataAdapter(mk_query("(a.UNSAT>0 OR b.UNSAT>0)"), sql);
                else if (sender == radioONEUNKNOWN)
                    da = new SqlDataAdapter(mk_query("(a.UNKNOWN>0 OR b.UNKNOWN>0)"), sql);
                else if (sender == radioONEBUGS)
                    da = new SqlDataAdapter(mk_query("(a.ResultCode=3 OR b.ResultCode=3)"), sql);
                else if (sender == radioONEERROR)
                    da = new SqlDataAdapter(mk_query("(a.ResultCode=4 OR b.ResultCode=4)"), sql);
                else if (sender == radioONEMemouts)
                    da = new SqlDataAdapter(mk_query("(a.ResultCode=6 OR b.ResultCode=6)"), sql);
                else if (sender == radioONETimeouts)
                    da = new SqlDataAdapter(mk_query("(a.ResultCode=5 OR b.ResultCode=5)"), sql);
                else if (sender == radioSATSTAR)
                    da = new SqlDataAdapter(mk_query("((a.SAT>0 AND b.SAT=0) OR (a.SAT=0 AND b.SAT>0))"), sql);
                else if (sender == radioUNSATSTAR)
                    da = new SqlDataAdapter(mk_query("((a.UNSAT>0 AND b.UNSAT=0) OR (a.UNSAT=0 AND b.UNSAT>0))"), sql);
                else if (sender == radioOKSTAR)
                    da = new SqlDataAdapter(mk_query("((a.SAT>0 AND b.SAT=0) OR (a.SAT=0 AND b.SAT>0) OR (a.UNSAT>0 AND b.UNSAT=0) OR (a.UNSAT=0 AND b.UNSAT>0))"), sql);
                else if (sender == radioSATUNSAT)
                    da = new SqlDataAdapter(mk_query("((a.SAT>0 AND b.UNSAT>0) OR (a.UNSAT>0 AND b.SAT>0))"), sql);
                else if (sender == radioFNSAT)
                    da = new SqlDataAdapter(mk_query("sa.s LIKE '%sat%' AND NOT sa.s LIKE '%unsat%'"), sql);
                else if (sender == radioFNUNSAT)
                    da = new SqlDataAdapter(mk_query("sa.s LIKE '%unsat%'"), sql);
                else if (sender == radioFNTEXT)
                    da = new SqlDataAdapter(mk_query("sa.s LIKE '%" + txtFilename.Text + "%'"), sql);

                DataSet ds = new DataSet();
                da.Fill(ds, "Data");
                dataGrid.ItemsSource = ds.Tables[0].DefaultView;
            }
            catch (SqlException ex)
            {
                if (ex.Number == -2) /* timeout */ goto retry; else throw ex;
            }

            Mouse.OverrideCursor = null;
        }

        private void RadioButton_Click(object sender, RoutedEventArgs e)
        {
            updateGrid((RadioButton)sender);
        }

        private void txtFilename_KeyUp(object sender, KeyEventArgs e)
        {
            if (e.Key == Key.Enter)
            {
                updateGrid(radioFNTEXT);
                radioFNTEXT.IsChecked = true;
            }
        }

        private void dataGrid_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            if (dataGrid.SelectedItems.Count != 1)
                return;

            DataRowView rowView = (DataRowView)dataGrid.SelectedItem;
            int id13 = (int)rowView[14];
            int id24 = (int)rowView[15];

            ShowOutput w = null;

            int inx = dataGrid.CurrentCell.Column.DisplayIndex;
            if (inx == 1 || inx == 3)
                w = new ShowOutput(id13, sql);
            else
                w = new ShowOutput(id24, sql);

            w.Show();
            Mouse.OverrideCursor = null;
        }

        private void txtExtensionLeft_KeyUp(object sender, KeyEventArgs e)
        {
            if (e.Key == Key.Enter)
                updateGrid(null);
        }

        private void txtExtensionRight_KeyUp(object sender, KeyEventArgs e)
        {
            if (e.Key == Key.Enter)
                updateGrid(null);
        }

        private void chkIgnoreFNPrefix_Checked(object sender, RoutedEventArgs e)
        {
            updateGrid(null);
        }

        private void chkIgnoreFNPrefix_Unchecked(object sender, RoutedEventArgs e)
        {
            updateGrid(null);
        }

        private void chkIgnoreFNCategory_Checked(object sender, RoutedEventArgs e)
        {
            updateGrid(null);
        }

        private void chkIgnoreFNCategory_Unchecked(object sender, RoutedEventArgs e)
        {
            updateGrid(null);
        }

        private void chkIgnoreFNPostfix_Unchecked(object sender, RoutedEventArgs e)
        {
            txtExtensionLeft.IsEnabled = chkIgnoreFNPostfix.IsChecked.Value;
            txtExtensionRight.IsEnabled = chkIgnoreFNPostfix.IsChecked.Value;
            updateGrid(null);
        }

        private void chkIgnoreFNPostfix_Checked(object sender, RoutedEventArgs e)
        {
            txtExtensionLeft.IsEnabled = chkIgnoreFNPostfix.IsChecked.Value;
            txtExtensionRight.IsEnabled = chkIgnoreFNPostfix.IsChecked.Value;
            updateGrid(null);
        }

        private void canShowCopyFilename(object Sender, CanExecuteRoutedEventArgs e)
        {
            e.CanExecute = (sql != null) && (dataGrid.SelectedItems.Count == 1);
        }

        private void showCopyFilename(object sender, ExecutedRoutedEventArgs e)
        {
            Mouse.OverrideCursor = System.Windows.Input.Cursors.Wait;
            Clipboard.SetText((string)((DataRowView)dataGrid.SelectedItem)["Filename"]);
            Mouse.OverrideCursor = null;
        }
    }
}
