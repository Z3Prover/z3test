using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Forms;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using Microsoft.Win32;

namespace ClusterExperiment
{
    public partial class CatchallDialog : Window
    {
        const string userRoot = "HKEY_CURRENT_USER";
        const string subkey = "ClusterExperiments";
        const string keyName = userRoot + "\\" + subkey;

        public CatchallDialog()
        {
            InitializeComponent();

            txtCluster.Text = (string)Registry.GetValue(keyName, "CatchallCluster", (string)Registry.GetValue(keyName, "Cluster", ""));
            cmbPriority.SelectedIndex = (int)Registry.GetValue(keyName, "CatchallPriority", (int)Registry.GetValue(keyName, "Priority", (int)2));
            cmbNodeGroup.Text = (string)Registry.GetValue(keyName, "CatchallNodegroup", (string)Registry.GetValue(keyName, "Nodegroup", ""));
            cmbLocality.SelectedIndex = (int)Registry.GetValue(keyName, "CatchallLocality", (int)Registry.GetValue(keyName, "Locality", (int)0));
            txtExecutor.Text = (string)Registry.GetValue(keyName, "CatchallExecutor", (string)Registry.GetValue(keyName, "Executor", ""));
            txtLimitMin.Text = (string)Registry.GetValue(keyName, "CatchallLimitMin", "1");
            txtLimitMax.Text = (string)Registry.GetValue(keyName, "CatchallLimitMax", "10");
            txtJobTemplate.Text = (string)Registry.GetValue(keyName, "CatchallJobTemplate", "");
            timeJob.Value = TimeSpan.FromSeconds((int)Registry.GetValue(keyName, "CatchallJobTimeout", 43200));
            timeTask.Value = TimeSpan.FromSeconds((int)Registry.GetValue(keyName, "CatchallTaskTimeout", 0));
        }

        private void okButton_Click(object sender, RoutedEventArgs e)
        {
            Registry.SetValue(keyName, "CatchallCluster", txtCluster.Text, RegistryValueKind.String);
            Registry.SetValue(keyName, "CatchallPriority", cmbPriority.SelectedIndex, RegistryValueKind.DWord);
            Registry.SetValue(keyName, "CatchallNodegroup", cmbNodeGroup.Text, RegistryValueKind.String);
            Registry.SetValue(keyName, "CatchallLocality", cmbLocality.SelectedIndex, RegistryValueKind.DWord);
            Registry.SetValue(keyName, "CatchallExecutor", txtExecutor.Text, RegistryValueKind.String);
            Registry.SetValue(keyName, "CatchallLimitMin", txtLimitMin.Text, RegistryValueKind.String);
            Registry.SetValue(keyName, "CatchallLimitMax", txtLimitMax.Text, RegistryValueKind.String);
            Registry.SetValue(keyName, "CatchallJobTemplate", txtJobTemplate.Text, RegistryValueKind.String);
            Registry.SetValue(keyName, "CatchallJobTimeout", (timeJob.Value.HasValue ? Convert.ToInt32(timeJob.Value.Value.TotalSeconds) : 0), RegistryValueKind.QWord);
            Registry.SetValue(keyName, "CatchallTaskTimeout", (timeTask.Value.HasValue ? Convert.ToInt32(timeTask.Value.Value.TotalSeconds) : 0), RegistryValueKind.QWord);
            DialogResult = true;
        }
        private void cancelButton_Click(object sender, RoutedEventArgs e)
        {
            DialogResult = false;
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

    }
}
