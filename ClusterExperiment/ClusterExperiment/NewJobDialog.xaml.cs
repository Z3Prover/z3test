using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using System.IO.Packaging;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Threading;
using System.Windows.Forms;
using Microsoft.Win32;
using Microsoft.Hpc.Scheduler;

namespace ClusterExperiment
{
  /// <summary>
  /// Interaction logic for NewJobDialog.xaml
  /// </summary>
  public partial class NewJobDialog : Window
  {    
    const string userRoot = "HKEY_CURRENT_USER";
    const string subkey = "ClusterExperiments";
    const string keyName = userRoot + "\\" + subkey;

    public NewJobDialog()
    {
      InitializeComponent();
    }

    private void Window_Loaded(object sender, RoutedEventArgs e)
    {
      Mouse.SetCursor(System.Windows.Input.Cursors.Wait);            

      txtCluster.Text = (string)Registry.GetValue(keyName, "Cluster", "");      
      txtExecutor.Text = (string)Registry.GetValue(keyName, "Executor", "");
      cmbNodeGroup.Text = (string)Registry.GetValue(keyName, "Nodegroup", "");
      txtExecutable.Text = (string)Registry.GetValue(keyName, "Executable", "");
      txtParameters.Text = (string)Registry.GetValue(keyName, "Parameters", "");
      cmbLocality.SelectedIndex = (int)Registry.GetValue(keyName, "Locality", (int)0);
      txtMemout.Text = (string)Registry.GetValue(keyName, "Memout", "2147483648");
      txtTimeout.Text = (string)Registry.GetValue(keyName, "Timeout", "");

      txtSharedDir.Text = (string)Registry.GetValue(keyName, "SharedDir", "");
      txtCategories.Text = (string)Registry.GetValue(keyName, "Categories", "");

      if (((int)Registry.GetValue(keyName, "UseMostRecentBinary", 0)) == 1)
        chkMostRecentBinary.IsChecked = true;
      else
        chkNewBinary.IsChecked = true;

      cmbPriority.SelectedIndex = (int)Registry.GetValue(keyName, "Priority", (int)2);
      txtExtension.Text = (string)Registry.GetValue(keyName, "Extension", "smt2");
      txtNote.Text = (string)Registry.GetValue(keyName, "Note", "");
      
      if (((int)Registry.GetValue(keyName, "Parametric", 0)) == 1)
        chkParametricity.IsChecked = true;
      else
        chkParametricity.IsChecked = false;

      txtParametricityFrom.Text = (string)Registry.GetValue(keyName, "ParametricityFrom", "1");
      txtParametricityTo.Text = (string)Registry.GetValue(keyName, "ParametricityTo", "1");
      txtParametricityStep.Text = (string)Registry.GetValue(keyName, "ParametricityStep", "1");      

      Mouse.SetCursor(System.Windows.Input.Cursors.Arrow);
    }

    private void okButton_Click(object sender, RoutedEventArgs e)
    {      
      Registry.SetValue(keyName, "Nodegroup", cmbNodeGroup.Text, RegistryValueKind.String);
      Registry.SetValue(keyName, "Categories", txtCategories.Text, RegistryValueKind.String);
      Registry.SetValue(keyName, "Executable", txtExecutable.Text, RegistryValueKind.String);
      Registry.SetValue(keyName, "Parameters", txtParameters.Text, RegistryValueKind.String);
      Registry.SetValue(keyName, "Locality", cmbLocality.SelectedIndex, RegistryValueKind.DWord);
      Registry.SetValue(keyName, "Memout", txtMemout.Text, RegistryValueKind.String);
      Registry.SetValue(keyName, "Timeout", txtTimeout.Text, RegistryValueKind.String);
      Registry.SetValue(keyName, "Cluster", txtCluster.Text, RegistryValueKind.String);      
      Registry.SetValue(keyName, "SharedDir", txtSharedDir.Text, RegistryValueKind.String);
      Registry.SetValue(keyName, "Executor", txtExecutor.Text, RegistryValueKind.String);
      Registry.SetValue(keyName, "UseMostRecentBinary", (chkMostRecentBinary.IsChecked == true) ? 1 : 0, RegistryValueKind.DWord);
      Registry.SetValue(keyName, "Priority", cmbPriority.SelectedIndex, RegistryValueKind.DWord);
      Registry.SetValue(keyName, "Extension", txtExtension.Text, RegistryValueKind.String);
      Registry.SetValue(keyName, "Note", txtNote.Text, RegistryValueKind.String);
      Registry.SetValue(keyName, "Parametric", (chkParametricity.IsChecked == true) ? 1 : 0, RegistryValueKind.DWord);
      Registry.SetValue(keyName, "ParametricityFrom", txtParametricityFrom.Text, RegistryValueKind.String);
      Registry.SetValue(keyName, "ParametricityTo", txtParametricityTo.Text, RegistryValueKind.String);
      Registry.SetValue(keyName, "ParametricityStep", txtParametricityStep.Text, RegistryValueKind.String);

      DialogResult = true;
    }

    private void cancelButton_Click(object sender, RoutedEventArgs e)
    {
      DialogResult = false;
    }

    private void btnSelectSharedDir_Click(object sender, RoutedEventArgs e)
    {
      Mouse.OverrideCursor = System.Windows.Input.Cursors.Wait;

      FolderBrowserDialog dlg = new FolderBrowserDialog();
      if (Directory.Exists(txtSharedDir.Text))
        dlg.SelectedPath = txtSharedDir.Text;
      
      if (dlg.ShowDialog() == System.Windows.Forms.DialogResult.OK)
      {
        txtSharedDir.Text = dlg.SelectedPath;
      }

      Mouse.OverrideCursor = null;
    }


