using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.IO;
using System.IO.Packaging;
using System.Threading;
using System.Diagnostics;
using System.Runtime.InteropServices;

namespace worker
{
    class Program
    {
        SqlConnection sql = null;
        string myName = "";
        const int MAXBUF = 16777216;

        class Experiment
        {
            public string ID;
            public string Parameters;
            public string sharedDir;
            public string fileExtension;
            public string localExecutable;
            public string category;
            public int binaryID;
            public TimeSpan timeout;
            public long memout;

            public string localDir;
        }

        class Job
        {
            public string ID;
            public string experimentID;
            public string filename;
            public int filenameP;
            public string localFilename;
        };

        class Result
        {
            public Job j;
            public string exitCode;
            public double runtime;
            public MemoryStream stdout = new MemoryStream(MAXBUF);
            public MemoryStream stderr = new MemoryStream(MAXBUF);
        };

        private List<Result> results = new List<Result>();

        void ensureConnected()
        {
            if (sql.State == System.Data.ConnectionState.Open)
                return;

            uint retry_cnt = 0;
        retry:
            try
            {
                sql.Open();
            }
            catch (Exception ex)
            {
                Thread.Sleep(10000);
                Console.WriteLine("Retrying after SQL connection failure: " + ex.Message);
                if (retry_cnt++ < 100)
                    goto retry;
                else
                    throw new Exception("Tried to connect to SQL server 100 times but could not connect.");
            }
        }

        Dictionary<string, Object> SQLRead(string cmdString, SqlConnection sql)
        {
            ensureConnected();
            SqlCommand cmd = new SqlCommand(cmdString, sql);
            cmd.CommandTimeout = 0;
            SqlDataReader r = cmd.ExecuteReader();

            bool has_data = false;
        retry_read:
            try
            {
                has_data = r.Read();
            }
            catch (Exception ex)
            {
                Console.WriteLine("Retrying after SQL read failure: " + ex.Message);
                Thread.Sleep(1000);
                goto retry_read;
            }


            Dictionary<string, Object> res = new Dictionary<string, Object>();

            if (has_data)
            {
                for (int i = 0; i < r.FieldCount; i++)
                    res[r.GetName(i)] = r[i];
            }

            cmd.Cancel();

        retry:
            try
            {
                r.Close();
            }
            catch (Exception ex)
            {
                Console.WriteLine("Retrying after SQL Exception in reader.Close(): " + ex.Message);
                Thread.Sleep(1000);
                goto retry;
            }

            return res;
        }

        public string getTempDirectory()
        {
            Console.WriteLine("Creating temporary directory...");
            string path = Path.Combine(Path.GetTempPath(), Path.GetRandomFileName());
            Directory.CreateDirectory(path);
            return path;
        }

        Experiment getExperiment(string eId)
        {
            ensureConnected();

            Console.WriteLine("Getting experiment info... ");
            Dictionary<string, Object> r =
              SQLRead("SELECT Category,SharedDir,Extension,Memout,Timeout,Parameters,Binary,Longparams FROM Experiments WHERE ID=" + eId, sql);

            if (r.Count() == 0)
                throw new Exception("Experiment not found.");

            Experiment res = new Experiment();

            res.ID = eId;
            res.category = (string)r["Category"];
            res.sharedDir = (string)r["SharedDir"];
            res.fileExtension = (string)r["Extension"];
            res.localDir = getTempDirectory();
            res.timeout = new TimeSpan(0, 0, Convert.ToInt32(r["Timeout"]));
            res.memout = (DBNull.Value.Equals(r["Memout"])) ? 0 : Convert.ToInt64(r["Memout"]);
            if (r["Parameters"].Equals(DBNull.Value))
                res.Parameters = (string)r["Longparams"];
            else
                res.Parameters = (string)r["Parameters"];
            res.localExecutable = res.localDir + "\\z3.exe";
            res.binaryID = (int)r["Binary"];

            return res;
        }

