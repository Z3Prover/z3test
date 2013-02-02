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
using System.Collections;
using System.IO;

namespace ClusterExperiment
{
  /// <summary>
  /// Interaction logic for ChooseCategories.xaml
  /// </summary>
  public partial class ChooseCategories : Window
  {
    public ChooseCategories(string sharedDir, string[] currentSelection)
    {
      InitializeComponent();
      
      listBox.Items.Clear();
      if (Directory.Exists(sharedDir))
      {
        IEnumerable<string> dirs = Directory.EnumerateDirectories(sharedDir);
        foreach (String s in dirs)
        {
          string entry = s.Substring(s.LastIndexOf('\\') + 1);
          int x = listBox.Items.Add(entry);
          if (currentSelection.Contains(entry))
            listBox.SelectedItems.Add(entry);
        }
      }
      listBox.Focus();

      Mouse.OverrideCursor = null;
    }

    private void okButton_Click(object sender, RoutedEventArgs e)
    {
      this.DialogResult = true;
      Close();
    }

    private void cancelButton_Click(object sender, RoutedEventArgs e)
    {
      this.DialogResult = false;
      Close();
    }
  }
}
