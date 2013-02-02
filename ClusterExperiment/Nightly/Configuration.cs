// CM Wintersteiger, 2012

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Xml;
using System.IO;

using Z3Data;

namespace Nightly
{
    public class Configuration
    {
        public string TIMELINEFILE = @"";
        public string DATADIR = @"";
        public uint DAYSBACK = 90;
        public Tags Tags = new Tags();

        public List<string> Developers = new List<string>();
        
        public Configuration(string filename = null)
        {
            if (filename != null)
                load(filename);
        }

        public void setDefault()
        {
            Developers.Add("cwinter@microsoft.com");
        }

        public void load(string configFile)
        {
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
                                        TIMELINEFILE = reader.GetAttribute("TIMELINEFILE");
                                        DATADIR = reader.GetAttribute("DATADIR");
                                        DAYSBACK = Convert.ToUInt32(reader.GetAttribute("DAYSBACK"));
                                    }
                                    break;
                                case "Developer":
                                    {
                                        Developers.Add(reader.GetAttribute("name"));
                                        break;
                                    }
                                case "Tag":
                                    {
                                        Tags.Insert(reader.GetAttribute("name"), Convert.ToUInt32(reader.GetAttribute("id")));
                                        break;
                                    }
                                default: /* nothing */ break;
                            }
                            break;
                        }
                    default: /* nothing */ break;
                }
            }

            reader.Close();
        }
    };
}
