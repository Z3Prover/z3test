using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using System.Xml;

namespace UpdateBinary
{
  class Program
  {        
    class Config
    {
      public string Z3_DROP_DIR = @"";
      public string Z3_RELEASE_DIR = "";
      public string Z3_EXE = "z3.exe";
      public string Z3_TARGET = @"";
      public int MAX_RETRIES = 100;
    };

    static Config getConfig(string configFile)
    {
      // Console.WriteLine(now() + ": Reading configuration from " + configFile);        
      Config res = new Config();

      XmlTextReader reader = new XmlTextReader(configFile);

      while (reader.Read())
      {
        switch (reader.NodeType)
        {
          case XmlNodeType.Element:
            {
              switch (reader.Name)
              {
                case "General":
                  {
                    res.Z3_DROP_DIR = reader.GetAttribute("Z3_DROP_DIR");
                    res.Z3_RELEASE_DIR = reader.GetAttribute("Z3_RELEASE_DIR");
                    res.Z3_EXE = reader.GetAttribute("Z3_EXE");
                    res.Z3_TARGET = reader.GetAttribute("Z3_TARGET");
                    res.MAX_RETRIES = Convert.ToInt32(reader.GetAttribute("MAX_RETRIES"));
                  }
                  break;                
                default: /* nothing */ break;
              }
              break;
            }
          default: /* nothing */ break;
        }
      }

      return res;
    }

    static bool refreshZ3(Config c)
    {
      string FOUND_Z3="";

      bool first = true;
      bool found = false;
      DateTime best = new DateTime();
      DirectoryInfo di = new DirectoryInfo(c.Z3_DROP_DIR);
      DirectoryInfo[] subDirs = di.GetDirectories();
      
      for (int i = 0; i < subDirs.Length; i++)      
      {
        DirectoryInfo subDir = subDirs[i];
        //Console.WriteLine("Searching for Z3 at: " + subDir.Name);
        DirectoryInfo[] releaseDirs = subDir.GetDirectories(c.Z3_RELEASE_DIR);
        foreach (DirectoryInfo releaseDir in releaseDirs)
        {
          FileInfo[] files = releaseDir.GetFiles(c.Z3_EXE);
          foreach (FileInfo file in files)
          {
            DateTime curr = file.CreationTime;
            if (first || curr > best)
            {
              best = curr;
              first = false;
              found = true;
              FOUND_Z3 = file.DirectoryName + "\\" + file.Name;
            }
          }
        }
      }

      if (found)
      {
        // Console.WriteLine("Using Z3: " + FOUND_Z3);
        bool do_copy = true;
        if (File.Exists(c.Z3_TARGET))
        {
          DateTime old_time = File.GetCreationTime(c.Z3_TARGET);
          if (old_time >= best) do_copy = false;
        }

        if (do_copy)
        {
          Console.WriteLine("New binary: " + FOUND_Z3);
          for (int i = 0; i < c.MAX_RETRIES; i++)
          {
            try
            {
              File.Copy(FOUND_Z3, c.Z3_TARGET, true);
              File.SetCreationTime(c.Z3_TARGET, File.GetCreationTime(FOUND_Z3));
            }
            catch
            {
            }
          }
        }
      }
      return found;
    }

    static void Main(string[] args)
    {
      try
      {
        Config c = getConfig("config.xml");
        if (!refreshZ3(c))
          Console.WriteLine("No binary found.");
      }
      catch (Exception e)
      {
        Console.WriteLine("Exception caught: " + e.Message);
      }
    }
  }
}
