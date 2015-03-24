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

        public Duplicates(int eid, bool resolveTimeouts, SqlConnection sql)
        {
            InitializeComponent();
            this.eid = eid;
            this.sql = sql;
            this.resolveTimeouts = resolveTimeouts;

            ResolveJobQueue();

            SqlCommand cmd = new SqlCommand("SELECT COUNT(*) as Count,FilenameP FROM Data WHERE ExperimentID=" + eid + " GROUP BY FilenameP HAVING COUNT(*)>1", sql);
            SqlDataReader r = cmd.ExecuteReader();
            while (r.Read())
                filenameps.Add((int)r["FilenameP"]);
            r.Close();            

            showNextDupe();
        }

        private void ResolveJobQueue()
        {
            if (filenameps.Count() != 0)
                throw new Exception("expected empty list");

            SqlCommand cmd = new SqlCommand("SELECT COUNT(*) as Count, FilenameP FROM JobQueue WHERE ExperimentID=" + eid + " GROUP BY FilenameP HAVING COUNT(*)>1", sql);
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
        }

        private void showNextDupe()
        {
            if (filenameps.Count == 0)
            {
                DialogResult = true;
            }
            else
            {
                bool not_done = true;
                do
                {
                    int next_fnp = filenameps.First();
                    filenameps.RemoveAt(0);

                    SqlDataAdapter da = new SqlDataAdapter("SELECT Data.ID,Strings.s as Filename,ResultCode,ReturnValue,Runtime,stdout,stderr,AcquireTime,FinishTime,SAT,UNSAT,UNKNOWN FROM Data,Strings WHERE ExperimentID=" + eid + " AND FilenameP=" + next_fnp + " AND Strings.ID=FilenameP", sql);

                    DataSet ds = new DataSet();
                    da.Fill(ds, "Duplicates");
                    dataGrid.ItemsSource = ds.Tables[0].DefaultView;

                    if (resolveTimeouts)
                    {
                        bool all_timeouts = true;
                        foreach (DataRowView r in dataGrid.Items)
                        {
                            if (((byte)r[2]) != 5) { all_timeouts = false; break; }
                        }

                        if (all_timeouts)
                            Pick((int)((DataRowView)dataGrid.Items[0])["ID"]);
                        else
                            not_done = false;
                    }
                    else
                        not_done = false;
                }
                while (not_done && filenameps.Count() > 0);
            }
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
