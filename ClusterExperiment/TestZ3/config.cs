using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Xml;
using System.IO;

namespace TestZ3
{
  class DirTypePair { public string dir; public string type; };

  class Configuration
  {
    // We search for binaries in DROPDIR\*\BINDIR

    public string DROPDIR = @"";
    public string REGRESSIONDIR = "";
    public double TIMEOUT = 100.0; // 100 secs
    public long MEMOUT = 64 * 1024 * 1024; // 64 Mbytes          
    public List<string> Developers;
    public List<DirTypePair> Directories;
    public List<string> ExcludeDirectories;

    public Dictionary<string, List<TestConfiguration>> testConfigs = new Dictionary<string, List<TestConfiguration>>();

    public Configuration()
    {
      Developers = new List<string>();
      Directories = new List<DirTypePair>();      
      ExcludeDirectories = new List<string>();
    }

    public void setDefault()
    {
      Developers.Add("cwinter@microsoft.com");
    }

    public void load(string configFile)
    {
      // Console.WriteLine(now() + ": Reading configuration from " + configFile);      

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
                    DROPDIR = reader.GetAttribute("DROPDIR");
                    REGRESSIONDIR = reader.GetAttribute("REGRESSIONDIR");
                    TIMEOUT = Convert.ToDouble(reader.GetAttribute("TIMEOUT"));
                    MEMOUT = Convert.ToUInt32(reader.GetAttribute("MEMOUT"));                    
                  }
                  break;
                case "Developer":
                  {
                    Developers.Add(reader.GetAttribute("name"));
                    break;
                  }
                case "Directory":
                  {
                    DirTypePair np = new DirTypePair();
                    np.dir = reader.GetAttribute("name");
                    np.type = reader.GetAttribute("type");
                    if (np.type == "") np.type = "smt2";
                    Directories.Add(np);
                    break;
                  }
                case "ExcludeDirectory":
                  {
                    ExcludeDirectories.Add(reader.GetAttribute("name"));
                    break;
                  }
                case "TestConfig":
                  {
                      TestConfiguration t = new TestConfiguration();
                      t.Read(reader);
                      if (!testConfigs.ContainsKey(t.type))
                          testConfigs.Add(t.type, new List<TestConfiguration>());
                      testConfigs[t.type].Add(t);
                      break;
                  }
                default: /* nothing */ break;
              }
              break;
            }
          default: /* nothing */ break;
        }
      }
    }
  };

  class TestConfiguration
  {
      public string name = "unnamed";
      public string type = "unknown";
      public string bindir = "external";
      public string bin = "z3.exe";
      public string args = "-smt2";
      public string executor = "";
      public string executor_args = "";
      public string absolute_dir = "";
      public string driver = "";

      public void Read(XmlReader reader)
      {
          name = reader.GetAttribute("name");
          type = reader.GetAttribute("type");
          bindir = reader.GetAttribute("bindir");
          bin = reader.GetAttribute("bin");
          args = reader.GetAttribute("args");
          executor = reader.GetAttribute("executor");
          executor_args = reader.GetAttribute("executorArgs");
          driver = reader.GetAttribute("driver");
      }      
  };
}
