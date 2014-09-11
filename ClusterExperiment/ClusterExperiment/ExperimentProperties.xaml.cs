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
using Microsoft.Hpc.Scheduler;
using Microsoft.Hpc.Scheduler.Properties;

namespace ClusterExperiment
{
  /// <summary>
  /// Interaction logic for ExperimentProperties.xaml
  /// </summary>
  public partial class ExperimentProperties : Window
  {
    int id;
    SqlConnection sql;
    bool changed;

    public ExperimentProperties(int id, SqlConnection sql)
    {      
      InitializeComponent();
      this.id = id;
      this.sql = sql;
      Loaded += delegate { update(); };
      changed = false;
    }

    private void closeButton_Click(object sender, RoutedEventArgs e)
    {
      submitNote();
      Close();
    }

    private void updateButton_Click(object sender, RoutedEventArgs e)
    {
      submitNote();
      update();      
    }

    private void submitNote()
    {
      if (changed)
      {
        SqlCommand cmd = new SqlCommand("UPDATE Experiments SET Note=@NOTE WHERE ID=" + id.ToString() + ";", sql);
        SqlParameter p = cmd.Parameters.Add("@Note", SqlDbType.VarChar);
        p.Size = txtNote.Text.Length;          
        p.Value = txtNote.Text;
        cmd.ExecuteNonQuery();
      }
    }

