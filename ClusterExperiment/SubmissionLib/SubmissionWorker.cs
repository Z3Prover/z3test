using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Interop;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Media.Animation;
using Microsoft.Hpc.Scheduler;
using Microsoft.Hpc.Scheduler.Properties;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.ComponentModel;

namespace SubmissionLib
{
    public class SubmissionWorker : BackgroundWorker
    {
        public int id;
        public Scheduler scheduler = new Scheduler();
        private IntPtr hwnd;

        public SubmissionWorker(IntPtr hwnd, int id)
        {
            this.id = id;
            scheduler.SetInterfaceMode((hwnd != IntPtr.Zero), hwnd);
            this.hwnd = hwnd;
        }

        public SqlConnection Connect(string db)
        {
            SqlConnection sql = new SqlConnection(db);
            sql.Open();

            SqlCommand cmd = new SqlCommand("IF EXISTS (SELECT 1 " +
                                            "FROM INFORMATION_SCHEMA.TABLES " +
                                            "WHERE TABLE_TYPE='BASE TABLE' " +
                                            "AND TABLE_NAME='Experiments') " +
                                            "SELECT '1' ELSE SELECT '0'", sql);
            SqlDataReader r = cmd.ExecuteReader();
            r.Read();
            if (!r.HasRows || (string)r[0] != "1")
            {
                r.Close();

                if (hwnd != IntPtr.Zero)
                {
                    System.Windows.MessageBoxResult msg =
                      System.Windows.MessageBox.Show("Database tables do not seem to exists; OK to create?", "OK?", MessageBoxButton.YesNo, MessageBoxImage.Question, MessageBoxResult.No);

                    if (msg != System.Windows.MessageBoxResult.Yes)
                        return null;
                }
                else
                    Console.WriteLine("Creating database tables...");

                createTables(sql);
            }

            r.Dispose();
            return sql;
        }

        public void Disconnect(SqlConnection sql)
        {
            sql.Close();
        }

        public void UploadBinary(string db, string executable, ref bool haveBinId, ref int binId)
        {
            SqlConnection sql = Connect(db);
            int res = 0;

            if (executable != "")
            {
            retry:
                try
                {
                    if (!File.Exists(executable))
                        throw new Exception("Z3 binary does not exist.");

                    SqlCommand cmd = new SqlCommand("INSERT INTO Binaries (Binary,UploadTime) VALUES(@BINARYDATA,GETDATE()); SELECT SCOPE_IDENTITY () As BinaryID", sql);
                    cmd.CommandTimeout = 0;

                    FileStream file = File.Open(executable, System.IO.FileMode.Open, System.IO.FileAccess.Read);
                    byte[] imageBytes = new byte[file.Length + 1];
                    file.Read(imageBytes, 0, imageBytes.Length);
                    file.Close();

                    SqlParameter par = cmd.Parameters.Add("@BINARYDATA", System.Data.SqlDbType.VarBinary);
                    par.Size = imageBytes.Count();
                    par.Value = imageBytes;

                    SqlDataReader r = cmd.ExecuteReader();
                    if (!r.Read())
                        throw new Exception("SQL Insert failed");
                    res = Convert.ToInt32(r[0]);
                    r.Close();
                }
                catch (Exception ex)
                {
                    if (hwnd != IntPtr.Zero)
                    {
                        System.Windows.MessageBoxResult msg =
                          System.Windows.MessageBox.Show("Exception: " + ex.Message + ". Retry binary upload?", "Retry?", MessageBoxButton.YesNo, MessageBoxImage.Question, MessageBoxResult.No);

                        if (msg == System.Windows.MessageBoxResult.Yes)
                            goto retry;
                    }
                    else
                        throw ex;
                }
            }
            else
            {
                SqlCommand cmd = new SqlCommand("SELECT TOP 1 ID FROM Binaries ORDER BY UploadTime DESC", sql);
                SqlDataReader r = cmd.ExecuteReader();
                if (!r.Read())
                    throw new Exception("SQL Insert failed");
                res = Convert.ToInt32(r["ID"]);
                r.Close();
            }

            haveBinId = true;
            binId = res;

            ReportProgress(100);
        }

