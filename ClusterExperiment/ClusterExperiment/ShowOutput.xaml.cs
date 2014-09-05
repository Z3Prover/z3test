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
  /// Interaction logic for ShowOutput.xaml
  /// </summary>
  public partial class ShowOutput : Window
  {
    public ShowOutput(int id, SqlConnection sql)
    {
      InitializeComponent();

      Title = "Job " + id;

      SqlCommand cmd = new SqlCommand("SELECT SharedDir+'\\'+Strings.s as Filename,stdout,stderr " +
                                      "FROM Data,Strings,Experiments " +
                                      "WHERE FilenameP=Strings.ID AND Data.ExperimentID=Experiments.ID " +
                                      "AND Data.ID=" + id, sql);
      cmd.CommandTimeout = 0;
      SqlDataReader r = cmd.ExecuteReader();

      if (!r.Read())
        throw new Exception("Could not read from SQL server.");

      Object sOut = r["stdout"];
      Object sErr = r["stderr"];

      if (sOut == DBNull.Value)
        textBoxOut.Text = "*** NO OUTPUT SAVED ***";
      else
        textBoxOut.Text = (string)sOut;

      if (sErr == DBNull.Value)
        textBoxErr.Text = "*** NO OUTPUT SAVED ***";
      else
        textBoxErr.Text = (string)sErr;

      textBoxFn.Text = (string) r["Filename"];

      cmd.Cancel();
      r.Close();      
    }
  }
}
