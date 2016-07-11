using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.IO;
using System.IO.Packaging;
using System.Text.RegularExpressions;
using System.Threading;
using System.Diagnostics;
using System.Runtime.InteropServices;
using Microsoft.Win32;

namespace worker
{
    class Program
    {
        [DllImport("kernel32.dll", CharSet = CharSet.Unicode)]
        [return: MarshalAs(UnmanagedType.Bool)]
        internal static extern bool CopyFile(string lpFileNameFrom, string lpFileNameTo, bool failIfExists);

        public static void LongFileNameCopy(string from, string to, bool failIfExists = true)
        {
            string f = (from.StartsWith("\\")) ? @"\\?\UNC" + from.Substring(1) : (@"\\?\" + from);
            string t = (to.StartsWith("\\")) ? @"\\?\UNC" + to.Substring(1) : (@"\\?\" + to);
            if (!CopyFile(f, t, failIfExists))
                throw new Exception("Could not copy benchmark " + from);
        }

        SqlConnection sql = null;
        string myName = "";
        Random rng = new Random();

        const int init_buf_size = 16777216;
        const int output_limit = 1 * (1024 * 1024); // 1 MB
        const int error_limit = 256 * 1024; // 256 KB
        const int infrastructure_errors_init = 100;
        int infrastructure_errors_max = 100;

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
            public string custom_check_sat = null;

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
            public MemoryStream stdout = new MemoryStream(init_buf_size);
            public MemoryStream stderr = new MemoryStream(init_buf_size);
        };

        private List<Result> results = new List<Result>();

        private void ensureConnected()
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

        private void ensureDisconnected()
        {
            if (sql.State != System.Data.ConnectionState.Open)
                return;

            uint retry_cnt = 0;
            retry:
            try
            {
                sql.Close();
            }
            catch (Exception ex)
            {
                Thread.Sleep(1000);
                Console.WriteLine("Retrying after SQL disconnection failure: " + ex.Message);
                if (retry_cnt++ < 10)
                    goto retry;
                else
                    throw new Exception("Tried to disconnect from SQL server 10 times, giving up.");
            }
        }

        static Dictionary<string, Object> SQLRead(string cmdString, SqlConnection sql)
        {
            SqlCommand cmd = null;
            SqlDataReader r = null;

            bool has_data = false;
            retry_read:
            try
            {
                cmd = new SqlCommand(cmdString, sql);
                cmd.CommandTimeout = 0;
                r = cmd.ExecuteReader();
                has_data = r.Read();
            }
            catch (Exception ex)
            {
                Console.WriteLine("Retrying after SQL read failure: " + ex.Message);
                Thread.Sleep(1000);
                if (sql.State != System.Data.ConnectionState.Open)
                    sql.Open(); /* Bail out if this throws something */
                goto retry_read;
            }


            Dictionary<string, Object> res = new Dictionary<string, Object>();

            if (has_data && r != null)
                for (int i = 0; i < r.FieldCount; i++)
                    res[r.GetName(i)] = r[i];

            if (cmd != null)
                cmd.Cancel();

            retry:
            try
            {
                if (r != null)
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

        Dictionary<string, Object> SQLRead(string cmdString)
        {
            ensureConnected();
            Dictionary<string, Object> res = SQLRead(cmdString, sql);
            ensureDisconnected();
            return res;
        }

        public string getTempDirectory()
        {
            Console.WriteLine("Creating temporary directory...");
            string path = Path.Combine(Path.GetTempPath(), Path.GetRandomFileName(), myName);
            Directory.CreateDirectory(path);
            return path;
        }

        Experiment getExperiment(string eId)
        {
            Console.WriteLine("Getting experiment info... ");
            Dictionary<string, Object> r =
              SQLRead("SELECT Category,SharedDir,Extension,Memout,Timeout,Parameters,Binary,Longparams FROM Experiments WHERE ID=" + eId);

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
            res.custom_check_sat = null;

            if (res.Parameters.Contains("replace-check-sat="))
            {
                Regex rx = new Regex("replace-check-sat=\"([^\"]+)\"");
                Match m = rx.Match(res.Parameters);
                if (m.Groups.Count > 0)
                {
                    string new_cs = m.Groups[1].Value;
                    Console.WriteLine("new check-sat: " + new_cs);
                    res.Parameters = res.Parameters.Replace("replace-check-sat=\"" + new_cs + "\"", "");
                    res.custom_check_sat = new_cs;
                }
            }

            return res;
        }

        void populate(Experiment e)
        {
            ensureConnected();

            // First check whether someone else is populating already.
            int c = 1;

            SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM Data WHERE ExperimentID=" + e.ID + ";", sql);
            cmd.CommandTimeout = 0;
            SqlDataReader r = cmd.ExecuteReader();
            if (r.Read()) c = ((int)r[0]);
            r.Close();
            if (c != 0)
                goto bailout;

            cmd = new SqlCommand("SELECT COUNT(*) FROM JobQueue WHERE ExperimentID=" + e.ID + ";", sql);
            cmd.CommandTimeout = 0;
            r = cmd.ExecuteReader();
            if (r.Read()) c = ((int)r[0]);
            r.Close();
            if (c != 0)
                goto bailout;


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

                if (files.Count() == 0)
                    continue;

                int sl = e.sharedDir.Length + 1;
                SqlTransaction t = null;

                IEnumerator<string> batch_start = files.GetEnumerator();
                batch_start.MoveNext();

                retry:
                try
                {
                    ensureConnected();
                    t = sql.BeginTransaction();
                    int cnt = 0;

                    IEnumerator<string> it = batch_start;
                    while (true)
                    {
                        string s = it.Current;

                        if (Path.GetExtension(s).Substring(1) != cur)
                            continue;

                        cmd = new SqlCommand("AQ " + e.ID + ",'" + s.Substring(sl) + "';", sql, t);
                        cmd.CommandTimeout = 0;
                        cmd.ExecuteNonQuery();

                        if (++cnt == 250)
                        {
                            t.Commit();
                            t.Dispose();
                            t = sql.BeginTransaction();
                            cnt = 0;
                            if (!it.MoveNext())
                                break;
                            else
                                batch_start = it;
                        }
                        else
                        {
                            if (!it.MoveNext())
                                break;
                        }
                    }

                    if (t != null)
                        t.Commit();
                }
                catch (SqlException ex)
                {
                    Console.WriteLine("Retrying after SQL ERROR: " + ex.Message);
                    try { t.Rollback(); t.Dispose(); } catch (Exception) { }
                    Thread.Sleep(1000);
                    goto retry;
                }
            }

            bailout:
            ensureDisconnected();
            return;
        }

        bool haveJobs(Experiment e)
        {
            Dictionary<string, Object> rd = SQLRead("SELECT TOP 1 ID FROM JobQueue WHERE ExperimentID=" + e.ID);
            return rd.Count() != 0;
        }

        Job getJob(Experiment e, int jID = 0)
        {
            Job j = new Job();

            if (jID == -1)
            {
                retry:
                ensureConnected();

                Dictionary<string, Object> r =
                    SQLRead("SELECT TOP 1 ID FROM JobQueue WHERE ExperimentID=" + e.ID, sql);

                if (r.Count() == 0) return null;

                jID = (int)r["ID"];

                SqlCommand cmd = new SqlCommand("UPDATE JobQueue SET Worker='" + myName + "/Recovery',AcquireTime=GETDATE() WHERE ID=" + jID, sql);
                if (cmd.ExecuteNonQuery() == 0)
                    jID = 0;

                if (jID == 0) goto retry;

                Dictionary<string, Object> rd =
                    SQLRead("SELECT a.ID as ID,a.FilenameP as FileP,b.s as Filename FROM JobQueue as a,Strings as b WHERE Worker='" + myName + "/Recovery' AND a.FilenameP=b.ID AND ExperimentID=" + e.ID + ";", sql);

                ensureDisconnected();

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
                                 "WHERE a.ID=@jid AND a.FilenameP=b.ID;");

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

                Dictionary<string, Object> r = SQLRead("SELECT Binary FROM Binaries WHERE ID=" + e.binaryID);

                data = (byte[])r["Binary"];

                int sz = data.GetUpperBound(0);
                fs.Write(data, 0, sz);
                fs.Flush();
                fs.Close();

                if (data[0] == 0x50 && data[1] == 0x4b &&
                    data[2] == 0x03 && data[3] == 0x04)
                {
                    // This is a zip file.
                    string tfn = Path.Combine(Path.GetTempFileName() + ".zip");
                    File.Move(e.localExecutable, tfn);
                    e.localExecutable = null;
                    Package pkg = Package.Open(tfn, FileMode.Open);
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

                    pkg.Close();
                    if (e.localExecutable == null)
                        throw new Exception("Main executable not found in zip.");
                    try { File.Delete(tfn); }
                    catch (Exception) { }
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
                    tmp.Close();
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

        private static TimeSpan processTime(Process p)
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

        private static long processMemory(Process p)
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

        private static void processKill(Process p)
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

        static void WriteToStream(object sender, DataReceivedEventArgs args, StreamWriter stream, ref int limit)
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

        static void replace_checksat(Experiment e, Job j)
        {
            string tmpf = Path.Combine(Path.GetTempPath(), Path.GetRandomFileName());
            FileStream f = new FileStream(j.localFilename, FileMode.Open, FileAccess.Read);
            FileStream ft = new FileStream(tmpf, FileMode.Create, FileAccess.Write);
            StreamReader fr = new StreamReader(f);
            StreamWriter ftw = new StreamWriter(ft);
            while (!fr.EndOfStream)
            {
                string s = fr.ReadLine();
                ftw.WriteLine(s.Replace("(check-sat)", e.custom_check_sat));
            }
            ftw.Close();
            ft.Close();
            fr.Close();
            f.Close();
            File.Copy(tmpf, j.localFilename, true);
            try
            {
                File.Delete(tmpf);
            }
            catch { }
        }

        void runJob(Experiment e, Job j)
        {
            retry_from_scratch:

            try
            {
                getBinary(e);

                Result r = new Result();
                r.j = j;
                int out_lim = output_limit;
                int err_lim = error_limit;

                try
                {
                    // Console.WriteLine("Running job #" + j.ID);
                    LongFileNameCopy(j.filename, j.localFilename, false);
                    if (e.custom_check_sat != null)
                        replace_checksat(e, j);
                }
                catch (System.OutOfMemoryException)
                {
                    r.exitCode = "MEMORY";
                    r.runtime = 0;
                    results.Add(r);
                    return;
                }

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
                p.OutputDataReceived += (sender, args) => WriteToStream(sender, args, out_writer, ref out_lim);
                p.ErrorDataReceived += (sender, args) => WriteToStream(sender, args, err_writer, ref err_lim);
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

                // CMW: Are these exit codes reliable?
                if (excode == -1073741515)
                    logInfrastructureError(j, "Binary could not be executed.");
                else if (excode == -1073741571)
                    exhausted_memory = true; // .NET StackOverflowException

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
                if (logInfrastructureError(j, ex.Message + "\n" + ex.StackTrace))
                    goto retry_from_scratch;
            }
        }

        class ResultTarget
        {
            public uint sat = 0, unsat = 0, other = 0;
        };

        static ResultTarget getTarget(string filename)
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

        static ResultTarget getResultCounts(Result r)
        {
            ResultTarget res = new ResultTarget();
            r.stdout.Seek(0, SeekOrigin.Begin);
            StreamReader reader = new StreamReader(r.stdout);
            while (!reader.EndOfStream)
            {
                string l = reader.ReadLine(); // does not contain \r\n
                l.TrimEnd(' ');
                if (l == "sat" || l == "SAT" || l == "SATISFIABLE" || l == "s SATISFIABLE" || l == "SuccessfulRuns = 1") // || l == "VERIFICATION FAILED")
                    res.sat++;
                else if (l == "unsat" || l == "UNSAT" || l == "UNSATISFIABLE" || l == "s UNSATISFIABLE") // || l == "VERIFICATION SUCCESSFUL")
                    res.unsat++;
                else if (l == "unknown" || l == "UNKNOWN" || l == "INDETERMINATE")
                    res.other++;
            }

            //Regex re = new Regex(@"\(restarts: ([0-9]+) flips: ([0-9]+) fps: ([0-9.]+)\)");

            //reader = new StreamReader(r.stderr);
            //r.stderr.Seek(0, SeekOrigin.Begin);
            //while (!reader.EndOfStream)
            //{
            //    Match m = re.Match(reader.ReadLine());
            //    if (m.Success)
            //        res.other += Convert.ToUInt32(m.Groups[2].Value);
            //}

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
                else if (l.StartsWith("(error \"out of memory\")"))
                    res = 6;
            }
            return (res == -1) ? 4 : res; // no bug found means general error.
        }

        void saveResult(Result r, ref SqlTransaction transaction)
        {
            int resultCode = 4; // ERROR

            ResultTarget target = new ResultTarget();
            ResultTarget result = new ResultTarget();

            retry:
            try
            {
                target = getTarget(r.j.localFilename);
                result = getResultCounts(r);
            }
            catch (Exception ex)
            {
                if (logInfrastructureError(r.j, ex.Message + "\n" + ex.StackTrace))
                    goto retry;
                return;
            }

            if (r.exitCode == "TIME")
                resultCode = 5; // TIMEOUT
            else if (r.exitCode == "MEMORY")
                resultCode = 6; // MEMORYOUT
            else if (r.exitCode == "0" || r.exitCode == "10" || r.exitCode == "20")
            {
                resultCode = 0; // OK
                if (result.sat == 0 && result.unsat == 0 && result.other == 0)
                    resultCode = 4; // ERROR
            }
            else if (r.exitCode == "101")
                resultCode = 6; // MEMORYOUT
            else
                resultCode = getBugCode(r);

            string exitCodeString = (r.exitCode == "TIME" || r.exitCode == "MEMORY") ? "NULL" : r.exitCode;
            SqlCommand cmd = new SqlCommand("SRN " + r.j.experimentID + "," + r.j.ID + "," + r.j.filenameP + "," + exitCodeString + "," + resultCode + "," +
                                            result.sat + "," + result.unsat + "," + result.other + "," + target.sat + "," + target.unsat + "," + target.other + "," +
                                            r.runtime + ",@STDOUT,@STDERR,'" + myName + "';", sql, transaction);
            cmd.CommandTimeout = 0;

            SqlParameter out_param = cmd.Parameters.Add("@STDOUT", System.Data.SqlDbType.VarChar);
            SqlParameter err_param = cmd.Parameters.Add("@STDERR", System.Data.SqlDbType.VarChar);

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

            infrastructure_errors_max = infrastructure_errors_init;
        }

        void saveResults()
        {
            List<Result>.Enumerator e;
            SqlTransaction t = null;

            retry:
            try
            {
                ensureConnected();
                t = sql.BeginTransaction();
                e = results.GetEnumerator();

                while (e.MoveNext())
                    saveResult(e.Current, ref t);

                t.Commit();
            }
            catch (SqlException ex)
            {
                Console.WriteLine("Retrying after SQL ERROR: " + ex.Message);
                if (t != null)
                {
                    try
                    {
                        t.Rollback();
                        t.Dispose();
                    }
                    catch (Exception) { /* OK */}
                }
                t = null;
                Thread.Sleep(500);
                goto retry;
            }
            catch (Exception ex)
            {
                Console.WriteLine("Fatal error during result submission: " + ex.Message);
                ensureDisconnected();
                return;
            }
            finally
            {
                ensureDisconnected();
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

        bool logInfrastructureError(Job j, string message)
        {
            if (--infrastructure_errors_max == 0)
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
                cmd.CommandTimeout = 0;

                SqlParameter p = cmd.Parameters.Add("@ERRORMESSAGE", System.Data.SqlDbType.VarChar);
                p.Size = x.Length;
                p.Value = x;

                cmd.ExecuteNonQuery();
                ensureDisconnected();
                return false;
            }
            else
            {
                Thread.Sleep(1000);
                return true;
            }
        }

        void requeueInfrastructureErrors(Experiment e)
        {
            ensureConnected();

            SqlCommand cmd = new SqlCommand("SELECT Data.ID, Strings.s as Filename FROM Data, Strings WHERE FilenameP=Strings.ID AND ExperimentID=" + e.ID + " AND ResultCode=4 AND (stderr like 'INFRASTRUCTURE ERROR%' OR ReturnValue=-1073741515)", sql);
            cmd.CommandTimeout = 0;
            SqlDataReader r = cmd.ExecuteReader();
            Dictionary<int, string> d = new Dictionary<int, string>();
            while (r.Read())
                d[(int)r["ID"]] = (string)r["Filename"];
            r.Close();

            int cnt = 0;
            foreach (KeyValuePair<int, string> kvp in d)
            {
                SqlCommand cmd2 = new SqlCommand("AQ " + e.ID + ",'" + kvp.Value + "';", sql);
                cmd2.CommandTimeout = 0;
                cmd2.ExecuteNonQuery();

                cmd2 = new SqlCommand("DELETE FROM Data WHERE ExperimentID=" + e.ID + " AND ID=" + kvp.Key, sql);
                cmd2.CommandTimeout = 0;
                cmd2.ExecuteNonQuery();

                cnt++;
            }

            ensureDisconnected();
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
            Dictionary<string, Object> rd =
              SQLRead("SELECT TOP 1 ID FROM Data WHERE ExperimentID=" + e.ID + " AND ResultCode=4 AND (stderr like 'INFRASTRUCTURE ERROR%' OR ReturnValue=-1073741515)", sql);
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
                Thread.Sleep(rng.Next(1000, 5 * 3600));
            }
        }

        private static void GetVersionFromRegistry()
        {
            using (RegistryKey ndpKey = RegistryKey.OpenRemoteBaseKey(RegistryHive.LocalMachine, "").OpenSubKey(@"SOFTWARE\Microsoft\NET Framework Setup\NDP\"))
            {
                foreach (string versionKeyName in ndpKey.GetSubKeyNames())
                {
                    if (versionKeyName.StartsWith("v"))
                    {
                        RegistryKey versionKey = ndpKey.OpenSubKey(versionKeyName);
                        string name = (string)versionKey.GetValue("Version", "");
                        string sp = versionKey.GetValue("SP", "").ToString();
                        string install = versionKey.GetValue("Install", "").ToString();
                        if (install == "")
                            Console.WriteLine(versionKeyName + "  " + name);
                        else
                        {
                            if (sp != "" && install == "1")
                                Console.WriteLine(versionKeyName + "  " + name + "  SP" + sp);
                        }

                        if (name != "")
                            continue;

                        foreach (string subKeyName in versionKey.GetSubKeyNames())
                        {
                            RegistryKey subKey = versionKey.OpenSubKey(subKeyName);
                            name = (string)subKey.GetValue("Version", "");
                            if (name != "")
                                sp = subKey.GetValue("SP", "").ToString();
                            install = subKey.GetValue("Install", "").ToString();
                            if (install == "")
                                Console.WriteLine(versionKeyName + "  " + name);
                            else
                            {
                                if (sp != "" && install == "1")
                                    Console.WriteLine("  " + subKeyName + "  " + name + "  SP" + sp);
                                else if (install == "1")
                                    Console.WriteLine("  " + subKeyName + "  " + name);
                            }
                        }
                    }
                }
            }
        }

        int main(string[] args)
        {
            if (args.Count() != 1 && args.Count() != 2 && args.Count() != 3)
                return 1;

            // GetVersionFromRegistry();

            try
            {
                Console.CancelKeyPress += delegate
                {
                    Console.WriteLine("Worker was interrupted. Removing entries from jobqueue.");
                    ensureConnected();
                    SqlCommand cmd = new SqlCommand("UPDATE JobQueue SET Worker=NULL,AcquireTime=NULL WHERE worker='" + myName + "';", sql);
                    cmd.ExecuteNonQuery();
                    ensureDisconnected();
                };

                string db = args.Count() == 1 ? args[0] : (args.Count() == 3) ? args[2] : args[1];
                // Console.WriteLine("Connecting to: {0}", db);
                myName = Environment.MachineName + "-" + Process.GetCurrentProcess().Id.ToString();
                sql = new SqlConnection(db);
                Experiment e = null;

                if (args.Count() > 1) // One-experiment job
                {
                    e = getExperiment(args[0]);

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
                else // (args.Count() == 1)
                {
                    while (true) // Any-experiment job.
                    {
                        Dictionary<string, Object> r = SQLRead("select TOP(1) ExperimentID from jobqueue order by NEWID()");

                        if (r.Count() == 0)
                            break;

                        e = getExperiment(r["ExperimentID"].ToString());

                        manyJobs(e);
                        saveResults();
                    }
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

                try { ensureDisconnected(); }
                catch { }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Worker dying because of: " + ex.Message);
                Console.WriteLine("Stacktrace: " + ex.StackTrace);
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
