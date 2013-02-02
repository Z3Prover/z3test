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
  /// Interaction logic for CopyDialog.xaml
  /// </summary>
  public partial class CopyDialog : Window
  {
    const string userRoot = "HKEY_CURRENT_USER";
    const string subkey = "ClusterExperiments";
    const string keyName = userRoot + "\\" + subkey;

    public CopyDialog()
    {
      InitializeComponent();
    }

    private void Window_Loaded(object sender, RoutedEventArgs e)
    {      
      txtDB.Text = (string)Registry.GetValue(keyName, "BackupDB", "");
    }

    private void okButton_Click(object sender, RoutedEventArgs e)
    {
      Registry.SetValue(keyName, "BackupDB", txtDB.Text, RegistryValueKind.String);
      DialogResult = true;
    }

    private void cancelButton_Click(object sender, RoutedEventArgs e)
    {
      DialogResult = false;
    }
  }
}