        private void createTables(SqlConnection sql)
        {
            // Create table
            SqlCommand
            cmd = new SqlCommand("CREATE TABLE [dbo].[Experiments](ID INT IDENTITY(1,1) NOT NULL, " +
                                                           "SubmissionTime DATETIME NOT NULL DEFAULT GETDATE(), " +
                                                           "CompletionTime DATETIME, " +
                                                           "Category VARCHAR(256), " +
                                                           "Extension VARCHAR(256), " +
                                                           "SharedDir VARCHAR(512), " +
                                                           "Timeout VARCHAR(128), " +
                                                           "Memout VARCHAR(128), " +
                                                           "Binary INT NOT NULL, " +
                                                           "Parameters VARCHAR(512), " +
                                                           "Cluster VARCHAR(512), " +
                                                           "Nodegroup VARCHAR(256), " +
                                                           "Locality VARCHAR(256), " +
                                                           "Creator VARCHAR(256) NOT NULL DEFAULT USER_NAME()," +
                                                           "Note VARCHAR(256)," +
                                                           "ClusterJobID INT," +
                                                           "Executor VARCHAR(256)" +
                                                           ")", sql);
            cmd.ExecuteNonQuery();

            // ResultCode:
            // OLD: 0 = SAT, 1 = UNSAT, 2 = UNKNOWN
            // New: 0 = OK

            // 3 = BUG
            // 4 = ERROR
            // 5 = TIMEOUT
            // 6 = MEMORY OUT

            cmd = new SqlCommand("CREATE TABLE [dbo].[Data](ID INT IDENTITY(1,1) NOT NULL, " +
                                                     "ExperimentID INT, " +
                                                     "FilenameP INT NOT NULL, " +
                                                     "Returnvalue INT, " +
                                                     "ResultCode TINYINT, " +
                                                     "SAT INT, " +
                                                     "UNSAT INT, " +
                                                     "UNKNOWN INT, " +
                                                     "TargetSAT INT, " +
                                                     "TargetUNSAT INT, " +
                                                     "TargetUNKNOWN INT, " +
                                                     "Runtime FLOAT, " +
                                                     "stdout VARCHAR(MAX), " +
                                                     "stderr VARCHAR(MAX), " +
                                                     "Worker VARCHAR(MAX) DEFAULT NULL, " +
                                                     "AcquireTime DATETIME DEFAULT NULL, " +
                                                     "FinishTime DATETIME DEFAULT NULL " +
                                                     ")", sql);
            cmd.ExecuteNonQuery();

            cmd = new SqlCommand("CREATE CLUSTERED INDEX EID_INX ON Data (ExperimentID);", sql);
            cmd.ExecuteNonQuery();
            cmd = new SqlCommand("CREATE NONCLUSTERED INDEX DID_INX ON Data (ID);", sql);
            cmd.ExecuteNonQuery();

            cmd = new SqlCommand("CREATE TABLE [dbo].[Strings] (ID INT IDENTITY(1,1) NOT NULL, s VARCHAR(1024))", sql);
            cmd.ExecuteNonQuery();

            cmd = new SqlCommand("CREATE NONCLUSTERED INDEX StringIndex ON Strings (s);");
            cmd.ExecuteNonQuery();

            cmd = new SqlCommand("CREATE CLUSTERED INDEX IDIndex ON Strings (ID);");
            cmd.ExecuteNonQuery();

            cmd = new SqlCommand("CREATE TABLE [dbo].[JobQueue] (ID INT IDENTITY(1,1) NOT NULL, " +
                                                          "ExperimentID INT NOT NULL, " +
                                                          "FilenameP INT NOT NULL, " +
                                                          "Worker VARCHAR(MAX) DEFAULT NULL, " +
                                                          "AcquireTime DATETIME DEFAULT NULL); " +
                                 "CREATE INDEX ID_INX ON Jobqueue (ID);", sql);
            cmd.ExecuteNonQuery();

            cmd = new SqlCommand("CREATE TABLE [dbo].[Binaries] (ID INT IDENTITY(1,1) NOT NULL, " +
                                                          "Binary VARBINARY(MAX), " +
                                                          "UploadTime DATETIME NOT NULL)", sql);
            cmd.ExecuteNonQuery();

            cmd = new SqlCommand("CREATE VIEW [dbo].[TitleScreen] WITH SCHEMABINDING as SELECT " +
                                 "ID,SubmissionTime,Category,Cluster,Nodegroup,Creator " +
                                 "FROM [dbo].[Experiments]", sql);
            cmd.ExecuteNonQuery();

            cmd = new SqlCommand("CREATE PROCEDURE [dbo].[S] " +
                                   "  @NSTR varchar(255), @SID int OUTPUT " +
                                 "AS 	" +
                                   "  SELECT @SID = (SELECT TOP 1 ID FROM Strings WHERE s=@NSTR); " +
                                   "  IF (@SID IS NULL) BEGIN   " +
                                     "    INSERT INTO Strings (s) VALUES(@NSTR);   " +
                                 "    (SELECT @SID = (SELECT SCOPE_IDENTITY())); " +
                                   "  END; 	", sql);
            cmd.ExecuteNonQuery();

            cmd = new SqlCommand("CREATE PROCEDURE [dbo].[AQ] " +
                                  "  @EID int, @NSTR varchar(255) " +
                                  "AS " +
                                  "DECLARE @SID int; " +
                                  "EXEC S @NSTR, @SID OUTPUT; " +
                                  "INSERT INTO JobQueue (ExperimentID,FilenameP) VALUES(@EID, @SID);", sql);
            cmd.ExecuteNonQuery();

            cmd = new SqlCommand("CREATE PROCEDURE [dbo].[SRN] " +
                                 "@EID int, " +
                                 "@JID int, " +
                                 "@FNAMEP int, " +
                                 "@EXITCODE int, " +
                                 "@RESULTCODE tinyint, " +
                                 "@SAT int, " +
                                 "@UNSAT int, " +
                                 "@UNKNOWN int, " +
                                 "@TSAT int, " +
                                 "@TUNSAT int, " +
                                 "@TUNKNOWN int, " +
                                 "@RUNTIME float, " +
                                 "@STDOUT varchar(max), " +
                                 "@STDERR varchar(max), " +
                                 "@WORKER varchar(max) " +
                                 "AS " +
                                 "INSERT INTO Data (ExperimentID,FilenameP,Returnvalue,ResultCode,SAT,UNSAT,UNKNOWN,TargetSAT,TargetUNSAT,TargetUNKNOWN,Runtime,stdout,stderr,Worker,AcquireTime,FinishTime)  " +
                                 "VALUES (@EID, @FNAMEP, @EXITCODE, @RESULTCODE, @SAT, @UNSAT, @UNKNOWN, @TSAT, @TUNSAT, @TUNKNOWN, @RUNTIME, @STDOUT, @STDERR, @WORKER, " +
                                 "  (SELECT AcquireTime FROM JobQUEUE WHERE ID=@JID), GETDATE()); " +
                                 "DELETE FROM JobQueue WHERE ID=@JID;", sql);
            cmd.ExecuteNonQuery();
        }

