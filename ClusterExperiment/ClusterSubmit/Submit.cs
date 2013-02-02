using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using Microsoft.Hpc.Scheduler;
using Microsoft.Hpc.Scheduler.Properties;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.ComponentModel;
using System.Xml;

using SubmissionLib;

namespace ClusterSubmit
{

    class Config
    {
        public string cluster = "";
        public string timeout = "";
        public string z3_drop_dir = "";
        public string z3_release_dir = "";
        public string z3_exe = "";
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
    };

    class Submit
    {
        public static string now()
        {
            return DateTime.Now.ToShortDateString() + " " + DateTime.Now.ToShortTimeString();
        }

        public Config LoadConfig(string configFile)
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
                                case "Cluster":
                                    {
                                        res.cluster = reader.GetAttribute("hostname");
                                        res.nodegroup = reader.GetAttribute("nodegroup");
                                        res.username = reader.GetAttribute("username");
                                        res.executor = reader.GetAttribute("executor");
                                        if ((res.cluster == null) || (res.nodegroup == null) ||
                                            (res.username == null) || (res.executor == null))
                                            throw new Exception("Invalid cluster config");
                                    }
                                    break;
                                case "Database":
                                    {
                                        res.db = reader.GetAttribute("connectionString");
                                        if (res.db == null)
                                            throw new Exception("Invalid database config");
                                    }
                                    break;
                                case "Job":
                                    {
                                        res.sharedDir = reader.GetAttribute("sharedDirectory");
                                        res.category = reader.GetAttribute("category");
                                        res.extension = reader.GetAttribute("extension");
                                        res.locality = reader.GetAttribute("locality");
                                        res.timeout = reader.GetAttribute("timeLimit");
                                        res.memout = reader.GetAttribute("memoryLimit");
                                        if ((res.sharedDir == null) || (res.category == null) ||
                                            (res.extension == null) || (res.locality == null) ||
                                            (res.timeout == null) || (res.memout == null))
                                            throw new Exception("Invalid job config");
                                    }
                                    break;
                                case "Z3":
                                    {
                                        res.z3_drop_dir = reader.GetAttribute("drop_dir");
                                        res.z3_release_dir = reader.GetAttribute("release_dir");
                                        res.z3_exe = reader.GetAttribute("exe");
                                        res.parameters = reader.GetAttribute("parameters");
                                        if ((res.z3_drop_dir == null) || (res.z3_release_dir == null) ||
                                            (res.z3_exe == null) || (res.parameters == null))
                                            throw new Exception("Invalid Z3 config");
                                    }
                                    break;
                                case "Note":
                                    res.note = reader.GetAttribute("text");
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

        public void Run(string[] args)
        {
            SubmissionWorker w = new SubmissionWorker(IntPtr.Zero, 0);
            w.ProgressChanged += new ProgressChangedEventHandler(worker_ProgressChanged);
            w.WorkerReportsProgress = true;
            w.WorkerSupportsCancellation = false;

            Config config;

            if (args.Count() == 1)
            {
                if (args[0] == "-h" || args[0] == "--help" || args[0] == "/?")
                {
                    Console.WriteLine("Usage: ClusterSubmit [config-file]");
                    return;
                }
                else
                    config = LoadConfig(args[0]);
            }
            else
                config = LoadConfig("config.xml");


            string executable = findBinary(config.z3_drop_dir, config.z3_release_dir, config.z3_exe);

            if (executable == "")
            {
                Console.WriteLine(now() + ": Z3 not found.");
                return;
            }
            else if (File.Exists("last_binary"))
            {
                FileStream lf = File.OpenRead("last_binary");
                StreamReader sr = new StreamReader(lf);
                long last = Convert.ToInt64(sr.ReadLine());
                if (last >= File.GetLastWriteTime(executable).ToFileTimeUtc())
                {
                    Console.WriteLine(now() + ": No new binary.");
                    return;
                }
                sr.Close();
                lf.Close();
            }            

            bool haveBinId = false;
            int binId = 0;

            try
            {
                string bestCluster = SubmissionWorker.FindCluster(config.cluster, config.alternativeClusters);
                Console.WriteLine(now() + ": Submitting job to " + bestCluster + " with the following binary: " + executable);

                w.UploadBinary(config.db, executable, ref haveBinId, ref binId);                

                w.SubmitJob(config.db, config.category, config.sharedDir, config.memout, config.timeout, config.executor, config.parameters,
                            bestCluster, config.nodegroup, config.locality, config.username, config.priority, config.extension, config.note, ref haveBinId, ref binId);

                saveBinaryDate(executable);
            }
            catch (Exception ex)
            {
                Console.WriteLine(now() + ": Exception caught: " + ex.Message);
            }
        }

        static string findBinary(string Z3_DROP_DIR, string Z3_RELEASE_DIR, string Z3_EXE)
        {
            string res = "";
            bool first = true;
            DateTime best = new DateTime();
            DirectoryInfo di = new DirectoryInfo(Z3_DROP_DIR);
            DirectoryInfo[] subDirs = di.GetDirectories();
            for (int i = 0; i < subDirs.Length; i++)
            // for (int i = 0; i < 10; i++)
            {
                DirectoryInfo subDir = subDirs[i];
                // Console.WriteLine("Searching for Z3 at: " + subDir.Name);
                DirectoryInfo[] releaseDirs = subDir.GetDirectories(Z3_RELEASE_DIR);
                foreach (DirectoryInfo releaseDir in releaseDirs)
                {
                    FileInfo[] files = releaseDir.GetFiles(Z3_EXE);
                    foreach (FileInfo file in files)
                    {
                        DateTime curr = file.CreationTime;
                        if (first || curr > best)
                        {
                            best = curr;
                            first = false;
                            res = file.DirectoryName + "\\" + file.Name;
                        }
                    }
                }
            }
            return res;
        }

        static void saveBinaryDate(string executable)
        {
            // save the date of the binary.        
            FileStream of = File.Create("last_binary");
            StreamWriter sw = new StreamWriter(of);
            sw.WriteLine(File.GetLastWriteTime(executable).ToFileTimeUtc());
            sw.Close();
            of.Close();
        }

        void worker_ProgressChanged(object sender, ProgressChangedEventArgs e)
        {
            /* Nothing */
        }

        static void Main(string[] args)
        {
            try
            {
                Submit m = new Submit();
                m.Run(args);
            }
            catch (Exception ex)
            {
                Console.WriteLine(now() + ": Caught exception: " + ex.Message);
            }
        }
    }
}