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
      txtNumWorkers.Text = (string)Registry.GetValue(keyName, "ReinforcementsNum", "");
      cmbPriority.SelectedIndex = (int)Registry.GetValue(keyName, "ReinforcementsPriority", (int)2);
    }

    private void okButton_Click(object sender, RoutedEventArgs e)
    {
      Registry.SetValue(keyName, "ReinforcementsCluster", txtRCluster.Text, RegistryValueKind.String);
      Registry.SetValue(keyName, "ReinforcementsNum", txtNumWorkers.Text, RegistryValueKind.String);
      Registry.SetValue(keyName, "ReinforcementsPriority", cmbPriority.SelectedIndex, RegistryValueKind.DWord);

      DialogResult = true;
    }

    private void cancelButton_Click(object sender, RoutedEventArgs e)
    {
      DialogResult = false;
    }
  }
}
