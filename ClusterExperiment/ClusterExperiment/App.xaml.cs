using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Windows;
using Microsoft.Win32;

namespace ClusterExperiment
{
  /// <summary>
  /// Interaction logic for App.xaml
  /// </summary>
  public partial class App : Application
  {
      const string userRoot = "HKEY_CURRENT_USER";
      const string subkey = "ClusterExperiments";
      const string keyName = userRoot + "\\" + subkey;

      protected override void OnStartup(StartupEventArgs e)
      {
          base.OnStartup(e);
          RegistryKey rk = Registry.CurrentUser.CreateSubKey(subkey);
      }
  }
}
