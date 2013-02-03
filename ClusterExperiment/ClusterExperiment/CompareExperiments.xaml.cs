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

    private string mk_query(string cond) {
      return "SELECT Strings.s as Filename," +
                      "a.Runtime as 'Runtime (" + eID1 + ")'," +
                      "b.Runtime as 'Runtime (" + eID2 + ")'," +
                      "a.Returnvalue as 'Returnvalue (" + eID1 + ")'," +
                      "b.Returnvalue as 'Returnvalue (" + eID2 + ")'," +
                      "a.Runtime-b.Runtime as Diff," +
                      "a.SAT as 'SAT (" + eID1 + ")'," +
                      "a.UNSAT as 'UNSAT (" + eID1 + ")'," +
                      "a.UNKNOWN as 'UNKNOWN (" + eID1 + ")'," +
                      "b.SAT as 'SAT (" + eID2 + ")'," +
                      "b.UNSAT as 'UNSAT (" + eID2 + ")'," +
                      "b.UNKNOWN as 'UNKNOWN (" + eID2 + ")'" +
              "FROM Data a, Data b, Strings " +
              "WHERE a.ExperimentID=" + eID1 + " AND " +
              "b.ExperimentID=" + eID2 + " AND " +
              "a.FilenameP=b.FilenameP AND " +
              "a.FilenameP=Strings.ID " +
              (cond==""?"":"AND ") +
              cond + " " +
              "ORDER BY ABS(a.Runtime-b.Runtime) Desc";
    }

    public CompareExperiments(int eID1, int eID2, SqlConnection sql)
    {
      InitializeComponent();
      this.eID1 = eID1;
      this.eID2 = eID2;
      this.sql = sql;

      Title = "Comparison: " + eID1.ToString() + " vs. " + eID2.ToString();

      SqlDataAdapter da = new SqlDataAdapter(mk_query(""), sql);

      DataSet ds = new DataSet();
      da.Fill(ds, "Data");
      dataGrid.ItemsSource = ds.Tables[0].DefaultView;
    }

    private void updateGrid(RadioButton sender)
    {
      Mouse.OverrideCursor = System.Windows.Input.Cursors.Wait;

    retry:
      try
      {
        SqlDataAdapter da = null;

        if (sender == radioAll)
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
          da = new SqlDataAdapter(mk_query("Strings.s LIKE '%sat%' AND NOT Strings.s LIKE '%unsat%'"), sql);
        else if (sender == radioFNUNSAT)
          da = new SqlDataAdapter(mk_query("Strings.s LIKE '%unsat%'"), sql);
        else if (sender == radioFNTEXT)
          da = new SqlDataAdapter(mk_query("Strings.s LIKE '%" + txtFilename.Text + "%'"), sql);

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
  }
}
