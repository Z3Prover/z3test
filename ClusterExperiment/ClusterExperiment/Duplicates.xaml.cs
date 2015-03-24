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
    /// Interaction logic for Window1.xaml
    /// </summary>
    public partial class Duplicates : Window
    {
        private int eid = 0;
        private SqlConnection sql = null;
        private List<int> filenameps = new List<int>();
        private bool resolveTimeouts = false;
        private bool resolveSameTime = false;
        private bool resolveSlowest = false;

        public Duplicates(int eid,
            bool resolveTimeouts,
            bool resolveSameTime,
            bool resolveSlowest,
            SqlConnection sql)
        {
            InitializeComponent();
            this.eid = eid;
            this.sql = sql;
            this.resolveTimeouts = resolveTimeouts;
            this.resolveSameTime = resolveSameTime;
            this.resolveSlowest = resolveSlowest;

            Loaded += new RoutedEventHandler(Duplicates_Loaded);
        }

        
        void Duplicates_Loaded(object sender, RoutedEventArgs e)
        {
            Mouse.OverrideCursor = System.Windows.Input.Cursors.Wait;

            ResolveJobQueue();
            ResolveAcross();
            ResolveData();

            Mouse.OverrideCursor = null;
        }

        private void ResolveJobQueue()
        {
            if (filenameps.Count() != 0)
                throw new Exception("expected empty list");

            Mouse.OverrideCursor = System.Windows.Input.Cursors.Wait;

            SqlCommand cmd = new SqlCommand("SELECT COUNT(*) as Count, FilenameP FROM JobQueue WHERE ExperimentID=" + eid + " GROUP BY FilenameP HAVING COUNT(*)>1", sql);
            cmd.CommandTimeout = 0;
            SqlDataReader r = cmd.ExecuteReader();
            while (r.Read())
                filenameps.Add((int)r["FilenameP"]);
            r.Close();

            foreach (int e in filenameps)
            {
                cmd = new SqlCommand("SELECT ID FROM JobQueue WHERE ExperimentID=" + eid + " AND FilenameP=" + e, sql);
                cmd.CommandTimeout = 0;
                r = cmd.ExecuteReader();
                List<int> ids = new List<int>();
                while (r.Read())
                    ids.Add((int)r["ID"]);
                r.Close();

                ids.RemoveAt(0); // keep 1.
                foreach (int id in ids)
                {
                    cmd = new SqlCommand("DELETE FROM JobQueue WHERE ExperimentID=" + eid + " and ID=" + id, sql);
                    cmd.CommandTimeout = 0;
                    cmd.ExecuteNonQuery();
                }
            }

            Mouse.OverrideCursor = null;
        }

        private void ResolveAcross()
        {
            SqlCommand cmd = new SqlCommand("DELETE FROM JobQueue " +
                                            "WHERE " +
                                            "ExperimentID=" + eid + " AND " +
                                            "ID in (SELECT JobQueue.ID " +
                                                "FROM JobQueue, Data  " +
                                                "WHERE " +
                                                "JobQueue.ExperimentID=" + eid + " AND " +
                                                "Data.ExperimentID=" + eid + " AND " +
                                                "Data.FilenameP = JobQueue.FilenameP); ", sql);
            cmd.CommandTimeout = 0;
            cmd.ExecuteNonQuery();
        }

        private void ResolveData()
        {
            SqlCommand cmd = new SqlCommand("SELECT COUNT(*) as Count,FilenameP FROM Data WHERE ExperimentID=" + eid + " GROUP BY FilenameP HAVING COUNT(*)>1", sql);
            cmd.CommandTimeout = 0;
            SqlDataReader r = cmd.ExecuteReader();
            while (r.Read())
                filenameps.Add((int)r["FilenameP"]);
            r.Close();

            showNextDupe();
        }

        private void showNextDupe()
        {
            if (filenameps.Count == 0)
            {
                Close();
            }
            else
            {
                Mouse.OverrideCursor = System.Windows.Input.Cursors.Wait;

                bool not_done = true;                
                do
                {
                    int next_fnp = filenameps.First();
                    filenameps.RemoveAt(0);

                    SqlDataAdapter da = new SqlDataAdapter("SELECT Data.ID,Strings.s as Filename,ResultCode,ReturnValue,Runtime,stdout,stderr,AcquireTime,FinishTime,SAT,UNSAT,UNKNOWN FROM Data,Strings WHERE ExperimentID=" + eid + " AND FilenameP=" + next_fnp + " AND Strings.ID=FilenameP", sql);

                    DataSet ds = new DataSet();
                    da.Fill(ds, "Duplicates");
                    dataGrid.ItemsSource = ds.Tables[0].DefaultView;

                    if (resolveTimeouts || resolveSameTime || resolveSlowest && dataGrid.Items.Count > 0)
                    {
                        bool first = true;
                        bool all_timeouts = true;
                        bool all_ok = true;
                        bool all_times_same = true;
                        double runtime = 0.0;
                        double min_time = double.MaxValue;
                        DataRowView min_item = null;
                        double max_time = double.MinValue;
                        DataRowView max_item = null;

                        foreach (DataRowView r in dataGrid.Items)
                        {
                            byte status = ((byte)r[2]);
                            double time = ((double)r[4]);
                            if (status != 5) { all_timeouts = false; }
                            if (status != 0) { all_ok = false; }

                            if (time < min_time)
                            {
                                min_time = time;
                                min_item = r;
                            }

                            if (time > max_time)
                            {
                                max_time = time;
                                max_item = r;
                            }

                            if (first)
                            {
                                first = false; runtime = time;
                            }
                            else
                            {
                                if (time != runtime) all_times_same = false;
                            }
                        }

                        if (resolveTimeouts && all_timeouts)
                            Pick((int)((DataRowView)dataGrid.Items[0])["ID"]);
                        else if (resolveSameTime && all_ok && all_times_same)
                            Pick((int)((DataRowView)dataGrid.Items[0])["ID"]);
                        else if (resolveSlowest && all_ok)
                            Pick((int)(max_item)["ID"]);
                        else
                            not_done = false;
                    }
                    else
                        not_done = false;
                }
                while (not_done && filenameps.Count() > 0);

                Mouse.OverrideCursor = null;
            }

            if (filenameps.Count == 0)
                Close();
        }

        private void Pick(int id)
        {
            foreach (DataRowView drv in dataGrid.Items)
            {
                int row_id = (int)drv["ID"];
                if (row_id != id)
                {
                    SqlCommand cmd = new SqlCommand("DELETE FROM Data WHERE ExperimentID=" + eid + " and ID=" + row_id, sql);
                    cmd.CommandTimeout = 0;
                    cmd.ExecuteNonQuery();
                }
            }

        }

        private void dataGrid_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            if (dataGrid.SelectedItems.Count == 1)
            {
                DataRowView rowView = (DataRowView)dataGrid.SelectedItems[0];
                Pick((int)rowView["ID"]);
                showNextDupe();
            }
        }
    }
}
