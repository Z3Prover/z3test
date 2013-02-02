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

    public ShowResults(int experimentID, SqlConnection sql)
    {
      InitializeComponent();
      this.sql = sql;
      this.experimentID = experimentID;

      SqlCommand cmd = new SqlCommand("SELECT Timeout,SharedDir FROM Experiments WHERE ID=" + experimentID, sql);
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
  }
}
