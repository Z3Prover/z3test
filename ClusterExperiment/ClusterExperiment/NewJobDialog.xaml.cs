using System;
using System.Collections.Generic;
using System.Diagnostics;
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
using System.Windows.Navigation;
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
            txtLimitMin.Text = (string)Registry.GetValue(keyName, "LimitsMin", "");
            txtLimitMax.Text = (string)Registry.GetValue(keyName, "LimitsMax", "");
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

            if (((int)Registry.GetValue(keyName, "CreateJobgroup", 0)) == 1)
                chkJobgroup.IsChecked = true;
            else
                chkJobgroup.IsChecked = false;

            txtJobgroup.Text = (string)Registry.GetValue(keyName, "JobgroupName", "");

            txtJobTemplate.Text = (string)Registry.GetValue(keyName, "JobTemplate", "Default");

            timeJob.Value = new TimeSpan(0, 0, (int)Registry.GetValue(keyName, "JobTimeout", 43200));
            timeTask.Value = new TimeSpan(0, 0, (int)Registry.GetValue(keyName, "TaskTimeout", 0));

            chkReplaceCheckSat.IsChecked = ((int)Registry.GetValue(keyName, "ReplaceCheckSatEnabled", 0)) != 0;
            txtReplaceCheckSat.Text = (string)Registry.GetValue(keyName, "ReplaceCheckSatText", "");

            Mouse.SetCursor(System.Windows.Input.Cursors.Arrow);
        }

        private void okButton_Click(object sender, RoutedEventArgs e)
        {
            Registry.SetValue(keyName, "Nodegroup", cmbNodeGroup.Text, RegistryValueKind.String);
            Registry.SetValue(keyName, "Categories", txtCategories.Text, RegistryValueKind.String);
            Registry.SetValue(keyName, "Executable", txtExecutable.Text, RegistryValueKind.String);
            Registry.SetValue(keyName, "Parameters", txtParameters.Text, RegistryValueKind.String);
            Registry.SetValue(keyName, "Locality", cmbLocality.SelectedIndex, RegistryValueKind.DWord);
            Registry.SetValue(keyName, "LimitsMin", txtLimitMin.Text, RegistryValueKind.String);
            Registry.SetValue(keyName, "LimitsMax", txtLimitMax.Text, RegistryValueKind.String);
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
            Registry.SetValue(keyName, "CreateJobgroup", (chkJobgroup.IsChecked == true) ? 1 : 0, RegistryValueKind.DWord);
            Registry.SetValue(keyName, "JobgroupName", txtJobgroup.Text, RegistryValueKind.String);
            Registry.SetValue(keyName, "JobTemplate", txtJobTemplate.Text, RegistryValueKind.String);
            Registry.SetValue(keyName, "JobTimeout", (timeJob.Value.HasValue ? Convert.ToInt32(timeJob.Value.Value.TotalSeconds) : 0), RegistryValueKind.DWord);
            Registry.SetValue(keyName, "TaskTimeout", (timeTask.Value.HasValue ? Convert.ToInt32(timeTask.Value.Value.TotalSeconds) : 0), RegistryValueKind.DWord);
            Registry.SetValue(keyName, "ReplaceCheckSatEnabled", (chkReplaceCheckSat.IsChecked == true) ? 1 : 0, RegistryValueKind.DWord);
            Registry.SetValue(keyName, "ReplaceCheckSatText", txtReplaceCheckSat.Text, RegistryValueKind.String);
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

        private void btnSelectExecutable_Click(object sender, RoutedEventArgs e)
        {
            Mouse.OverrideCursor = System.Windows.Input.Cursors.Wait;

            System.Windows.Forms.OpenFileDialog dlg = new System.Windows.Forms.OpenFileDialog();

            dlg.DefaultExt = "exe";
            dlg.Filter = "Executable files (*.exe;*.dll)|*.exe;*.dll|All Files (*.*)|*.*";
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
                    string mainFile = "";
                    int exe_count = 0;
                    foreach (string f in dlg.FileNames)
                    {
                        if (f.EndsWith(".exe"))
                        {
                            mainFile = f;
                            exe_count++;
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

                    string fn = Path.GetTempFileName();
                    SubmissionLib.SubmissionWorker.mkZip(fn, dlg.FileNames, mainFile);

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
            if (txtCluster.Text == "")
                System.Windows.MessageBox.Show("Can't select nodegroup without known headnode.", "Error", MessageBoxButton.OK, MessageBoxImage.Information);
            else
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
            chkJobgroup.IsEnabled = true;
        }

        private void chkParametricity_Unchecked(object sender, RoutedEventArgs e)
        {
            txtParametricityFrom.IsEnabled = false;
            txtParametricityTo.IsEnabled = false;
            txtParametricityStep.IsEnabled = false;
            chkJobgroup.IsEnabled = false;
        }

        private void chkJobgroup_Checked(object sender, RoutedEventArgs e)
        {
            txtJobgroup.IsEnabled = true;
        }

        private void chkJobgroup_Unchecked(object sender, RoutedEventArgs e)
        {
            txtJobgroup.IsEnabled = false;
        }

        private void cmbLocality_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (lblLimitsUnit != null & cmbLocality.SelectedItem != null)
            {
                switch (cmbLocality.SelectedIndex)
                {
                    case 0: lblLimitsUnit.Content = "Cores"; break;
                    case 1: lblLimitsUnit.Content = "Sockets"; break;
                    case 2: lblLimitsUnit.Content = "Nodes"; break;
                    default: lblLimitsUnit.Content = "?"; break;
                }
            }
        }

        private void txtLimitMax_LostFocus(object sender, RoutedEventArgs e)
        {
            try
            {
                if ((txtLimitMin.Text.Trim() != "") &&
                    (txtLimitMax.Text.Trim() != ""))
                {
                    uint min = Convert.ToUInt32(txtLimitMin.Text);
                    uint max = Convert.ToUInt32(txtLimitMax.Text);
                    if (max < min)
                        System.Windows.MessageBox.Show("Max should be greater than min.", "Error", MessageBoxButton.OK, MessageBoxImage.Information);
                }
            }
            catch { }
        }

        private void btnSelectTemplate_Click(object sender, RoutedEventArgs e)
        {
            if (txtCluster.Text == "")
                System.Windows.MessageBox.Show("Can't select job template without known headnode.", "Error", MessageBoxButton.OK, MessageBoxImage.Information);
            else
            {
                Mouse.OverrideCursor = System.Windows.Input.Cursors.Wait;



                ChooseJobTemplate dlg = new ChooseJobTemplate(txtCluster.Text);
                dlg.Owner = this;
                if (dlg.ShowDialog() == true)
                {
                    txtJobTemplate.Text = dlg.lstTemplates.SelectedItem.ToString();
                }

                Mouse.OverrideCursor = null;
            }
        }

        private void Hyperlink_RequestNavigate(object sender, System.Windows.Navigation.RequestNavigateEventArgs e)
        {
            Process.Start(new ProcessStartInfo(e.Uri.AbsoluteUri));
            e.Handled = true;
        }

        private void chkReplaceCheckSat_Checked(object sender, RoutedEventArgs e)
        {
            txtReplaceCheckSat.IsEnabled = true;
        }

        private void chkReplaceCheckSat_Unchecked(object sender, RoutedEventArgs e)
        {
            txtReplaceCheckSat.IsEnabled = false;
        }
    }
}
