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

using SubmissionLib;
using Z3Data;

namespace ClusterSubmit
{
    class Submit
    {
        public static string now()
        {
            return DateTime.Now.ToShortDateString() + " " + DateTime.Now.ToShortTimeString();
        }

        public void Run(string[] args)
        {
            SubmissionWorker w = new SubmissionWorker(IntPtr.Zero, 0);
            w.ProgressChanged += new ProgressChangedEventHandler(worker_ProgressChanged);
            w.WorkerReportsProgress = true;
            w.WorkerSupportsCancellation = false;

            Configuration config;

            if (args.Count() == 1)
            {
                if (args[0] == "-h" || args[0] == "--help" || args[0] == "/?")
                {
                    Console.WriteLine("Usage: ClusterSubmit [config-file]");
                    return;
                }
                else
                    config = new Configuration(args[0]);
            }
            else
                config = new Configuration("config.xml");


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

                string sExecutor = "";
                int jid =
                    w.SetupExperiment(config.db, config.category, config.sharedDir, config.memout, config.timeout, config.executor, config.parameters,
                                      bestCluster, config.nodegroup, config.locality, config.minResources, config.maxResources, config.username, config.priority, config.extension, config.note, config.jobTemplate, ref haveBinId, ref binId, ref sExecutor);
                w.SubmitHPCJob(config.db, true, jid, config.cluster, config.nodegroup, config.priority, config.locality, config.minResources, config.maxResources, config.sharedDir, sExecutor, config.jobTemplate);

                saveBinaryDate(executable);

                uint retries = 0;
                if (File.Exists(config.fuzzer_target))
                {
                retry:
                    if (File.GetLastWriteTime(executable) > File.GetLastWriteTime(config.fuzzer_target))
                    {
                        try
                        {
                            File.Copy(executable, config.fuzzer_target, true);
                        }
                        catch (Exception ex)
                        {
                            retries++;
                            if (retries < config.fuzzer_max_retries)
                                goto retry;
                            else
                                throw ex;
                        }
                    }
                }
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
                Console.WriteLine(now() + ": Stacktrace: " + ex.StackTrace);
            }
        }
    }
}