        private void SetResources(ISchedulerTask task, string locality)
        {
            if (locality == "Socket")
            {
                task.MinimumNumberOfSockets = 1;
                task.MaximumNumberOfSockets = 1;
            }
            else if (locality == "Core")
            {
                task.MinimumNumberOfCores = 1;
                task.MaximumNumberOfCores = 1;
            }
            else if (locality == "Node")
            {
                task.MinimumNumberOfNodes = 1;
                task.MaximumNumberOfNodes = 1;
            }
        }

        private void SetPriority(ISchedulerJob job, int priority)
        {
            if (priority == 0)
                job.Priority = JobPriority.Lowest;
            else if (priority == 1)
                job.Priority = JobPriority.BelowNormal;
            else if (priority == 2)
                job.Priority = JobPriority.Normal;
            else if (priority == 3)
                job.Priority = JobPriority.AboveNormal;
            else if (priority == 4)
                job.Priority = JobPriority.Highest;
        }

        public void SubmitJob(string db, string category, string sharedDir,
                              string memout, string timeout, string executor,
                              string parameters, string cluster, string nodegroup, string locality,
                              string username, int priority, string extension, string note,
                              ref bool haveBinId, ref int binId)
        {
            // Wait for binID
            while (!haveBinId)
                System.Threading.Thread.Sleep(250);

            SqlConnection sql = Connect(db);
            SqlCommand cmd;
            SqlDataReader r;

            if (!Directory.Exists(sharedDir))
                throw new Exception("Shared directory does not exist.");
            else if (!File.Exists(executor))
                throw new Exception("Worker binary does not exist.");

            cmd = new SqlCommand("INSERT INTO Experiments (CompletionTime,Category,SharedDir,Extension,Memout,Timeout,Binary,Parameters,Cluster,Nodegroup,Locality,Creator,Note) " +
                                  "VALUES(NULL,'" + category + "','" + sharedDir + "','" + extension + "'," + memout + "," + timeout + "," + binId + ",'" + parameters + "'," +
                                  "'" + cluster + "','" + nodegroup + "','" + locality + "'," +
                                  "'" + username + "',@NOTE); SELECT SCOPE_IDENTITY () As NewID", sql);

            SqlParameter p = cmd.Parameters.Add("@NOTE", SqlDbType.VarChar);
            p.Size = note.Length;
            p.Value = note;

            r = cmd.ExecuteReader();
            if (!r.Read())
                throw new Exception("SQL Insert failed");

            int newID = Convert.ToInt32(r[0]);

            r.Close();
            r.Dispose();

            // Copy the worker to the shared directory      
            string eFullpath = System.IO.Path.GetFullPath(executor);
            string eFilename = System.IO.Path.GetFileName(executor);
            string sExecutor = newID.ToString() + "_" + eFilename;
            if (!File.Exists(sharedDir + "\\" + sExecutor) ||
                File.GetLastWriteTime(sharedDir + "\\" + sExecutor) < File.GetLastWriteTime(eFullpath))
                File.Copy(eFullpath, sharedDir + "\\" + sExecutor, true);


            cmd = new SqlCommand("UPDATE Experiments SET Executor='" + sExecutor + "' WHERE ID='" + newID.ToString() + "'", sql);
            cmd.ExecuteNonQuery();

            scheduler.Connect(cluster);

            ISchedulerJob hpcJob = scheduler.CreateJob();
            try
            {
                if (nodegroup != "<Any>")
                    hpcJob.NodeGroups.Add(nodegroup);
                hpcJob.Name = "Z3 Performance Test (" + newID + ")";
                hpcJob.IsExclusive = true;
                hpcJob.CanPreempt = true;
                SetPriority(hpcJob, priority);
                hpcJob.Project = "Z3";

                if (locality == "Socket")
                    hpcJob.UnitType = JobUnitType.Socket;
                else if (locality == "Core")
                    hpcJob.UnitType = JobUnitType.Core;
                else if (locality == "Node")
                    hpcJob.UnitType = JobUnitType.Node;

                int max = 0;
                ISchedulerCounters ctrs = scheduler.GetCounters();
                if (locality == "Socket")
                {
                    max = ctrs.TotalSockets;
                    // HACK: Ask for at least 20 sockets.
                    hpcJob.MinimumNumberOfSockets = 20;
                }
                else if (locality == "Core")
                    max = ctrs.TotalCores;
                else if (locality == "Node")
                    max = ctrs.TotalNodes;

                max = 40;

                //int totalJobs = Directory.GetFiles(sharedDir + "\\" + category + "\\", "*." + extension, SearchOption.AllDirectories).Length;
                //if (totalJobs < max)
                //  max = totalJobs;

                //if (max == 0)
                //  throw new Exception("No benchmark files found.");

                int progressTotal = max + 3;

                // Add population task.
                ReportProgress(Convert.ToInt32(100.0 * 1 / (double)max));
                ISchedulerTask populateTask = hpcJob.CreateTask();
                SetResources(populateTask, locality);
                populateTask.IsRerunnable = false;
                populateTask.IsExclusive = false;
                populateTask.WorkDirectory = sharedDir;
                populateTask.CommandLine = sExecutor + " " + newID + " ? \"" + db + "\"";
                populateTask.Name = "Populate";
                hpcJob.AddTask(populateTask);

                for (int i = 0; i < max; i++)
                {
                    // Add worker task.
                    ReportProgress(Convert.ToInt32(100.0 * (i + 1) / (double)max));
                    ISchedulerTask task = hpcJob.CreateTask();
                    SetResources(task, locality);
                    task.WorkDirectory = sharedDir;
                    task.CommandLine = sExecutor + " " + newID + " \"" + db + "\"";
                    task.IsExclusive = false;
                    task.IsRerunnable = true;
                    task.DependsOn.Add("Populate");
                    task.Name = "Worker";

                    hpcJob.AddTask(task);
                }

                // Add recovery task.
                ReportProgress(Convert.ToInt32(100.0 * (progressTotal - 1) / (double)max));
                ISchedulerTask rTask = hpcJob.CreateTask();
                SetResources(rTask, locality);
                rTask.IsRerunnable = true;
                rTask.IsExclusive = false;
                rTask.WorkDirectory = sharedDir;
                rTask.CommandLine = sExecutor + " " + newID + " ! \"" + db + "\"";
                rTask.DependsOn.Add("Worker");
                rTask.Name = "Recovery";
                hpcJob.AddTask(rTask);

                // Add deletion task.
                ReportProgress(Convert.ToInt32(100.0 * (progressTotal) / (double)max));
                ISchedulerTask dTask = hpcJob.CreateTask();
                SetResources(dTask, locality);
                dTask.IsRerunnable = true;
                dTask.IsExclusive = false;
                dTask.WorkDirectory = sharedDir;
                dTask.CommandLine = "del " + sharedDir + "\\" + sExecutor;
                dTask.Name = "Delete worker";
                dTask.DependsOn.Add("Recovery");
                hpcJob.AddTask(dTask);

                scheduler.AddJob(hpcJob);
                scheduler.SubmitJob(hpcJob, null, null);
                cmd = new SqlCommand("UPDATE Experiments SET ClusterJobID=" + hpcJob.Id.ToString() + " WHERE ID=" + newID.ToString() + "; ", sql);
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                cmd = new SqlCommand("DELETE FROM JobQueue WHERE ExperimentID=" + newID + "; DELETE FROM Experiments WHERE ID=" + newID, sql);
                cmd.ExecuteNonQuery();
                scheduler.CancelJob(hpcJob.Id, "Aborted.");
                throw ex;
            }

            //return totalJobs;
        }

