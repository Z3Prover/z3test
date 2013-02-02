using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Xml;

using Z3Data;
using AlertLibrary;

namespace ClusterDownload
{
    class Download
    {
        static string db = "";
        static string username = "";
        static string dataDir = @"data\";
        static string alertconfig = @"alertconfig.xml";

        static void LoadConfig(string configFile, List<string> devs)
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
                                case "Developer":
                                    {
                                        devs.Add(reader.GetAttribute("name"));
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

        static void Aggregate()
        {
            if (!Directory.Exists("backup"))
                Directory.CreateDirectory("backup");

            Jobs jobs = new Jobs(dataDir, true);
            StreamWriter w = new StreamWriter("timeline.csv");
            Timeline.Make(w, ref jobs);
            w.Close();
        }

        static void Main(string[] args)
        {
            try
            {
                SQLInterface sql = new SQLInterface(db);

                if (!Directory.Exists(dataDir))
                    Directory.CreateDirectory(dataDir);

                SortedSet<Job> myJobs = sql.FindJobs(dataDir, username);
                foreach (Job j in myJobs)
                {
                    j.Download(sql);
                    // Global.Say(string.Format("Downloaded {0} batches for job #{1}. Average batch time: {2} sec.", j.BatchCount, j.MetaData.Id, j.AverageBatchTime));
                }

                Jobs jobs = new Jobs(dataDir); // includes unfinished.

                if (myJobs.Count > 0)
                {
                    uint lastId = 0;
                    foreach (Job j in jobs)
                    {
                        if (j.MetaData.Id >= myJobs.Last().MetaData.Id &&
                            j.MetaData.Reference == 0)
                        {
                            j.MetaData.Reference = lastId;
                            j.MetaData.Save();
                        }
                        lastId = j.MetaData.Id;
                    }

                    List<string> developers = new List<string>();
                    LoadConfig(alertconfig, developers);
                    Records records = new Records(dataDir);

                    foreach (Job j in myJobs)
                    {
                        if (j.MetaData.isFinished)
                        {
                            Report r = new Report(j);
                            if (r.IsInteresting)
                                r.SendTo(developers);

                            records.Update(j);
                        }
                    }

                    records.Save();
                }

                Aggregate();
            }
            catch (Exception ex)
            {
                Global.Say("Caught exception: " + ex.Message);
            }
        }
    }
}
