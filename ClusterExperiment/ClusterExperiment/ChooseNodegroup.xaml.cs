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
using Microsoft.Hpc.Scheduler;

namespace ClusterExperiment
{
  /// <summary>
  /// Interaction logic for ChooseNodegroup.xaml
  /// </summary>
  public partial class ChooseNodegroup : Window
  {
    public ChooseNodegroup(string cluster)
    {
      InitializeComponent();      

      listBox.Items.Clear();
      listBox.Items.Add("<Any>");

      if (cluster != "")
      {
        try
        {
          Scheduler scheduler = new Scheduler();
          scheduler.Connect(cluster);

          IStringCollection ngs = scheduler.GetNodeGroupList();
          foreach (String ng in ngs)
          {
            listBox.Items.Add(ng /*+ " (" + scheduler.GetNodesInNodeGroup(ng).Count().ToString() + ")" */ );
          }
        }
        catch
        {
        }
      }

      Mouse.OverrideCursor = null;
    }

    private void listBox_MouseDoubleClick(object sender, MouseButtonEventArgs e)
    {
      DialogResult = true;
      Close();
    }
  }
}