        private bool checkExperimentExists(SqlConnection fromSQL, SqlConnection toSQL, string jobID, ref string toJobID)
        {
            bool res = false;

            SqlCommand cmd = new SqlCommand("SELECT ID FROM Experiments WHERE ID=" + jobID, toSQL);
            SqlDataReader r = cmd.ExecuteReader();
            if (r.HasRows)
            {
                //System.Windows.MessageBoxResult msg =
                //    System.Windows.MessageBox.Show("An experiment with ID " + jobID + " already exists in the backup database. OK to overwrite? Press No to use a new ID.", 
                //                                   "Backup Experiment Exists", 
                //                                   MessageBoxButton.YesNoCancel, MessageBoxImage.Question, MessageBoxResult.Cancel);

                //if (msg != System.Windows.MessageBoxResult.Yes)
                //  toJobID = jobID;
                //else if (msg != System.Windows.MessageBoxResult.No)
                //  toJobID = "";
                //else

                res = true;
            }
            r.Close();

            return res;
        }

        private string copyExperimentsEntry(SqlConnection fromSQL, SqlConnection toSQL, string jobID)
        {
            // string newID = "";

            SqlCommand cmd = new SqlCommand("SELECT * FROM Experiments WHERE ID=" + jobID, fromSQL);
            SqlDataReader r = cmd.ExecuteReader();
            while (r.Read())
            {
                string cmdstring = "SET IDENTITY_INSERT Experiments ON; INSERT INTO Experiments (";
                bool first = true;
                for (int i = 0; i < r.FieldCount; i++)
                {
                    string fieldname = r.GetName(i);
                    if (first) first = false; else cmdstring += ",";
                    cmdstring += fieldname;
                }
                cmdstring += ") VALUES(";
                first = true;
                for (int i = 0; i < r.FieldCount; i++)
                {
                    string fieldname = r.GetName(i);
                    if (first) first = false; else cmdstring += ",";
                    cmdstring += "@P" + i.ToString();
                }
                cmdstring += ");";
                SqlCommand tocmd = new SqlCommand(cmdstring, toSQL);

                for (int i = 0; i < r.FieldCount; i++)
                    tocmd.Parameters.AddWithValue("@P" + i.ToString(), r[i]);

                if (tocmd.ExecuteNonQuery() == 0)
                    throw new Exception("SQL Insert failed");

                //SqlDataReader idr = tocmd.ExecuteReader();
                //if (!idr.Read())
                //  throw new Exception("SQL Insert failed");
                // else
                //   newID = idr[0].ToString();
                //idr.Close();
            }
            r.Close();

            return ""; // newid;
        }

