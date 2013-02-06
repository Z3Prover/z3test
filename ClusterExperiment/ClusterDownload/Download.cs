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
        static Configuration config = new Configuration("config.xml");

        static void Aggregate()
        {
            if (!Directory.Exists("backup"))
                Directory.CreateDirectory("backup");

            Jobs jobs = new Jobs(config.datadir, true);
            StreamWriter w = new StreamWriter("timeline.csv");
            Timeline.Make(w, ref jobs);
            w.Close();
        }

        static void Main(string[] args)
        {
            try
            {
                SQLInterface sql = new SQLInterface(config.db);

                if (!Directory.Exists(config.datadir))
                    Directory.CreateDirectory(config.datadir);

                SortedSet<Job> myJobs = sql.FindJobs(config.datadir, config.username);
                foreach (Job j in myJobs)
                {
                    j.Download(sql);
                    // Global.Say(string.Format("Downloaded {0} batches for job #{1}. Average batch time: {2} sec.", j.BatchCount, j.MetaData.Id, j.AverageBatchTime));
                }

                Jobs jobs = new Jobs(config.datadir); // includes unfinished.

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

                    Records records = new Records(config.datadir);

                    foreach (Job j in myJobs)
                    {
                        if (j.MetaData.isFinished)
                        {
                            Report r = new Report(j);
                            if (r.IsInteresting)
                                r.SendTo(config.developers);

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