    private void btnSelectExecutor_Click(object sender, RoutedEventArgs e)
    {
      Mouse.OverrideCursor = System.Windows.Input.Cursors.Wait;

      System.Windows.Forms.FileDialog dlg = new System.Windows.Forms.OpenFileDialog();

      dlg.DefaultExt = "exe";
      dlg.Filter = "Executable files (*.exe)|*.exe";

      if (File.Exists(txtExecutor.Text))
        dlg.FileName = txtExecutor.Text;

      DialogResult res = dlg.ShowDialog();
      if (res == System.Windows.Forms.DialogResult.OK)
      {
        txtExecutor.Text = dlg.FileName;
      }

      Mouse.OverrideCursor = null;
    }

    private static void CopyStream(Stream source, Stream target)
    {
      const int bufSize = 0x1000;
      byte[] buf = new byte[bufSize];
      int bytesRead = 0;
      while ((bytesRead = source.Read(buf, 0, bufSize)) > 0)
        target.Write(buf, 0, bytesRead);
    }

    private void btnSelectExecutable_Click(object sender, RoutedEventArgs e)
    {
      Mouse.OverrideCursor = System.Windows.Input.Cursors.Wait;

      System.Windows.Forms.OpenFileDialog dlg = new System.Windows.Forms.OpenFileDialog();      

      dlg.DefaultExt = "exe";
      dlg.Filter = "Executable files (*.exe)|*.exe|All Files (*.*)|*.*";
      dlg.Multiselect = true;
      
      if (File.Exists(txtExecutable.Text))
        dlg.FileName = txtExecutable.Text;

      if (dlg.ShowDialog() == System.Windows.Forms.DialogResult.OK)
      {
        if (dlg.FileNames.Count() == 1)
        {
          txtExecutable.Text = dlg.FileName;
          chkNewBinary.IsChecked = true;
          chkMostRecentBinary.IsChecked = false;
          txtExecutable.IsEnabled = true;
        }
        else if (dlg.FileNames.Count() > 1)
        {
          // Create a ZipPackage
          string fn = Path.GetTempFileName();

          ZipPackage pkg = (ZipPackage)ZipPackage.Open(fn, FileMode.Create);

          string mainFile = "";
          int exe_count = 0;
          foreach (string f in dlg.FileNames)
          {
            if (f.EndsWith(".exe"))
            {
              mainFile = f;
              exe_count ++;
            }
          }

          if (exe_count != 1)
          {
            SelectMainExe sme = new SelectMainExe();
            foreach (string f in dlg.FileNames)
              sme.lbFiles.Items.Add(f);
            sme.Owner = this;
            Mouse.OverrideCursor = null;
            if (sme.ShowDialog() == true)
              mainFile = sme.selectedFile;
            Mouse.OverrideCursor = System.Windows.Input.Cursors.Wait;
          }

          foreach (string f in dlg.FileNames)
          {            
            Uri uri = PackUriHelper.CreatePartUri(new Uri(Path.GetFileName(f), UriKind.Relative));
            ZipPackagePart p = (ZipPackagePart)pkg.CreatePart(uri, System.Net.Mime.MediaTypeNames.Application.Octet, CompressionOption.Maximum);
            CopyStream(new FileStream(f, FileMode.Open, FileAccess.Read), p.GetStream());
            if (f == mainFile)
              pkg.CreateRelationship(uri, TargetMode.Internal, "http://schemas.openxmlformats.org/package/2006/relationships/meta data/thumbnail");
          }          

          pkg.Close();

          txtExecutable.Text = fn;
          chkNewBinary.IsChecked = true;
          chkMostRecentBinary.IsChecked = false;
          txtExecutable.IsEnabled = true;
        }
      }      

      Mouse.OverrideCursor = null;
    }

    private void btnSelectNodeGroup_Click(object sender, RoutedEventArgs e)
    {
      Mouse.OverrideCursor = System.Windows.Input.Cursors.Wait;

      ChooseNodegroup dlg = new ChooseNodegroup(txtCluster.Text);
      dlg.Owner = this;
      if (dlg.ShowDialog() == true)
      {
        cmbNodeGroup.Text = dlg.listBox.SelectedItem.ToString();
      }

      Mouse.OverrideCursor = null;
    }

    private void btnSelectCategories_Click(object sender, RoutedEventArgs e)
    {
      Mouse.OverrideCursor = System.Windows.Input.Cursors.Wait;

      string[] currentSelection = txtCategories.Text.Split(',');
      ChooseCategories dlg = new ChooseCategories(txtSharedDir.Text, currentSelection);
      dlg.Owner = this;
      if (dlg.ShowDialog() == true)
      {
        txtCategories.Text = "";
        
        foreach (string s in dlg.listBox.SelectedItems)
        {
          if (txtCategories.Text.Length != 0) txtCategories.Text += ",";
          txtCategories.Text += s;
        }
      }

      Mouse.OverrideCursor = null;
    }

    private void chkMostRecentBinary_Checked(object sender, RoutedEventArgs e)
    {
      txtExecutable.IsEnabled = false;
    }

    private void chkNewBinary_Checked(object sender, RoutedEventArgs e)
    {
      txtExecutable.IsEnabled = true;
    }

    private void chkParametricity_Checked(object sender, RoutedEventArgs e)
    {
      txtParametricityFrom.IsEnabled = true;
      txtParametricityTo.IsEnabled = true;
      txtParametricityStep.IsEnabled = true;
    }

    private void chkParametricity_Unchecked(object sender, RoutedEventArgs e)
    {
      txtParametricityFrom.IsEnabled = false;
      txtParametricityTo.IsEnabled = false;
      txtParametricityStep.IsEnabled = false;
    }
  }
}
