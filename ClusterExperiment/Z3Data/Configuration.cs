using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using System.Xml;

namespace Z3Data
{
    public class Configuration
    {
        // Cluster
        public string cluster = "";
        public string timeout = "";
        public HashSet<string> alternativeClusters = new HashSet<string>();

        public string db = "";
        public string category = "";
        public string sharedDir = @"";
        public string executor = @"";
        public string parameters = "";
        public string memout = "";

        public string nodegroup = "";
        public string locality = "";
        public string username = "";
        public int priority = 2;
        public string extension = "";
        public string note = "";
        public string minResources = "";
        public string maxResources = "";
        public string jobTemplate = "";

        // Where is Z3?
        public string z3_drop_dir = "";
        public string z3_release_dir = "";
        public string z3_exe = "";

        // Devs
        public List<string> developers = new List<string>();

        // Data
        public string datadir = "";
        public string timeline = "";

        // Fuzzer
        public string fuzzer_target = "";
        public uint fuzzer_max_retries = 10;

        // Web
        public uint daysback = 90;

        // Data tags
        public Tags tags = new Tags();

        // Codeplex
        public string package_dir = "";
        public string codeplex_username = "";
        public string codeplex_password = "";

        // Build system
        public string build_log = "";

        public Configuration(string configFile)
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
                                case "Cluster":
                                    {
                                        cluster = reader.GetAttribute("hostname");
                                        nodegroup = reader.GetAttribute("nodegroup");
                                        username = reader.GetAttribute("username");
                                        executor = reader.GetAttribute("executor");
                                        note = reader.GetAttribute("note");
                                        if ((cluster == null) || (nodegroup == null) ||
                                            (username == null) || (executor == null))
                                            throw new Exception("Invalid cluster config");
                                        minResources = reader.GetAttribute("minResources");
                                        maxResources = reader.GetAttribute("maxResources");
                                        jobTemplate = reader.GetAttribute("jobTemplate");
                                    }
                                    break;
                                case "AlternativeCluster":
                                    {
                                        alternativeClusters.Add(reader.GetAttribute("name"));
                                    }
                                    break;
                                case "Database":
                                    {
                                        db = reader.GetAttribute("connectionString");
                                        if (db == null)
                                            throw new Exception("Invalid database config");
                                    }
                                    break;
                                case "Job":
                                    {
                                        sharedDir = reader.GetAttribute("sharedDirectory");
                                        category = reader.GetAttribute("category");
                                        extension = reader.GetAttribute("extension");
                                        locality = reader.GetAttribute("locality");
                                        timeout = reader.GetAttribute("timeLimit");
                                        memout = reader.GetAttribute("memoryLimit");
                                        if ((sharedDir == null) || (category == null) ||
                                            (extension == null) || (locality == null) ||
                                            (timeout == null) || (memout == null))
                                            throw new Exception("Invalid job config");
                                    }
                                    break;
                                case "Z3":
                                    {
                                        z3_drop_dir = reader.GetAttribute("drop_dir");
                                        z3_release_dir = reader.GetAttribute("release_dir");
                                        z3_exe = reader.GetAttribute("exe");
                                        parameters = reader.GetAttribute("parameters");
                                        if ((z3_drop_dir == null) || (z3_release_dir == null) ||
                                            (z3_exe == null) || (parameters == null))
                                            throw new Exception("Invalid Z3 config");
                                    }
                                    break;
                                case "Developer":
                                    {
                                        developers.Add(reader.GetAttribute("name"));
                                    }
                                    break;

                                case "Data":
                                    {
                                        timeline = reader.GetAttribute("timeline");
                                        datadir = reader.GetAttribute("directory");
                                    }
                                    break;
                                case "Fuzzer":
                                    {
                                        fuzzer_target = reader.GetAttribute("target");
                                        fuzzer_max_retries = Convert.ToUInt32(reader.GetAttribute("max_retries"));
                                    }
                                    break;
                                case "Web":
                                    {
                                        daysback = Convert.ToUInt32(reader.GetAttribute("daysback"));
                                    }
                                    break;
                                case "Tag":
                                    {
                                        tags.Insert(reader.GetAttribute("name"), Convert.ToUInt32(reader.GetAttribute("id")));
                                    }
                                    break;
                                case "Codeplex":
                                    {
                                        package_dir = reader.GetAttribute("package_dir");
                                        codeplex_username = reader.GetAttribute("username");
                                        codeplex_password = reader.GetAttribute("password");
                                    }
                                    break;
                                case "Buildlog":
                                    {
                                        build_log = reader.GetAttribute("file");
                                    }
                                    break;
                                default: /* nothing */ break;
                            }
                            break;
                        }
                    default: /* nothing */ break;
                }
            }
        }
    }
}
