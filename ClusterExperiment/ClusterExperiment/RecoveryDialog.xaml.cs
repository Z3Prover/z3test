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
using Microsoft.Win32;

namespace ClusterExperiment
{
  /// <summary>
  /// Interaction logic for RecoveryDialog.xaml
  /// </summary>
  public partial class RecoveryDialog : Window
  {
      const string userRoot = "HKEY_CURRENT_USER";
      const string subkey = "ClusterExperiments";
      const string keyName = userRoot + "\\" + subkey;      

      public RecoveryDialog()
      {
        InitializeComponent();        
      }

      private void Window_Loaded(object sender, RoutedEventArgs e)
      {        
        txtRCluster.Text = (string)Registry.GetValue(keyName, "RecoveryCluster", "");
        txtNumWorkers.Text = (string)Registry.GetValue(keyName, "RecoveryNumWorkers", "");
        cmbPriority.SelectedIndex = (int)Registry.GetValue(keyName, "RecoveryPriority", (int)2);
        string default_excutor = (string)Registry.GetValue(keyName, "Executable", "");
        txtExecutor.Text = (string)Registry.GetValue(keyName, "RecoveryExecutor", default_excutor);
        txtJobTemplate.Text = (string)Registry.GetValue(keyName, "RecoveryJobTemplate", "");
      }

      private void okButton_Click(object sender, RoutedEventArgs e)
      {
        Registry.SetValue(keyName, "RecoveryCluster", txtRCluster.Text, RegistryValueKind.String);
        Registry.SetValue(keyName, "RecoveryNumWorkers", txtNumWorkers.Text, RegistryValueKind.String);
        Registry.SetValue(keyName, "RecoveryPriority", cmbPriority.SelectedIndex, RegistryValueKind.DWord);
        Registry.SetValue(keyName, "RecoveryExecutor", txtExecutor.Text, RegistryValueKind.String);
        Registry.SetValue(keyName, "RecoveryJobTemplate", txtJobTemplate.Text, RegistryValueKind.String);
        
        DialogResult = true;
      }

      private void cancelButton_Click(object sender, RoutedEventArgs e)
      {
        DialogResult = false;
      }
  }
}