        void populate(Experiment e)
        {
            // First check whether someone else is populating already.
            int c = 1;

            SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM Data WHERE ExperimentID=" + e.ID + ";", sql);
            SqlDataReader r = cmd.ExecuteReader();            
            if (r.Read()) c = ((int)r[0]);
            r.Close();
            if (c != 0)
                return;

            cmd = new SqlCommand("SELECT COUNT(*) FROM JobQueue WHERE ExperimentID=" + e.ID + ";", sql);
            r = cmd.ExecuteReader();
            if (r.Read()) c = ((int)r[0]);
            r.Close();
            if (c != 0)
                return;


            int i = 0, pinx;
            string cur;
            while (i < e.fileExtension.Length)
            {
                pinx = e.fileExtension.IndexOf('|', i);
                if (pinx == -1)
                {
                    cur = e.fileExtension.Substring(i);
                    i = e.fileExtension.Length;
                }
                else
                {
                    cur = e.fileExtension.Substring(i, pinx - i);
                    i = pinx + 1;
                }

                IEnumerable<string> files = Directory.EnumerateFiles(e.sharedDir + "\\" + e.category + "\\", "*." + cur, SearchOption.AllDirectories);
                SqlTransaction t = sql.BeginTransaction();

                try
                {
                    int sl = e.sharedDir.Length + 1;
                    int cnt = 0;
                    foreach (String s in files)
                    {
                        if (Path.GetExtension(s).Substring(1) != cur) continue;

                        cmd = new SqlCommand("AQ " + e.ID + ",'" + s.Substring(sl) + "';", sql, t);
                        cmd.ExecuteNonQuery();
                        cnt++;

                        if (cnt == 100)
                        {
                            t.Commit();
                            t = sql.BeginTransaction();
                            cnt = 0;
                        }
                    }

                    t.Commit();
                }
                catch (SqlException ex)
                {
                    Console.WriteLine("Retrying after SQL ERROR: " + ex.Message);
                    t.Rollback();
                    Thread.Sleep(1000);
                    throw ex;
                }
            }
        }

        bool haveJobs(Experiment e)
        {
            ensureConnected();
            Dictionary<string, Object> rd =
                SQLRead("SELECT TOP 1 ID FROM JobQueue WHERE ExperimentID=" + e.ID, sql);
            return rd.Count() != 0;
        }

        Job getJob(Experiment e, int jID = 0)
        {
            Job j = new Job();

            if (jID == -1)
            {
            retry:
                Dictionary<string, Object> r =
                    SQLRead("SELECT TOP 1 ID FROM JobQueue WHERE ExperimentID=" + e.ID, sql);

                if (r.Count() == 0) return null;

                jID = (int)r["ID"];

                ensureConnected();
                SqlCommand cmd = new SqlCommand("UPDATE JobQueue SET Worker='" + myName + "/Recovery',AcquireTime=GETDATE() WHERE ID=" + jID, sql);
                if (cmd.ExecuteNonQuery() == 0)
                    jID = 0;

                if (jID == 0) goto retry;

                Dictionary<string, Object> rd =
                    SQLRead("SELECT a.ID as ID,a.FilenameP as FileP,b.s as Filename FROM JobQueue as a,Strings as b WHERE Worker='" + myName + "/Recovery' AND a.FilenameP=b.ID AND ExperimentID=" + e.ID + ";", sql);

                if (rd.Count == 0)
                    return null;
                else
                {
                    jID = (int)rd["ID"];
                    j.ID = jID.ToString();
                    j.experimentID = e.ID;
                    j.filename = e.sharedDir + "\\" + (string)rd["Filename"];
                    j.filenameP = (int)rd["FileP"];
                    j.localFilename = e.localDir + "\\" + j.ID + Path.GetExtension(j.filename);
                }

                if (e.ID != j.experimentID)
                    throw new Exception("Got job from wrong experiment.");
            }
            else
            {
                while (jID == 0)
                {
                    TimeSpan x = e.timeout;
                    int limit = Convert.ToInt32(x.TotalSeconds);
                    limit += 300; // +5 minutes

                    string cond = "((Worker IS NULL) OR (DATEDIFF(second, AcquireTime, GETDATE()) >= " + limit.ToString() + ")";
                    //string cond = "(Worker IS NULL)";

                    List<Result>.Enumerator en = results.GetEnumerator();
                    while (en.MoveNext())
                    {
                        cond += " AND (ID <> " + en.Current.j.ID + ")";
                    }

                    cond += ")";

                    Dictionary<string, Object> rd = new Dictionary<string, object>();

                    rd = SQLRead("DECLARE @jid INT;" +
                                 "BEGIN TRANSACTION; " +
                                 "SELECT TOP 1 @jid = ID FROM JobQueue WITH (ROWLOCK,UPDLOCK,READPAST) WHERE " +
                                 "ExperimentID=" + e.ID + " AND " + cond + ";" +
                                 "UPDATE JobQueue SET Worker='" + myName + "',AcquireTime=GETDATE() WHERE ID=@jid; COMMIT; " +
                                 "SELECT a.ID as ID,a.FilenameP as FileP,b.s as Filename FROM JobQueue as a, Strings as b " +
                                 "WHERE a.ID=@jid AND a.FilenameP=b.ID;", sql);

                    if (rd.Count == 0)
                        return null;
                    else
                    {
                        jID = (int)rd["ID"];
                        j.ID = jID.ToString();
                        j.experimentID = e.ID;
                        j.filename = e.sharedDir + "\\" + (string)rd["Filename"];
                        j.filenameP = (int)rd["FileP"];
                        j.localFilename = e.localDir + "\\" + j.ID + Path.GetExtension(j.filename);
                    }

                    if (e.ID != j.experimentID)
                        throw new Exception("Got job from wrong experiment.");
                }
            }

            return j;
        }

