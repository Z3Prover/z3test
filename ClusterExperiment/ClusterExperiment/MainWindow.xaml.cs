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
    public static RoutedCommand SaveCSVCommand = new RoutedCommand();
    public static RoutedCommand ScatterplotCommand = new RoutedCommand();
    public static RoutedCommand CreateGroupCommand = new RoutedCommand();
    public static RoutedCommand GroupScatterplotCommand = new RoutedCommand();
    public static RoutedCommand SaveBinaryCommand = new RoutedCommand();
    public static RoutedCommand ReinforcementsCommand = new RoutedCommand();
    public static RoutedCommand FlagCommand = new RoutedCommand();
    public static RoutedCommand DuplicatesCommand = new RoutedCommand();
    public static RoutedCommand TallyCommand = new RoutedCommand();    

    public MainWindow()
    {
      InitializeComponent();

      CommandBinding customCommandBinding = new CommandBinding(CompareCommand, showCompare, canShowCompare);
      CommandBindings.Add(customCommandBinding);
      customCommandBinding = new CommandBinding(CopyCommand, showCopy, canShowCopy);
      CommandBindings.Add(customCommandBinding);
      customCommandBinding = new CommandBinding(MoveCommand, showMove, canShowMove);
      CommandBindings.Add(customCommandBinding);
      customCommandBinding = new CommandBinding(SaveCSVCommand, showSaveCSV, canShowSaveCSV);
      CommandBindings.Add(customCommandBinding);
      customCommandBinding = new CommandBinding(ScatterplotCommand, showScatterplot, canShowScatterplot);
      CommandBindings.Add(customCommandBinding);
      customCommandBinding = new CommandBinding(CreateGroupCommand, showCreateGroup, canShowCreateGroup);
      CommandBindings.Add(customCommandBinding);
      customCommandBinding = new CommandBinding(GroupScatterplotCommand, showGroupScatterplot, canShowGroupScatterplot);
      CommandBindings.Add(customCommandBinding);
      customCommandBinding = new CommandBinding(SaveBinaryCommand, showSaveBinary, canShowSaveBinary);
      CommandBindings.Add(customCommandBinding);
      customCommandBinding = new CommandBinding(ReinforcementsCommand, showReinforcements, canShowReinforcements);
      CommandBindings.Add(customCommandBinding);
      customCommandBinding = new CommandBinding(FlagCommand, showFlag, canShowFlag);
      CommandBindings.Add(customCommandBinding);
      customCommandBinding = new CommandBinding(DuplicatesCommand, showDuplicates, canShowDuplicates);
      CommandBindings.Add(customCommandBinding);
      customCommandBinding = new CommandBinding(TallyCommand, showTally, canShowTally);
      CommandBindings.Add(customCommandBinding);

      Loaded += new RoutedEventHandler(MainWindow_Loaded);

      btnConnect.Focus();
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

    private void updateDataGrid()
    {
      Mouse.OverrideCursor = System.Windows.Input.Cursors.Wait;

      SqlDataAdapter da;

      if (txtFilter.Text != "")
        da = new SqlDataAdapter("SELECT * FROM TitleScreen WHERE (Category like '%" + txtFilter.Text + "%' OR Note like '%" + txtFilter.Text + "%') ORDER BY SubmissionTime DESC", sql);
      else
        da = new SqlDataAdapter("SELECT * FROM TitleScreen ORDER BY SubmissionTime DESC", sql);
      DataSet ds = new DataSet();
      da.Fill(ds, "Experiments");
      dataGrid.ItemsSource = ds.Tables[0].DefaultView;      

      da = new SqlDataAdapter("SELECT * FROM JobgroupsView ORDER BY ID DESC", sql);
      ds = new DataSet();
      da.Fill(ds, "Jobgroups");
      jobgroupGrid.ItemsSource = ds.Tables[0].DefaultView;      

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

        //double[] var_decay = { 0.35, 0.55, 0.8 };  // 0.1, 0.35 , 0.55, 0.8 };
        //double[] cla_decay = { 0.1, 0.4, 0.65, 0.9 };
        //int[] rfirst = { 10, 100, 1000, 10000 };
        //double[] rinc = { 2.0, 3.0, 4.0, 5.0 };

        //for (int i = 0; i < 3; i++)
        //    for (int j = 0; j < 4; j++)
        //        for (int k = 0; k < 4; k++)
        //            for (int l = 0; l < 4; l++)
        //            {
        //                string ps = " -var-decay=" + var_decay[i].ToString() +
        //                            " -cla-decay=" + cla_decay[j].ToString() +
        //                            " -rfirst=" + rfirst[k].ToString() +
        //                            " -rinc=" + rinc[l].ToString();

        //                Submission sdlg = new Submission(txtDatabase.Text, dlg.txtCategories.Text,
        //                                                 dlg.txtSharedDir.Text,
        //                                                 dlg.txtMemout.Text, dlg.txtTimeout.Text, dlg.txtExecutor.Text,
        //                                                 bin, ps,
        //                                                 dlg.txtCluster.Text, dlg.cmbNodeGroup.Text, dlg.cmbLocality.Text,
        //                                                 WindowsIdentity.GetCurrent().Name.ToString(),
        //                                                 dlg.cmbPriority.SelectedIndex,
        //                                                 dlg.txtExtension.Text, 
        //                                                 dlg.txtNote.Text + "(" + var_decay[i].ToString() + 
        //                                                 "/" + cla_decay[j].ToString() + 
        //                                                 "/" + rfirst[k].ToString() + 
        //                                                 "/" + rinc[l].ToString() + ") ",
        //                                                 dlg.chkParametricity.IsChecked == true,
        //                                                 dlg.txtParametricityFrom.Text,
        //                                                 dlg.txtParametricityTo.Text,
        //                                                 dlg.txtParametricityStep.Text);
        //                sdlg.Owner = this;
        //                sdlg.ShowDialog();

        //                if (sdlg.lastError != null)
        //                    System.Windows.MessageBox.Show(this, sdlg.lastError.Message, "Error",
        //                    System.Windows.MessageBoxButton.OK,
        //                    System.Windows.MessageBoxImage.Error);

        //            }


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
                                           dlg.txtParametricityStep.Text,
                                           dlg.chkJobgroup.IsChecked == true,
                                           dlg.txtJobgroup.Text);
        sdlg.Owner = this;
        sdlg.ShowDialog();

        if (sdlg.lastError != null)
          System.Windows.MessageBox.Show(this, sdlg.lastError.Message, "Error",
          System.Windows.MessageBoxButton.OK,
          System.Windows.MessageBoxImage.Error);

        updateState();
      }
    }

    private void updateState()
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

    private void showProperties(object target, ExecutedRoutedEventArgs e)
    {
      Mouse.OverrideCursor = System.Windows.Input.Cursors.Wait;

      DataRowView rowView = (DataRowView)dataGrid.SelectedItem;
      int id = (int)rowView["ID"];
      ExperimentProperties dlg = new ExperimentProperties(id, sql);

      dlg.Owner = this;
      dlg.Show();

      Mouse.OverrideCursor = null;
    }

    private void deleteExperiment(object target, ExecutedRoutedEventArgs e)
    {
      Mouse.OverrideCursor = System.Windows.Input.Cursors.Wait;

      System.Windows.MessageBoxResult r =
        System.Windows.MessageBox.Show("Are you sure you want to delete the selected experiments?", "Sure?", MessageBoxButton.YesNo, MessageBoxImage.Question, MessageBoxResult.No);

      if (r == System.Windows.MessageBoxResult.Yes)
      {
        for (int i = 0; i < dataGrid.SelectedItems.Count; i++)
        {
          int id = (int)((DataRowView)dataGrid.SelectedItems[i])["ID"];
          SqlDataReader rd = null;

          try
          {
            SqlCommand cmd = new SqlCommand("SELECT Cluster,ClusterJobID,SharedDir,Executor FROM Experiments WHERE ID=" + id.ToString(), sql);
            rd = cmd.ExecuteReader();

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
            cmd.ExecuteNonQuery();
          }
          catch (Exception ex)
          {
            string msg = String.Format("Error: could not delete experiment #{0} because of: {1} ", id, ex.Message);
            r = System.Windows.MessageBox.Show(msg, "Error", MessageBoxButton.OK, MessageBoxImage.Error, MessageBoxResult.OK);
          }
          finally
          {
            if (rd != null) rd.Close();
          }
        }
      }

      Mouse.OverrideCursor = null;

      updateDataGrid();
    }

    private void showCompare(object target, ExecutedRoutedEventArgs e)
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

    private void showScatterplot(object target, ExecutedRoutedEventArgs e)
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

    class CSVDatum
    {
      public int? rv = null;
      public double runtime = 0.0;
      public int sat = 0, unsat = 0;
    }

    private void canShowSaveCSV(object sender, CanExecuteRoutedEventArgs e)
    {
      e.CanExecute = (sql != null) && (dataGrid.SelectedItems.Count >= 1);
    }

    private void showSaveCSV(object target, ExecutedRoutedEventArgs e)
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

        Dictionary<string, Dictionary<int, CSVDatum>> data =
            new Dictionary<string, Dictionary<int, CSVDatum>>();

        // Headers and data
        f.Write(",");
        for (int i = 0; i < dataGrid.SelectedItems.Count; i++)
        {
          DataRowView rowView = (DataRowView)dataGrid.SelectedItems[i];
          int id = (int)rowView["ID"];
          SqlCommand c = new SqlCommand("SELECT Note,Parameters,Longparams,Timeout FROM Experiments WHERE ID=" + id.ToString(), sql);
          c.CommandTimeout = 0;

          double ex_timeout = int.MaxValue;          
          SqlDataReader rd = c.ExecuteReader();
          if (rd.Read())
          {
            f.Write(((string)rd["Note"]).Trim(' ') + ",");
            if (rd["Parameters"].Equals(DBNull.Value))
              f.Write("'" + ((string)rd["Longparams"]).Trim(' ') + "'");
            else
            {
              string str = ((string)rd["Parameters"]).Trim(' ');
              if (str != "")
                f.Write("'" + str + "'");
            }
            ex_timeout = Convert.ToDouble((string)rd["Timeout"]);
          }
          rd.Close();
          f.Write(",,,");

          double error_line = 10.0 * ex_timeout;

          c = new SqlCommand("SELECT s as Filename," +
                             " ResultCode," +
                             " Returnvalue," +
                             " Runtime," +
                             " SAT," +
                             " UNSAT" +
                             " FROM Strings, Data WHERE" +
                             " Strings.ID=Data.FilenameP AND" +
                             " Data.ExperimentID=" + id.ToString(), sql);
          c.CommandTimeout = 0;
          rd = c.ExecuteReader();

          while (rd.Read())
          {
            string fn = (string)rd["Filename"];
            CSVDatum cur = new CSVDatum();
            int rc = Convert.ToInt32((byte)rd["ResultCode"]);
            cur.rv = (rd["ReturnValue"].Equals(System.DBNull.Value)) ? null : (int?)rd["Returnvalue"];
            cur.runtime = (double)rd["Runtime"];
            cur.sat = (int)rd["SAT"];
            cur.unsat = (int)rd["UNSAT"];

            bool rv_ok = (rc == 5 && cur.rv == null) ||
                         ((rc == 0) && (cur.rv == 0 || cur.rv == 10 || cur.rv == 20));
            if (cur.sat == 0 && cur.unsat == 0 && !rv_ok)
              cur.runtime = error_line;

            if (fn.StartsWith("QF_BV-sat\\")) fn = fn.Substring(10);
            else if (fn.StartsWith("QF_BV-sat-hard\\")) 
              fn = fn.Substring(15);

            if (!data.ContainsKey(fn))
              data.Add(fn, new Dictionary<int, CSVDatum>());
            data[fn].Add(id, cur);
          }

          rd.Close();
        }
        f.WriteLine();

        // Write headers
        f.Write(",");
        for (int i = 0; i < dataGrid.SelectedItems.Count; i++)
        {
          DataRowView rowView = (DataRowView)dataGrid.SelectedItems[i];
          int id = (int)rowView["ID"];
          f.Write("R" + id + ",T" + id + ",SAT" + id + ",UNSAT" + id + ",");
        }
        f.WriteLine();

        // Write data.
        foreach (KeyValuePair<string, Dictionary<int, CSVDatum>> d in data.OrderBy(x => x.Key))
        {
          bool skip = false;
          for (int i = 0; i < dataGrid.SelectedItems.Count; i++)
          {
            DataRowView rowView = (DataRowView)dataGrid.SelectedItems[i];
            int id = (int)rowView["ID"];
            if (!d.Value.ContainsKey(id) || d.Value[id] == null)
              skip = true;
          }
          if (skip)
            continue;

          f.Write(d.Key + ",");

          for (int i = 0; i < dataGrid.SelectedItems.Count; i++)
          {
            DataRowView rowView = (DataRowView)dataGrid.SelectedItems[i];
            int id = (int)rowView["ID"];

            if (!d.Value.ContainsKey(id) || d.Value[id] == null)
              f.Write("MISSING,,,,");
            else
            {
              CSVDatum c = d.Value[id];
              f.Write(c.rv + ",");
              f.Write(c.runtime + ",");
              f.Write(c.sat + ",");
              f.Write(c.unsat + ",");
            }
          }

          f.WriteLine();
        }

        f.Close();
      }

      Mouse.OverrideCursor = null;
    }

    private void canShowProperties(object sender, CanExecuteRoutedEventArgs e)
    {
      e.CanExecute = (sql != null) && (dataGrid.SelectedItems.Count == 1);
    }

    private void canDeleteExperiment(object sender, CanExecuteRoutedEventArgs e)
    {
      e.CanExecute = (sql != null) && (dataGrid.SelectedItems.Count >= 1);
    }

    private void canShowCompare(object sender, CanExecuteRoutedEventArgs e)
    {
      e.CanExecute = (sql != null) && (dataGrid.SelectedItems.Count == 2);
    }

    private void canShowScatterplot(object sender, CanExecuteRoutedEventArgs e)
    {
      e.CanExecute = (sql != null) && (dataGrid.SelectedItems.Count == 2);
    }

    private void canSave(object Sender, CanExecuteRoutedEventArgs e)
    {
      e.CanExecute = (sql != null) && (dataGrid.SelectedItems.Count >= 1);
    }

    private void showCopy(object target, ExecutedRoutedEventArgs e)
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

        Submission sdlg = null;

        do
        {
          Int32Collection subset = null;
          if (jobIDs.Count > 20)
          {
            subset = new Int32Collection();
            for (int i = 0; i < 20; i++)
            {
              subset.Add(jobIDs[0]);
              jobIDs.RemoveAt(0);
            }
          }
          else
          {
            subset = new Int32Collection(jobIDs);
            jobIDs.Clear();
          }

          sdlg = new Submission(txtDatabase.Text, backupDB, subset, false /* no move */);
          sdlg.Owner = this;
          sdlg.ShowDialog();

          if (sdlg.lastError != null)
            System.Windows.MessageBox.Show(this, sdlg.lastError.Message, "Error",
            System.Windows.MessageBoxButton.OK,
            System.Windows.MessageBoxImage.Error);
        }
        while (jobIDs.Count > 0 && sdlg.lastError == null);
      }
    }

    private void canShowCopy(object Sender, CanExecuteRoutedEventArgs e)
    {
      e.CanExecute = (sql != null) && (dataGrid.SelectedItems.Count >= 1);
    }

    private void showMove(object target, ExecutedRoutedEventArgs e)
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

        Submission sdlg = null;

        do
        {
          Int32Collection subset = null;
          if (jobIDs.Count > 20)
          {
            subset = new Int32Collection();
            for (int i = 0; i < 20; i++)
            {
              subset.Add(jobIDs[0]);
              jobIDs.RemoveAt(0);
            }
          }
          else
          {
            subset = new Int32Collection(jobIDs);
            jobIDs.Clear();
          }

          sdlg = new Submission(txtDatabase.Text, backupDB, subset, true /* move */);
          sdlg.Owner = this;
          sdlg.ShowDialog();
        }
        while (jobIDs.Count > 0 && sdlg.lastError == null);

        if (sdlg.lastError != null)
          System.Windows.MessageBox.Show(this, sdlg.lastError.Message, "Error",
          System.Windows.MessageBoxButton.OK,
          System.Windows.MessageBoxImage.Error);
      }
    }

    private void canShowMove(object Sender, CanExecuteRoutedEventArgs e)
    {
      e.CanExecute = (sql != null) && (dataGrid.SelectedItems.Count >= 1);
    }

    private void showCreateGroup(object target, ExecutedRoutedEventArgs e)
    {
      bool first = true;
      string category = "";
      IEnumerator den = dataGrid.SelectedItems.GetEnumerator();
      DataRowView rv;
      while (den.MoveNext())
      {
        rv = (DataRowView)den.Current;
        string cur = (string)rv["Category"];
        if (first) { category = cur; first = false; }
        else if (cur != category)
        {
          System.Windows.MessageBox.Show(this, "Jobs in a group need to have the same category.", "Error",
                                      System.Windows.MessageBoxButton.OK,
                                      System.Windows.MessageBoxImage.Error);
          return;
        }
      }

      CreateGroupDialog dlg = new CreateGroupDialog();
      dlg.Owner = this;
      if (dlg.ShowDialog() == true)
      {
        Mouse.OverrideCursor = System.Windows.Input.Cursors.Wait;

        string name = dlg.txtGroupName.Text;
        string note = dlg.txtNote.Text;

        SqlCommand cmd = new SqlCommand("SELECT * FROM JobGroups WHERE Name='" + name + "'", sql);
        SqlDataReader r = cmd.ExecuteReader();
        if (r.HasRows)
        {
          System.Windows.MessageBox.Show(this, "Jobgroup with the same name already exists.", "Error",
                                          System.Windows.MessageBoxButton.OK,
                                          System.Windows.MessageBoxImage.Error);
          r.Close();
          return;
        }
        r.Close();

        string username = WindowsIdentity.GetCurrent().Name.ToString();

        cmd = new SqlCommand("INSERT INTO JobGroups (Name,Creator,Category,Note) VALUES (" +
                             "'" + name + "'," +
                             "'" + username + "'," +
                             "'" + category + "'," +
                             "'" + note + "'); SELECT SCOPE_IDENTITY() as NewID;", sql);
        r = cmd.ExecuteReader();
        if (!r.HasRows)
        {
          System.Windows.MessageBox.Show(this, "Jobgroup creation failed.", "Error",
                                          System.Windows.MessageBoxButton.OK,
                                          System.Windows.MessageBoxImage.Error);
          r.Close();
          return;
        }
        r.Read();
        int jgid = Convert.ToInt32(r[0]);
        r.Close();

        den = dataGrid.SelectedItems.GetEnumerator();
        while (den.MoveNext())
        {
          rv = (DataRowView)den.Current;
          int jid = (int)rv["ID"];
          cmd = new SqlCommand("INSERT INTO JobGroupData (JobID,GroupID) VALUES (" + jid + "," + jgid + ");", sql);
          cmd.ExecuteNonQuery();
        }

        updateDataGrid();

        Mouse.OverrideCursor = null;
      }
    }

    private void canShowCreateGroup(object Sender, CanExecuteRoutedEventArgs e)
    {
      e.CanExecute = (sql != null) && (dataGrid.SelectedItems.Count >= 1);
    }


    private void jobgroupGrid_MouseDoubleClick(object sender, MouseButtonEventArgs e)
    {

    }

    private void canDeleteJobGroup(object sender, CanExecuteRoutedEventArgs e)
    {
      e.CanExecute = (sql != null) && (jobgroupGrid.SelectedItems.Count >= 1);
    }

    private void deleteJobGroup(object sender, ExecutedRoutedEventArgs e)
    {

    }

    private void canShowGroupScatterplot(object sender, CanExecuteRoutedEventArgs e)
    {
      e.CanExecute = (sql != null) && (jobgroupGrid.SelectedItems.Count == 2);
    }

    private void showGroupScatterplot(object target, ExecutedRoutedEventArgs e)
    {
      Mouse.OverrideCursor = System.Windows.Input.Cursors.Wait;

      DataRowView rowView = (DataRowView)jobgroupGrid.SelectedItems[0];
      int id1 = (int)rowView["ID"];
      rowView = (DataRowView)jobgroupGrid.SelectedItems[1];
      int id2 = (int)rowView["ID"];

      GroupScatterPlot sp = new GroupScatterPlot(id1, id2, sql);
      sp.Show();

      Mouse.OverrideCursor = null;
    }

    private void canShowSaveBinary(object Sender, CanExecuteRoutedEventArgs e)
    {
      e.CanExecute = (sql != null) && (dataGrid.SelectedItems.Count == 1);
    }

    private void showSaveBinary(object target, ExecutedRoutedEventArgs e)
    {
      DataRowView rowView = (DataRowView)dataGrid.SelectedItems[0];
      int id = (int)rowView["ID"];

      System.Windows.Forms.SaveFileDialog dlg = new System.Windows.Forms.SaveFileDialog();
      dlg.Filter = "Executable files (*.exe)|*.exe|All files (*.*)|*.*";
      dlg.FilterIndex = 1;
      dlg.RestoreDirectory = true;
      dlg.FileName = "binary_" + id + ".exe";

      if (dlg.ShowDialog() == System.Windows.Forms.DialogResult.OK)
      {
        Mouse.OverrideCursor = System.Windows.Input.Cursors.Wait;
        int binary_id = 0;

        SqlCommand c = new SqlCommand("SELECT Binary FROM Experiments WHERE ID=" + id.ToString(), sql);
        c.CommandTimeout = 0;

        SqlDataReader rd = c.ExecuteReader();
        if (rd.Read())
        {
          binary_id = (int)rd[0];
          rd.Close();
        }
        else
        {
          System.Windows.MessageBox.Show(this, "Could not get binary ID.", "Error",
                                          System.Windows.MessageBoxButton.OK,
                                          System.Windows.MessageBoxImage.Error);
          rd.Close();
          return;
        }

        string fn = dlg.FileName;
        FileStream file = File.Open(fn, System.IO.FileMode.OpenOrCreate, System.IO.FileAccess.Write);

        c = new SqlCommand("SELECT Binary FROM Binaries WHERE ID=" + binary_id.ToString(), sql);
        c.CommandTimeout = 0;

        rd = c.ExecuteReader();
        if (rd.Read())
        {
          byte[] data = (byte[])rd[0];
          file.Write(data, 0, data.Length);
          file.Close();
          rd.Close();
        }
        else
        {
          System.Windows.MessageBox.Show(this, "Could not get binary data.", "Error",
                                          System.Windows.MessageBoxButton.OK,
                                          System.Windows.MessageBoxImage.Error);
          file.Close();
          rd.Close();
        }
      }

      Mouse.OverrideCursor = null;
    }

    private void canShowReinforcements(object Sender, CanExecuteRoutedEventArgs e)
    {
      e.CanExecute = (sql != null) && (dataGrid.SelectedItems.Count == 1);
    }

    private void showReinforcements(object target, ExecutedRoutedEventArgs e)
    {
        ReinforcementsDialog dlg = new ReinforcementsDialog();
        dlg.Owner = this;
        if (dlg.ShowDialog() == true)
        {
            DataRowView rowView = (DataRowView)dataGrid.SelectedItems[0];

            string rcluster = dlg.txtRCluster.Text;
            int nworkers = Convert.ToInt32(dlg.txtNumWorkers.Text);
            int jid = (int)rowView["ID"];
            int priority = dlg.cmbPriority.SelectedIndex;
            
            Submission sdlg = null;

            sdlg = new Submission(txtDatabase.Text, jid, rcluster, nworkers, priority);
            sdlg.Owner = this;
            sdlg.ShowDialog();

            if (sdlg.lastError != null)
                System.Windows.MessageBox.Show(this, sdlg.lastError.Message, "Error",
                System.Windows.MessageBoxButton.OK,
                System.Windows.MessageBoxImage.Error);
        }
    }

    private void canShowFlag(object Sender, CanExecuteRoutedEventArgs e)
    {
      e.CanExecute = (sql != null) && (dataGrid.SelectedItems.Count >= 1);
    }

    private void showFlag(object target, ExecutedRoutedEventArgs e)
    {      
      foreach (DataRowView drv in dataGrid.SelectedItems)
      {
        int id = (int)drv["ID"];
        bool old = (bool)drv["Flag"];

        SqlCommand c = new SqlCommand("UPDATE Experiments SET Flag=" + ((old == true) ? "0" : "1") + " WHERE ID=" + id, sql);
        c.ExecuteNonQuery();
        
        drv.Row["Flag"] = (old == true) ? 0 : 1;
      }
    }

    private void txtFilter_KeyUp(object sender, System.Windows.Input.KeyEventArgs e)
    {
      if (e.Key == Key.Enter)
        updateDataGrid();
    }

    private void canFocusOnFilter(object Sender, CanExecuteRoutedEventArgs e)
    {
      e.CanExecute = true;
    }

    private void focusOnFilter(object sender, ExecutedRoutedEventArgs e)
    {
      txtFilter.SelectAll();
      txtFilter.Focus();
    }

    private void canShowDuplicates(object Sender, CanExecuteRoutedEventArgs e)
    {
        e.CanExecute = (sql != null) && (dataGrid.SelectedItems.Count == 1);
    }

    private void showDuplicates(object sender, ExecutedRoutedEventArgs e)
    {
        Mouse.OverrideCursor = System.Windows.Input.Cursors.Wait;

        DataRowView rowView = (DataRowView)dataGrid.SelectedItems[0];
        int eid = (int)rowView["ID"];

        SqlCommand cmd = new SqlCommand("SELECT TOP 1 COUNT(*) as Count,FilenameP FROM Data WHERE ExperimentID=" + eid + " GROUP BY FilenameP HAVING COUNT(*)>1", sql);
        SqlDataReader r = cmd.ExecuteReader();

        if (r.HasRows)
        {
            r.Close();

            Duplicates dlg = new Duplicates(eid, sql);
            dlg.ShowDialog();
        }
        else
        {
            r.Close();
            System.Windows.MessageBox.Show(this,
                "This experiment has no duplicates.", "No duplicates.",
                System.Windows.MessageBoxButton.OK,
                System.Windows.MessageBoxImage.Information);
        }        

        Mouse.OverrideCursor = null;
    }

    private void canShowTally(object Sender, CanExecuteRoutedEventArgs e)
    {
        e.CanExecute = (sql != null) && (dataGrid.SelectedItems.Count > 0);
    }

    private void showTally(object sender, ExecutedRoutedEventArgs e)
    {
      Mouse.OverrideCursor = System.Windows.Input.Cursors.Wait;

      double total = 0.0; // in hours

      foreach (DataRowView drv in dataGrid.SelectedItems)
      {
        int id = (int)drv["ID"];
        SqlCommand cmd = new SqlCommand("SELECT SUM(Runtime)/6300 FROM Data WHERE ExperimentID=" + id, sql);
        SqlDataReader r = cmd.ExecuteReader();
        while (r.Read())
          total += (double)r[0];
        r.Close();
      }

      TimeSpan ts = TimeSpan.FromHours(total);

      System.Windows.MessageBox.Show(this,
                     "The total amount of runtime spent computing the selected results is " + ts.ToString() + ".", "Tally",
                     System.Windows.MessageBoxButton.OK,
                     System.Windows.MessageBoxImage.Information);     

      Mouse.OverrideCursor = null;
    }
  }
}