        private void copyDataEntries(SqlConnection fromSQL, SqlConnection toSQL, string jobID)
        {
            int cnt = 0;
            SqlCommand cmd = new SqlCommand("SELECT COUNT(1) FROM Data WHERE ExperimentID=" + jobID, fromSQL);
            SqlDataReader r = cmd.ExecuteReader();
            while (r.Read())
                cnt = (int)r[0];
            r.Close();

            int c = 0;
            cmd = new SqlCommand("SELECT Data.*,s FROM Data,Strings WHERE ExperimentID=" + jobID + " AND FilenameP=Strings.ID;", fromSQL);
            r = cmd.ExecuteReader();
            while (r.Read())
            {
                string cmdstring = "DECLARE @NFP int; EXEC S '" + r["s"] + "', @NFP OUTPUT; INSERT INTO Data (";
                bool first = true;
                for (int i = 0; i < r.FieldCount; i++)
                {
                    string fieldname = r.GetName(i);
                    if (fieldname != "ID" && fieldname != "s")
                    {
                        if (first) first = false; else cmdstring += ",";
                        cmdstring += fieldname;
                    }
                }
                cmdstring += ") VALUES(";
                first = true;
                for (int i = 0; i < r.FieldCount; i++)
                {
                    string fieldname = r.GetName(i);
                    if (fieldname == "ID")
                        continue;

                    if (fieldname == "FilenameP")
                    {
                        if (first) first = false; else cmdstring += ",";
                        cmdstring += "@NFP";
                    }
                    else if (fieldname != "s")
                    {
                        if (first) first = false; else cmdstring += ",";
                        cmdstring += "@P" + i.ToString();
                    }
                }
                cmdstring += ");";
                SqlCommand tocmd = new SqlCommand(cmdstring, toSQL);

                for (int i = 0; i < r.FieldCount; i++)
                {
                    string fieldname = r.GetName(i);
                    if (fieldname == "ID")
                        continue;
                    //if (fieldname == "ExperimentID")
                    //  tocmd.Parameters.AddWithValue("@P" + i.ToString(), newID);
                    //else          
                    else if (fieldname != "FilenameP" && fieldname != "s")
                        tocmd.Parameters.AddWithValue("@P" + i.ToString(), r[i]);
                }

                if (tocmd.ExecuteNonQuery() == 0)
                    throw new Exception("SQL Insert failed");

                ReportProgress(Convert.ToInt32(100.0 * (++c) / (double)cnt));
            }
            r.Close();
        }