        private static void CopyStream(Stream source, Stream target)
        {
            const int bufSize = 0x1000;
            byte[] buf = new byte[bufSize];
            int bytesRead = 0;
            while ((bytesRead = source.Read(buf, 0, bufSize)) > 0)
                target.Write(buf, 0, bytesRead);
        }

        private static string CreateFilenameFromUri(Uri uri)
        {
            char[] invalidChars = Path.GetInvalidFileNameChars();
            StringBuilder sb = new StringBuilder(uri.OriginalString.Length);
            foreach (char c in uri.OriginalString)
            {
                sb.Append(Array.IndexOf(invalidChars, c) < 0 ? c : '_');
            }
            return sb.ToString();
        }

        void getBinary(Experiment e)
        {
            if (!Directory.Exists(e.localDir))
                throw new Exception("Local scratch directory does not exist: " + e.localDir);

            if (!File.Exists(e.localExecutable))
            {
                Console.WriteLine("Downloading binary...");

                FileStream fs = null;
                try
                {
                    fs = new FileStream(e.localExecutable, FileMode.CreateNew);
                }
                catch (IOException)
                {
                    if (File.Exists(e.localExecutable))
                    {
                        // All is good, someone else downloaded it!
                        return;
                    }
                }

                byte[] data = new byte[0];

                Dictionary<string, Object> r =
                  SQLRead("SELECT Binary FROM Binaries WHERE ID=" + e.binaryID, sql);

                data = (byte[])r["Binary"];

                int sz = data.GetUpperBound(0);
                fs.Write(data, 0, sz);
                fs.Flush();
                fs.Close();

                if (data[0] == 0x50 && data[1] == 0x4b &&
                    data[2] == 0x03 && data[3] == 0x04)
                {
                    // This is a zip file.
                    Package pkg = Package.Open(e.localExecutable, FileMode.Open);
                    PackageRelationshipCollection rels = pkg.GetRelationships();

                    if (rels.Count() != 1)
                        throw new Exception("Missing package relationships");

                    PackageRelationship main = rels.First();

                    foreach (PackagePart part in pkg.GetParts())
                    {
                        // Uri uriDocumentTarget = PackUriHelper.ResolvePartUri(new Uri("/", UriKind.Relative), rel.TargetUri);            
                        // PackagePart part = pkg.GetPart(uriDocumentTarget);           
                        Stream s = part.GetStream(FileMode.Open, FileAccess.Read);
                        string fn = CreateFilenameFromUri(part.Uri).Substring(1);
                        fs = new FileStream(e.localDir + @"\" + fn, FileMode.OpenOrCreate);
                        CopyStream(s, fs);
                        fs.Close();

                        if (part.Uri == main.TargetUri)
                            e.localExecutable = e.localDir + @"\" + fn;
                    }
                }

                string ext = Path.GetExtension(e.localExecutable);
                string localname = e.localExecutable + "-" + myName + ext;
                File.Move(e.localExecutable, localname);
                e.localExecutable += "-" + myName + ext;

                int retry_count = 1000;
                while (!File.Exists(localname))
                {
                    Thread.Sleep(100);
                    retry_count--;
                    if (retry_count == 0) 
                        throw new Exception("Local binary missing.");
                }
                retry_count = 1000;
            retry:
                try
                {
                    FileStream tmp = File.OpenRead(localname);
                }
                catch
                {
                    Thread.Sleep(100);
                    retry_count--;
                    if (retry_count == 0) 
                        throw new Exception("Local binary is not readable.");
                    goto retry;
                }                    
            }
        }

        private TimeSpan processTime(Process p)
        {
            // Wallclock time
            //return DateTime.Now - p.StartTime;

            // Process time
            return p.TotalProcessorTime;

            // Complicated multi-process time. Note that sub-processes may be unavailable after the main process has exited. 
            //TimeSpan r = new TimeSpan(0);      

            //foreach (Process cp in Process.GetProcessesByName(p.ProcessName))
            //  r += cp.TotalProcessorTime;

            //return r;
        }

        private long processMemory(Process p)
        {
            long r = 0;

            foreach (Process cp in Process.GetProcessesByName(p.ProcessName))
                try
                {
                    r += cp.PeakVirtualMemorySize64;
                }
                catch
                {
                    // Ignore; could be access is denied
                }

            return r;
        }

        private void processKill(Process p)
        {
        retry:
            try
            {
                foreach (Process cp in Process.GetProcessesByName(p.ProcessName))
                    cp.Kill();
            }
            catch
            {
                Thread.Sleep(100);
                goto retry; // could be access denied
            }
        }

        void WriteToStream(object sender, DataReceivedEventArgs args, StreamWriter stream, ref int limit)
        {
            try
            {
                if (limit > 0 && args != null && args.Data != null)
                {
                    stream.WriteLine(args.Data);
                    limit -= args.Data.Length;
                }
            }
            catch (System.NullReferenceException)
            {
                // That's okay, let's just discared the output.
            }
        }

        void runJob(Experiment e, Job j)
        {
            try
            {
                getBinary(e);

                // Console.WriteLine("Running job #" + j.ID);
                File.Copy(j.filename, j.localFilename, true);

                Result r = new Result();
                r.j = j;

                int output_limit = 134217728; // 128 MB
                int error_limit = 262144; // 256 KB

                StreamWriter out_writer = new StreamWriter(r.stdout);
                StreamWriter err_writer = new StreamWriter(r.stderr);
                Process p = new Process();
                p.StartInfo.FileName = e.localExecutable;
                p.StartInfo.WorkingDirectory = e.localDir;
                p.StartInfo.Arguments = j.localFilename + " " + e.Parameters;
                //p.StartInfo.Arguments = e.Parameters + " " + j.localFilename;
                //p.StartInfo.Arguments = e.Parameters;
                //p.StartInfo.Arguments = " " + j.filename;
                p.StartInfo.CreateNoWindow = true;
                p.StartInfo.RedirectStandardOutput = true;
                p.StartInfo.RedirectStandardError = true;
                p.StartInfo.UseShellExecute = false;
                p.OutputDataReceived += (sender, args) => WriteToStream(sender, args, out_writer, ref output_limit);
                p.ErrorDataReceived += (sender, args) => WriteToStream(sender, args, err_writer, ref error_limit);
                bool exhausted_time = false, exhausted_memory = false;

                if (e.localExecutable.EndsWith(".cmd") || e.localExecutable.EndsWith(".bat"))
                {
                    p.StartInfo.FileName = @"C:\Windows\System32\cmd.exe";
                    p.StartInfo.Arguments = "/c " + e.localExecutable + " " + p.StartInfo.Arguments;
                }

                // For stdin-only programs like mathsat:
                //p.StartInfo.RedirectStandardInput = true;
                //p.StartInfo.Arguments = e.Parameters;
                //StreamReader fin = new StreamReader(j.localFilename);

            retry:
                try
                {
                    p.Start();
                    p.BeginOutputReadLine();
                    p.BeginErrorReadLine();

                    // For stdin-only programs like mathsat:
                    //while (!fin.EndOfStream)
                    //    p.StandardInput.WriteLine(fin.ReadLine());

                    //fin.Close();
                    //p.StandardInput.Close();
                }
                catch (System.ComponentModel.Win32Exception ex)
                {
                    if (ex.Message == "The process cannot access the file because it is being used by another process")
                    {
                        Console.WriteLine("Retrying to execute binary...");
                        Thread.Sleep(500);
                        goto retry;
                    }
                    else
                        throw ex;
                }

                try
                {
                    do
                    {
                        p.Refresh();
                        if (!p.HasExited)
                        {
                            if (processTime(p).TotalSeconds >= e.timeout.TotalSeconds)
                            {
                                Console.WriteLine("Job timed out; killing.");
                                exhausted_time = true;
                                processKill(p);
                            }
                            else if (e.memout != 0 && processMemory(p) > e.memout)
                            {
                                Console.WriteLine("Job uses too much memory; killing.");
                                exhausted_memory = true;
                                processKill(p);
                            }
                            else if (output_limit <= 0 || error_limit <= 0)
                            {
                                Console.WriteLine("Job produced too much output; killing.");
                                processKill(p);
                                throw new Exception("Job produced too much output.");
                            }
                        }
                    }
                    while (!p.WaitForExit(500));
                }
                catch (InvalidOperationException ex)
                {
                    Console.WriteLine("Invalid Operation: " + ex.Message);
                    Console.WriteLine("Assuming process has ended.");
                }

                p.WaitForExit();

                int excode = p.ExitCode;
                double runtime = (exhausted_time ? e.timeout.TotalSeconds : processTime(p).TotalSeconds);

                p.Close();

                Thread.Sleep(500); // Give the asynch stdout/stderr events a chance to finish.

                out_writer.Flush();
                err_writer.Flush();

                r.exitCode = ((exhausted_time) ? "TIME" : (exhausted_memory) ? "MEMORY" : excode.ToString());
                r.runtime = runtime;
                results.Add(r);
            }
            catch (Exception ex)
            {
                logInfrastructureError(j, ex.Message);
            }
        }

        class ResultTarget
        {
            public uint sat = 0, unsat = 0, other = 0;
        };

        ResultTarget getTarget(string filename)
        {
            ResultTarget res = new ResultTarget();

            try
            {
                FileStream f = File.Open(filename, System.IO.FileMode.Open, System.IO.FileAccess.Read);
                StreamReader r = new StreamReader(f);

                while (!r.EndOfStream)
                {
                    string l = r.ReadLine(); // does not contain \r\n
                    if (l.StartsWith("(set-info :status sat)"))
                        res.sat++;
                    else if (l.StartsWith("(set-info :status unsat)"))
                        res.unsat++;
                    else if (l.StartsWith("(set-info :status"))
                        res.other++;
                }

                r.Close();
                f.Close();
            }
            catch (Exception)
            {
                // OK, this can happen for bogus filenames, etc. 
            }

            return res;
        }

        ResultTarget getResultCounts(Result r)
        {
            ResultTarget res = new ResultTarget();
            r.stdout.Seek(0, SeekOrigin.Begin);
            StreamReader reader = new StreamReader(r.stdout);
            while (!reader.EndOfStream)
            {
                string l = reader.ReadLine(); // does not contain \r\n
                if (l == "sat" || l == "SAT" || l == "SATISFIABLE") // || l == "VERIFICATION FAILED")
                    res.sat++;
                else if (l == "unsat" || l == "UNSAT" || l == "UNSATISFIABLE") // || l == "VERIFICATION SUCCESSFUL")
                    res.unsat++;
                else if (l == "unknown" || l == "UNKNOWN" || l == "INDETERMINATE")
                    res.other++;
            }
            return res;
        }

        //int getSATorUNSATcode(string filename) {
        //  FileStream f = File.Open(filename, System.IO.FileMode.Open, System.IO.FileAccess.Read);
        //  StreamReader r = new StreamReader(f);
        //  int res = -1;      

        //  while (!r.EndOfStream && res == -1)
        //  {
        //    string l = r.ReadLine(); // does not contain \r\n
        //    if (l == ("sat"))
        //      res = 0; 
        //    else if (l == ("unsat"))
        //      res = 1;
        //    else if (l == ("unknown"))
        //      res = 2; 
        //  }

        //  r.Close();
        //  f.Close();
        //  return (res == -1) ? 2 : res; // no answer found means unknown.
        //}

        int getBugCode(Result r)
        {
            r.stderr.Seek(0, SeekOrigin.Begin);
            r.stdout.Seek(0, SeekOrigin.Begin);
            StreamReader reader = new StreamReader(r.stderr);
            int res = -1;
            while (!reader.EndOfStream && res == -1)
            {
                string l = reader.ReadLine();
                if (l.StartsWith("(error") &&
                    l.Contains("check annotation"))
                    res = 3;
            }
            reader = new StreamReader(r.stdout);
            while (!reader.EndOfStream && res == -1)
            {
                string l = reader.ReadLine();
                if (l.StartsWith("(error") &&
                    l.Contains("check annotation"))
                    res = 3;
            }
            return (res == -1) ? 4 : res; // no bug found means general error.
        }

        void saveResult(Result r, ref SqlTransaction t)
        {
            int resultCode = 4; // ERROR

            ResultTarget target = new ResultTarget();
            ResultTarget result = new ResultTarget();

            try
            {
                target = getTarget(r.j.localFilename);
                result = getResultCounts(r);
            }
            catch (Exception ex)
            {
                logInfrastructureError(r.j, ex.Message);
                return;
            }

            if (r.exitCode == "TIME")
                resultCode = 5; // TIMEOUT
            else if (r.exitCode == "MEMORY")
                resultCode = 6; // MEMORYOUT
            else if (r.exitCode == "0") // || r.exitCode == "10" || r.exitCode == "20")
            {
                resultCode = 0; // OK
                if (result.sat == 0 && result.unsat == 0 && result.other == 0)
                    resultCode = 4; // ERROR
            }
            else if (r.exitCode == "101")
                resultCode = 6; // MEMORYOUT
            else
                resultCode = getBugCode(r);

            ensureConnected();
            string exitCodeString = (r.exitCode == "TIME" || r.exitCode == "MEMORY") ? "NULL" : r.exitCode;
            SqlCommand cmd = new SqlCommand("SRN " + r.j.experimentID + "," + r.j.ID + "," + r.j.filenameP + "," + exitCodeString + "," + resultCode + "," +
                                            result.sat + "," + result.unsat + "," + result.other + "," + target.sat + "," + target.unsat + "," + target.other + "," +
                                            r.runtime + ",@STDOUT,@STDERR,'" + myName + "';", sql, t);
            cmd.CommandTimeout = 0;

            SqlParameter out_param = cmd.Parameters.Add("@STDOUT", System.Data.SqlDbType.VarChar);
            SqlParameter err_param = cmd.Parameters.Add("@STDERR", System.Data.SqlDbType.VarChar);

            //if (true)
            if (resultCode >= 3)
            {
                r.stdout.Seek(0, SeekOrigin.Begin);
                out_param.Value = new StreamReader(r.stdout).ReadToEnd();
                r.stderr.Seek(0, SeekOrigin.Begin);
                err_param.Value = new StreamReader(r.stderr).ReadToEnd();
            }
            else
            {
                out_param.Value = System.DBNull.Value;
                err_param.Value = System.DBNull.Value;
            }

            cmd.ExecuteNonQuery();
        }

        void saveResults()
        {
            List<Result>.Enumerator e;
            SqlTransaction t = sql.BeginTransaction();

        retry:
            try
            {
                e = results.GetEnumerator();
                while (e.MoveNext())
                    saveResult(e.Current, ref t);

                t.Commit();
            }
            catch (SqlException ex)
            {
                Console.WriteLine("Retrying after SQL ERROR: " + ex.Message);
                t.Rollback();
                t.Dispose();
                t = sql.BeginTransaction();
                Thread.Sleep(500);
                goto retry;
            }
            catch (Exception ex)
            {
                Console.WriteLine("Fatal error during result submission: " + ex.Message);
                t.Rollback();
                t.Dispose();
                return;
            }


            e = results.GetEnumerator();
            while (e.MoveNext())
            {
                try
                {
                    File.Delete(e.Current.j.localFilename);
                }
                catch (Exception)
                {
                    /* That's okay. */
                }
            }

            results.Clear();
        }

        void logInfrastructureError(Job j, string message)
        {
            string x = "INFRASTRUCTURE ERROR: " + message;
            ensureConnected();
            SqlCommand cmd = new SqlCommand("INSERT INTO Data " +
                              "(ExperimentID,FilenameP,ResultCode,stderr,Worker,SAT,UNSAT,UNKNOWN,TargetSAT,TargetUNSAT,TargetUNKNOWN) VALUES (" +
                              j.experimentID + ", " +
                              j.filenameP + ", " +
                              "4," +
                              "@ERRORMESSAGE, " +
                              "'" + myName + "'," +
                              "0,0,0,0,0,0); " +
                              "DELETE FROM JobQueue WHERE ID=" + j.ID + ";", sql);

            SqlParameter p = cmd.Parameters.Add("@ERRORMESSAGE", System.Data.SqlDbType.VarChar);
            p.Size = x.Length;
            p.Value = x;

            cmd.ExecuteNonQuery();
        }

        void requeueInfrastructureErrors(Experiment e)
        {
          SqlCommand cmd = new SqlCommand("SELECT Data.ID, Strings.s as Filename FROM Data, Strings WHERE FilenameP=Strings.ID AND ExperimentID=" + e.ID + " AND stderr like 'INFRASTRUCTURE ERROR%'", sql);
          SqlDataReader r = cmd.ExecuteReader();
          Dictionary<int, string> d = new Dictionary<int, string>();          
          while (r.Read()) {
            d[(int)r["ID"]] = (string)r["Filename"];
          }
          r.Close();

          foreach (KeyValuePair<int,string> kvp in d)
          {            
            SqlCommand cmd2 = new SqlCommand("AQ " + e.ID + ",'" + kvp.Value + "';", sql);
            cmd2.ExecuteNonQuery();

            cmd2 = new SqlCommand("DELETE FROM Data WHERE ExperimentID=" + e.ID + " AND ID=" + kvp.Key, sql);
            cmd2.ExecuteNonQuery();
          }
        }

        void recovery(Experiment e)
        {
            // Recovery job.
            if (!haveJobs(e)) return;
            requeueInfrastructureErrors(e);
            for (Job j = getJob(e, -1); j != null; j = getJob(e, -1))
            {
                runJob(e, j);
                if (results.Count > 50) saveResults();
            }
            saveResults();
        }
        bool haveInfrastructureErrors(Experiment e)
        {
          ensureConnected();
          Dictionary<string, Object> rd =
            SQLRead("SELECT TOP 1 ID FROM Data WHERE ExperimentID=" + e.ID + " AND stderr like 'INFRASTRUCTURE ERROR%'", sql);
          return rd.Count() != 0;
        }

        void infrastructureErrorsRecovery(Experiment e)
        {
          if (haveInfrastructureErrors(e))
            requeueInfrastructureErrors(e);
        }

        void oneJob(Experiment e, int jid)
        {
            if (!haveJobs(e)) return;
            Job j = getJob(e, jid);
            runJob(e, j);
            saveResults();
        }

        void manyJobs(Experiment e)
        {
            while (haveJobs(e))
            {
                for (Job j = getJob(e); j != null; j = getJob(e))
                {
                    runJob(e, j);
                    if (results.Count >= 1) saveResults();
                }

                saveResults();
                Thread.Sleep(5000);
            }
        }

        int main(string[] args)
        {
            if (args.Count() != 1 && args.Count() != 2 && args.Count() != 3)
                return 1;

            try
            {
                if (args.Count() > 1)
                {
                    string eId = args[0];
                    sql = new SqlConnection((args.Count() == 3) ? args[2] : args[1]);
                    myName = Environment.MachineName + "-" + Process.GetCurrentProcess().Id.ToString();
                    Experiment e = null;

                    Console.CancelKeyPress += delegate
                    {
                        Console.WriteLine("Worker was interrupted. Removing entries from jobqueue.");
                        ensureConnected();
                        SqlCommand cmd = new SqlCommand("UPDATE JobQueue SET Worker=NULL,AcquireTime=NULL WHERE worker='" + myName + "';", sql);
                        cmd.ExecuteNonQuery();
                        sql.Close();
                    };

                    try
                    {
                        e = getExperiment(eId);

                        if (args.Count() == 3)
                        {
                            if (args[1] == "?")
                                populate(e);
                            else if (args[1] == "!")
                                recovery(e);
                            else if (args[1] == "*")
                                infrastructureErrorsRecovery(e);
                            else
                                oneJob(e, Convert.ToInt32(args[1]));
                        }
                        else
                        {
                            manyJobs(e);
                        }
                        saveResults();
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine("Worker dying because of: " + ex.Message);
                        saveResults();
                        return 1;
                    }

                    try
                    {
                        if (e != null && Directory.Exists(e.localDir))
                        {
                            Console.WriteLine("Removing temporary directory...");
                            Directory.Delete(e.localDir, true);
                        }
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine("Error removing temporary directory: " + ex.Message);
                    }

                }
                else
                {
                    // Any-experiment job.                    
                    sql = new SqlConnection(args[0]);
                    myName = Environment.MachineName + "-" + Process.GetCurrentProcess().Id.ToString();

                    Console.CancelKeyPress += delegate
                    {
                        Console.WriteLine("Worker was interrupted. Removing entries from jobqueue.");
                        ensureConnected();
                        SqlCommand cmd = new SqlCommand("UPDATE JobQueue SET Worker=NULL,AcquireTime=NULL WHERE worker='" + myName + "';", sql);
                        cmd.ExecuteNonQuery();
                        sql.Close();
                    };

                    try
                    {
                        while (true)
                        {
                            ensureConnected();
                            Dictionary<string, Object> r =
                                SQLRead("select TOP(1) experimentid from jobqueue order by NEWID()", sql);

                            if (r.Count() == 0)
                                break;

                            Experiment e = getExperiment(r["experimentid"].ToString());

                            manyJobs(e);
                            saveResults();

                            try
                            {
                                if (e != null && Directory.Exists(e.localDir))
                                {
                                    Console.WriteLine("Removing temporary directory...");
                                    Directory.Delete(e.localDir, true);
                                }
                            }
                            catch (Exception ex)
                            {
                                Console.WriteLine("Error removing temporary directory: " + ex.Message);
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine("Worker dying because of: " + ex.Message);
                        saveResults();
                        return 1;
                    }
                }

                try
                {
                    sql.Close();
                }
                catch { }

            }
            catch (Exception e)
            {
                Console.WriteLine("TOPLEVEL EXCEPTION: " + e.Message);
                Console.WriteLine("AT: " + e.StackTrace);
                return 1;
            }

            return 0;
        }

        static int Main(string[] args)
        {
            Program p = new Program();
            return p.main(args);
        }
    }
}