    private void update()
    {
      retry:
      try
      {
        Mouse.OverrideCursor = System.Windows.Input.Cursors.Wait;
        
        lblID.Content = this.Title = "Experiment #" + id.ToString();

        SqlCommand cmd = new SqlCommand("SELECT SubmissionTime,Category," +
          "(SELECT COUNT(1) FROM JobQueue WHERE ExperimentID=" + id.ToString() + ") as Queued," +
          "(SELECT COUNT(1) FROM Data WHERE ExperimentID=" + id.ToString() + ") as Finished," +
          "(SELECT SUM(SAT) FROM Data WHERE ExperimentID=" + id.ToString() + " AND ResultCode=0) as SAT," +
          "(SELECT SUM(UNSAT) FROM Data WHERE ExperimentID=" + id.ToString() + " AND ResultCode=0) as UNSAT," +
          "(SELECT SUM(UNKNOWN) FROM Data WHERE ExperimentID=" + id.ToString() + " AND ResultCode=0) as UNKNOWN," +
          "(SELECT COUNT(1) FROM Data WHERE ExperimentID=" + id.ToString() + " AND ResultCode=0 AND SAT+UNSAT > TargetSAT+TargetUNSAT AND UNKNOWN < TargetUNKNOWN) as OVR," +
          "(SELECT COUNT(1) FROM Data WHERE ExperimentID=" + id.ToString() + " AND (SAT+UNSAT < TargetSAT+TargetUNSAT OR UNKNOWN > TargetUNKNOWN)) as UDR," +
          "(SELECT COUNT(1) FROM Data WHERE ExperimentID=" + id.ToString() + " AND ResultCode=3) as BUG," +
          "(SELECT COUNT(1) FROM Data WHERE ExperimentID=" + id.ToString() + " AND ResultCode=4) as ERROR," +
          "(SELECT COUNT(1) FROM Data WHERE ExperimentID=" + id.ToString() + " AND ResultCode=5) as TIMEOUT," +
          "(SELECT COUNT(1) FROM Data WHERE ExperimentID=" + id.ToString() + " AND ResultCode=6) as MEMORYOUT," +
          "Memout as MaxMem,Timeout as MaxTime,Parameters,Cluster,ClusterJobID,Nodegroup,Locality,Creator,Note,Longparams " +
          "FROM Experiments WHERE ID=" + id.ToString(), sql);
        cmd.CommandTimeout = 0;
        SqlDataReader r = cmd.ExecuteReader();
        if (!r.Read())
          throw new Exception("Error reading from SQL connection");

        txtSubmissionTime.Text = ((DateTime)r["SubmissionTime"]).ToString();
        txtCategory.Text = (string)r["Category"];

        int f = (int)r["Finished"];
        int q = (int)r["Queued"];
        lblTotal.Content = f + q;
        lblFinished.Content = f;
        lblRunning.Content = q;

        lblRunning.Foreground = (q == 0) ? System.Windows.Media.Brushes.Green :
                                           System.Windows.Media.Brushes.Red;

        lblSAT.Content = (DBNull.Value.Equals(r["SAT"])) ? 0 : (int)r["SAT"];
        lblUNSAT.Content = (DBNull.Value.Equals(r["UNSAT"])) ? 0 : (int)r["UNSAT"];
        lblUnknown.Content = (DBNull.Value.Equals(r["UNKNOWN"])) ? 0 : (int)r["UNKNOWN"];
        lblOver.Content = (DBNull.Value.Equals(r["OVR"])) ? 0 : (int)r["OVR"];
        lblUnder.Content = (DBNull.Value.Equals(r["UDR"])) ? 0 : (int)r["UDR"];

        int bugs = (int)r["BUG"]; ;
        int prob = (int)r["ERROR"];
        int toed = (int)r["TIMEOUT"];
        int memoed = (int)r["MEMORYOUT"];                

        lblBug.Content = bugs;
        lblBug.Foreground = (bugs == 0) ? System.Windows.Media.Brushes.Black :
                                           System.Windows.Media.Brushes.Red;
        lblNonzero.Content = prob;
        lblNonzero.Foreground = (prob == 0) ? System.Windows.Media.Brushes.Black :
                                              System.Windows.Media.Brushes.Red;

        lblMemdout.Content = memoed;
        lblMemdout.Foreground = (memoed == 0) ? System.Windows.Media.Brushes.Black :
                                                System.Windows.Media.Brushes.Red;

        lblTimedout.Content = toed;
        lblTimedout.Foreground = (toed == 0) ? System.Windows.Media.Brushes.Black :
                                               System.Windows.Media.Brushes.Red;
        
        
        txtTimeout.Text = (string)r["MaxTime"];
        txtMemout.Text = (string)r["MaxMem"];
        if (r["Parameters"].Equals(DBNull.Value)) 
            txtParameters.Text = (string)r["Longparams"];
        else
            txtParameters.Text = (string)r["Parameters"];
        string cluster = (string)r["Cluster"];
        txtCluster.Text = cluster;
        int clusterJobID = (DBNull.Value.Equals(r["ClusterJobID"])) ? 0 : (int)r["ClusterJobID"];
        txtNodeGroup.Text = (string)r["Nodegroup"];
        txtLocality.Text = (string)r["Locality"];
        txtCreator.Text = (string)r["Creator"];
        txtNote.Text = (DBNull.Value.Equals(r["Note"])) ? "" : (string)r["Note"];

        r.Close();

        if (cluster != "" && clusterJobID != 0)
        {
          try
          {
            Scheduler scheduler = new Scheduler();
            scheduler.Connect(cluster);
            ISchedulerJob job = scheduler.OpenJob(Convert.ToInt32(clusterJobID));
            JobState state = job.State;
            lblClusterStatus.Content = state.ToString();
            if (state == JobState.Running)
                lblClusterStatus.Content += " (" + job.GetCounters().RunningTaskCount + " wrkrs)";
            if (state == JobState.Running || state == JobState.Queued ||
                state == JobState.Validating || state == JobState.Finished ||
                state == JobState.Finishing || state == JobState.Submitted ||
                state == JobState.ExternalValidation)
              lblClusterStatus.Foreground = System.Windows.Media.Brushes.Green;
            else
              lblClusterStatus.Foreground = System.Windows.Media.Brushes.Red;
          }
          catch (SchedulerException) {
            lblClusterStatus.Content = "Job ID unknown to the cluster. Assume finished.";
            lblClusterStatus.Foreground = System.Windows.Media.Brushes.Orange;
          }
          catch
          {
            lblClusterStatus.Content = "Unable to retrieve status.";
            lblClusterStatus.Foreground = System.Windows.Media.Brushes.Orange;
          }
        }
        else
        {
          lblClusterStatus.Content = "Unable to retrieve status.";
          lblClusterStatus.Foreground = System.Windows.Media.Brushes.Black;
        }

        cmd = new SqlCommand("SELECT COUNT(*) FROM Data WHERE ExperimentID=" + id.ToString() + " AND stderr LIKE '%INFRASTRUCTURE ERROR%';", sql);
        r = cmd.ExecuteReader();
        if (r.Read())
        {
          int ierrs = (int)r[0];
          if (ierrs == 0) lblInfrastructureErrors.Content = "";
          else lblInfrastructureErrors.Content = ierrs.ToString() + " infrastructure errors!";
        }
        r.Close();

      }
      catch (SqlException ex)
      {
        if (ex.Number == -2) /* timeout */ goto retry; else throw ex;
      }      

      Mouse.OverrideCursor = null;
    }

    private void txtNote_TextChanged(object sender, TextChangedEventArgs e)
    {
      changed = true;
    }
  }
}
