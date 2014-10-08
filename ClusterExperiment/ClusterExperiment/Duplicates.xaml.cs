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

        public Duplicates(int eid, SqlConnection sql)
        {
            InitializeComponent();
            this.eid = eid;
            this.sql = sql;

            SqlCommand cmd = new SqlCommand("SELECT COUNT(*) as Count,FilenameP FROM Data WHERE ExperimentID=" + eid + " GROUP BY FilenameP HAVING COUNT(*)>1", sql);
            SqlDataReader r = cmd.ExecuteReader();
            while (r.Read())
                filenameps.Add((int)r["FilenameP"]);
            r.Close();            

            showNextDupe();
        }

        private void showNextDupe() 
        {
            if (filenameps.Count==0)
            {
                DialogResult = true;                
            }
            else 
            {
                int next_fnp = filenameps.First();
                filenameps.RemoveAt(0);

                SqlDataAdapter da = new SqlDataAdapter("SELECT Data.ID,Strings.s as Filename,ResultCode,ReturnValue,Runtime,stdout,stderr,AcquireTime,FinishTime,SAT,UNSAT,UNKNOWN FROM Data,Strings WHERE ExperimentID=" + eid + " AND FilenameP=" + next_fnp + " AND Strings.ID=FilenameP", sql);

                DataSet ds = new DataSet();
                da.Fill(ds, "Duplicates");
                dataGrid.ItemsSource = ds.Tables[0].DefaultView;
            }
        }

        private void dataGrid_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            if (dataGrid.SelectedItems.Count == 1)
            {
                DataRowView rowView = (DataRowView)dataGrid.SelectedItems[0];
                int keep_id = (int)rowView["ID"];

                foreach (DataRowView drv in dataGrid.Items)
                {
                    int row_id = (int)drv["ID"];
                    if (row_id != keep_id)
                    {
                        SqlCommand cmd = new SqlCommand("DELETE FROM Data WHERE ExperimentID=" + eid + " and ID=" + row_id, sql);
                        cmd.ExecuteNonQuery();
                    }
                }

                showNextDupe();
            }
        }
    }
}
