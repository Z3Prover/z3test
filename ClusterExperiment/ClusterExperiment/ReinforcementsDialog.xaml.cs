using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using Microsoft.Win32;

namespace ClusterExperiment
{
  /// <summary>
  /// Interaction logic for ReinforcementsDialog.xaml
  /// </summary>
  public partial class ReinforcementsDialog : Window
  {
    const string userRoot = "HKEY_CURRENT_USER";
    const string subkey = "ClusterExperiments";
    const string keyName = userRoot + "\\" + subkey;

    public ReinforcementsDialog()
    {
      InitializeComponent();
    }

    private void Window_Loaded(object sender, RoutedEventArgs e)
    {
      txtRCluster.Text = (string)Registry.GetValue(keyName, "ReinforcementsCluster", "");
      txtNumWorkers.Text = (string)Registry.GetValue(keyName, "ReinforcementsNumWorkers", "");
      cmbPriority.SelectedIndex = (int)Registry.GetValue(keyName, "ReinforcementsPriority", (int)2);
      txtJobTemplate.Text = (string)Registry.GetValue(keyName, "ReinforcementsJobTemplate", "");
      timeJob.Value = new TimeSpan(0, 0, (int)Registry.GetValue(keyName, "ReinforcementsJobTimeout", 43200));
      timeTask.Value = new TimeSpan(0, 0, (int)Registry.GetValue(keyName, "ReinforcementsTaskTimeout", 0));
    }

    private void okButton_Click(object sender, RoutedEventArgs e)
    {
      Registry.SetValue(keyName, "ReinforcementsCluster", txtRCluster.Text, RegistryValueKind.String);
      Registry.SetValue(keyName, "ReinforcementsNumWorkers", txtNumWorkers.Text, RegistryValueKind.String);
      Registry.SetValue(keyName, "ReinforcementsPriority", cmbPriority.SelectedIndex, RegistryValueKind.DWord);
      Registry.SetValue(keyName, "ReinforcementsJobTemplate", txtJobTemplate.Text, RegistryValueKind.String);
      Registry.SetValue(keyName, "ReinforcementsJobTimeout", (timeJob.Value.HasValue ? Convert.ToInt32(timeJob.Value.Value.TotalSeconds) : 0), RegistryValueKind.DWord);
      Registry.SetValue(keyName, "ReinforcementsTaskTimeout", (timeTask.Value.HasValue ? Convert.ToInt32(timeTask.Value.Value.TotalSeconds) : 0), RegistryValueKind.DWord);
      DialogResult = true;
    }

    private void cancelButton_Click(object sender, RoutedEventArgs e)
    {
      DialogResult = false;
    }
  }
}
