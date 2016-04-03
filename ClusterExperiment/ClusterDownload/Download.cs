using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Xml;

using Microsoft.Hpc.Scheduler;
using Microsoft.Hpc.Scheduler.Properties;

using Z3Data;
using AlertLibrary;

namespace ClusterDownload
{
    class Download
    {
        static Configuration config = new Configuration("config.xml");

        static void Aggregate()
        {
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

                if (myJobs.Count > 0)
                {
                    uint lastId = 0;
                    Jobs jobs = new Jobs(config.datadir); // includes unfinished.
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
                        else
                        {
                            try
                            {
                                string cluster = j.MetaData.Cluster;
                                uint cluster_jid = j.MetaData.ClusterJobId;
                                if (cluster != "" && cluster_jid != 0)
                                {
                                    using (Scheduler scheduler = new Scheduler())
                                    {
                                        scheduler.Connect(cluster);
                                        ISchedulerJob job = scheduler.OpenJob(Convert.ToInt32(cluster_jid));
                                        if (job.State == JobState.Canceled &&
                                            job.ErrorMessage.StartsWith("Canceled by the scheduler"))
                                        {
                                            Global.Say("Requeing job #" + j.MetaData.Id + " after the scheduler canceled it (# requeues = " + job.RequeueCount + ").");
                                            try { job.Requeue(); }
                                            catch (Exception ex) { Console.WriteLine("requeue-exception: " + ex.Message); }
                                        }
                                    }
                                }
                            }
                            catch (SchedulerException) { /* Ignore. */}
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
