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

namespace ClusterExperiment
{
  /// <summary>
  /// Interaction logic for SelectMainExe.xaml
  /// </summary>
  public partial class SelectMainExe : Window
  {
    public string selectedFile = null;

    public SelectMainExe()
    {
      InitializeComponent();
    }

    private void lbFiles_MouseDoubleClick(object sender, MouseButtonEventArgs e)
    {
      selectedFile = (string)lbFiles.SelectedItem;
      DialogResult = true;
    }
  }
}