        public void Copy(string DB, string backupDB, string jobID, bool move = false)
        {
            ReportProgress(0);

            SqlConnection fromSQL = Connect(DB);
            SqlConnection toSQL = Connect(backupDB);

            string toJobID = jobID; // Default: copy to same
            if (!checkExperimentExists(fromSQL, toSQL, jobID, ref toJobID))
            {
                // Always copy to a new ID
                copyExperimentsEntry(fromSQL, toSQL, jobID);
                copyDataEntries(fromSQL, toSQL, jobID);
            }
            else
                throw new Exception("Could not copy job # " + jobID + " because a job with the same ID exists in the backup database.");

            if (move)
            {
                SqlCommand cmd = new SqlCommand("DELETE FROM Data WHERE ExperimentID=" + jobID + "; " +
                                                "DELETE FROM Experiments WHERE ID=" + jobID + ";", fromSQL);
                cmd.ExecuteNonQuery();
            }

            ReportProgress(100);

            toSQL.Close();
            fromSQL.Close();
        }

        protected static int GetFreeNodes(IScheduler scheduler, string cluster)
        {
            int res = 0;
            try
            {
                scheduler.Connect(cluster);
                ISchedulerCounters ctrs = scheduler.GetCounters();
                res = ctrs.IdleCores;
            }
            catch
            {
                // That's okay.
            }
            return res;
        }

        public static string FindCluster(string preferredCluster, HashSet<string> alternatives)
        {
            string s = preferredCluster;

            if (alternatives.Count > 0)
            {
                IScheduler scheduler = new Scheduler();
                scheduler.SetInterfaceMode(true, IntPtr.Zero);
                
                int sFree = GetFreeNodes(scheduler, preferredCluster);
                foreach (string a in alternatives)
                {
                    int fn = GetFreeNodes(scheduler, a);
                    if (fn > sFree)
                    {
                        s = a;
                        sFree = fn;
                    }
                }
            }

            return s;
        }
    };
}
