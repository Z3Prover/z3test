using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using System.Threading;
using System.Diagnostics;

namespace TestZ3
{
    class Program
    {
        Configuration c = new Configuration();
        int nrTests = 0, nrBugs = 0;

        static void say(string s)
        {
            Console.WriteLine(DateTime.Now.ToString() + ": " + s);
        }

        bool checkTestDir(DirectoryInfo di, DateTime oldTime)
        {
            foreach (string ex in c.ExcludeDirectories)
                if (di.Name.EndsWith(ex)) return false;

            foreach (FileInfo fi in di.GetFiles())
            {
                if (fi.LastWriteTime > oldTime)
                {
                    return true;
                }
            }
            return false;
        }

        bool checkTestTime(string z3dir, DateTime oldTime)
        {
            for (int i = 0; i < c.Directories.Count(); i++)
            {
                string cur = c.Directories[i].dir;
                if (!Path.IsPathRooted(cur))
                    cur = Path.GetFullPath(z3dir + cur);

                // Console.WriteLine("Searching for tests at: " + cur);

                DirectoryInfo di = new DirectoryInfo(cur);
                if (checkTestDir(di, oldTime)) return true;
                foreach (DirectoryInfo sdi in di.GetDirectories())
                    if (checkTestDir(di, oldTime)) return true;
            }

            return false;
        }

        class Result
        {
            public string stdout = "";
            public string stderr = "";
            public bool exhaustedMemory = false;
            public bool exhaustedTime = false;
        };

        bool CSCompile(FileInfo fi, TestConfiguration tc, ref Result res)
        {
            string dll = tc.absolute_dir + @"\" + tc.bindir + @"\" + tc.bin;
            string driver = fi.DirectoryName + @"\" + tc.driver;

            StringWriter out_writer = new StringWriter();
            StringWriter err_writer = new StringWriter();
            Process compiler = new Process();
            compiler.StartInfo.FileName = tc.executor;
            compiler.StartInfo.Arguments = tc.executor_args +
                                           " /Reference:" + dll +
                                           " /OUT:" + tc.absolute_dir + @"\" + tc.bindir + @"\cstest.exe" +
                                           " " + driver +
                                           " " + fi.FullName;
            compiler.OutputDataReceived += (sender, args) => out_writer.WriteLine(args.Data);
            compiler.ErrorDataReceived += (sender, args) => err_writer.WriteLine(args.Data);
            compiler.StartInfo.RedirectStandardOutput = true;
            compiler.StartInfo.RedirectStandardError = true;
            compiler.StartInfo.CreateNoWindow = true;
            compiler.StartInfo.UseShellExecute = false;
            compiler.Start();
            compiler.BeginOutputReadLine();
            compiler.BeginErrorReadLine();
            compiler.WaitForExit();
            int rv = compiler.ExitCode;
            compiler.Close();
            Thread.Sleep(10); // Give the asynch stdout/stderr events a chance to finish.
            out_writer.Flush();
            err_writer.Flush();
            if (rv != 0)
            {
                res.stdout += out_writer.ToString();
                res.stderr += err_writer.ToString();
                return false;
            }

            return true;
        }

        bool setup(FileInfo fi, TestConfiguration tc, ref Process p, ref Result res)
        {
            switch (fi.Extension)
            {
                case ".smt2":
                    p.StartInfo.FileName = tc.absolute_dir + @"\" +  tc.bindir + @"\" + tc.bin;
                    p.StartInfo.Arguments = tc.args + " " + fi.FullName;
                    break;
                case ".py":
                    p.StartInfo.FileName = tc.executor;                    
                    p.StartInfo.EnvironmentVariables.Remove("PATH");
                    p.StartInfo.EnvironmentVariables.Remove("PYTHONPATH");
                    p.StartInfo.EnvironmentVariables.Add("PATH", tc.absolute_dir + @"\" + tc.bindir);
                    string pypath = tc.absolute_dir + @"\" + tc.args;
                    p.StartInfo.EnvironmentVariables.Add("PYTHONPATH", pypath);
                    //say("Environment");
                    //foreach (System.Collections.DictionaryEntry d in p.StartInfo.EnvironmentVariables)
                    //  say(d.Key + " = " + d.Value);
                    //say("PATH = " + p.StartInfo.EnvironmentVariables["PATH"]);
                    //say("PYTHONPATH = " + p.StartInfo.EnvironmentVariables["PYTHONPATH"]);
                    p.StartInfo.Arguments = fi.FullName;
                    break;
                case ".cs":
                    if (!CSCompile(fi, tc, ref res))
                        return false;

                    p.StartInfo.FileName = tc.absolute_dir + @"\" + tc.bindir + @"\cstest.exe";
                    p.StartInfo.Arguments = "";
                    break;
                default:
                    throw new Exception("Don't know how to execute " + fi.Extension + " test cases");
            }

            p.StartInfo.CreateNoWindow = true;
            p.StartInfo.RedirectStandardOutput = true;
            p.StartInfo.RedirectStandardError = true;
            p.StartInfo.UseShellExecute = false;
            
            return true;
            //say("Running: " + p.StartInfo.FileName + " " + p.StartInfo.Arguments);
        }

        Result execute(FileInfo fi, TestConfiguration tc)
        {
            Result res = new Result();

            // say("Running test: " + fi.FullName);

            StringWriter out_writer = new StringWriter();
            StringWriter err_writer = new StringWriter();
            Process p = new Process();
            
            if (!setup(fi, tc, ref p, ref res))
            {
                res.stdout += "Test case setup failed.\n";
                return res;
            }

            p.OutputDataReceived += (sender, args) => out_writer.WriteLine(args.Data);
            p.ErrorDataReceived += (sender, args) => err_writer.WriteLine(args.Data);

        retry:
            try
            {
                p.Start();
                p.BeginOutputReadLine();
                p.BeginErrorReadLine();
            }
            catch (System.ComponentModel.Win32Exception ex)
            {
                if (ex.Message == "The process cannot access the file because it is being used by another process")
                {
                    // say("Retrying to execute binary...");
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
                        if (Execution.time(p).TotalSeconds >= c.TIMEOUT)
                        {
                            // say("Job timed out; killing.");
                            res.exhaustedTime = true;
                            Execution.kill(p);
                        }
                        else if (c.MEMOUT != 0 && Execution.memory(p) > c.MEMOUT)
                        {
                            // say("Job uses too much memory; killing.");
                            res.exhaustedMemory = true;
                            Execution.kill(p);
                        }
                    }
                }
                while (!p.WaitForExit(500));
            }
            catch (InvalidOperationException ex)
            {
                say("Invalid Operation; Assuming process has ended: " + ex.Message);
            }

            p.WaitForExit();

            int excode = p.ExitCode;
            double runtime = (res.exhaustedTime ? c.TIMEOUT : Execution.time(p).TotalSeconds);

            p.Close();

            Thread.Sleep(10); // Give the asynch stdout/stderr events a chance to finish.

            out_writer.Flush();
            err_writer.Flush();

            res.stdout = out_writer.ToString();
            res.stderr = err_writer.ToString();

            if (fi.Extension == ".cs")
                File.Delete(tc.absolute_dir + @"\" + tc.bindir + @"\cstest.exe");

            return res;
        }

        void runTest(FileInfo fi, ref FileStream logFile, TestConfiguration tc)
        {
            nrTests++;

            Result res = execute(fi, tc);

            bool failed = false;
            string failed_str = "";

            // if (excode != 0 || errOut != Environment.NewLine || exhausted_time || exhausted_memory)
            if (res.exhaustedTime || res.exhaustedMemory)
            {
                failed = true;
                if (res.exhaustedTime)
                    failed_str = "Timeout";
                else if (res.exhaustedMemory)
                    failed_str = "Segmentation fault and/or memory exhausted";
                //else if (excode != 0)
                //{
                //  lsw.WriteLine("Z3 returned non-zero: ");
                //  lsw.WriteLine("return value: " + excode);
                //  lsw.WriteLine("stdout: " + stdOut);
                //  lsw.WriteLine("stderr: " + errOut);
                //}
                //else
                //{
                //  lsw.WriteLine("Z3 reported errors: ");
                //  lsw.WriteLine("return value: " + excode);
                //  lsw.WriteLine("stdout: " + stdOut);
                //  lsw.WriteLine("stderr: " + errOut);
                //}
            }
            else
            {
                string expectedFilename = fi.FullName.Substring(0, fi.FullName.Length - fi.Extension.Length) + ".expected.out";

                if (File.Exists(expectedFilename)) // if it doesn't exists that's okay...
                {
                    try
                    {
                        FileStream efs = new FileStream(expectedFilename, FileMode.Open, FileAccess.Read);
                        StreamReader esr = new StreamReader(efs);
                        string expectedOutput = esr.ReadToEnd() + Environment.NewLine;
                        esr.Close();
                        efs.Close();

                        if (expectedOutput != res.stdout)
                        {
                            failed = true;
                            failed_str = "Produced output does not match expected output:" + Environment.NewLine;
                            failed_str += "----------" + Environment.NewLine;
                            failed_str += "Actual output:" + Environment.NewLine;
                            failed_str += "----------" + Environment.NewLine;
                            failed_str += res.stdout;
                            failed_str += "----------" + Environment.NewLine;
                            failed_str += "Error output (stderr):" + Environment.NewLine;
                            failed_str += "----------" + Environment.NewLine;
                            failed_str += res.stderr;
                            failed_str += "----------" + Environment.NewLine;
                            failed_str += "Expected output:" + Environment.NewLine;
                            failed_str += "----------" + Environment.NewLine;
                            failed_str += expectedOutput;
                        }
                    }
                    catch (Exception ex)
                    {
                        failed = true;
                        failed_str = "Error comparing expected output: " + ex.Message;
                    }
                }
            }

            if (failed)
            {
                nrBugs++;
                StreamWriter lsw = new StreamWriter(logFile);

                lsw.WriteLine("-------------------------------------------------------------------------------");
                lsw.WriteLine("Test case failed: " + fi.FullName + " (configuration `" + tc.name + "')");
                lsw.Write(failed_str);
                lsw.WriteLine("-------------------------------------------------------------------------------");
                lsw.Flush();
                logFile.Flush();
            }
        }

        void runTests(DirectoryInfo di, TestConfiguration tc, ref FileStream logFile)
        {
            foreach (FileInfo file in di.GetFiles("*." + tc.type))
                runTest(file, ref logFile, tc);
        }

        void runTests(DateTime last_z3_time, DateTime last_tests_time, ref FileStream logFile)
        {
            foreach (List<TestConfiguration> tcs in c.testConfigs.Values)
            {
                foreach (TestConfiguration tc in tcs)
                {
                    // say("Running test configuration `" + tc.name + "'");
                    string absolute_exe = "";
                    bool have_new_binary = Z3Finder.findZ3(c.DROPDIR, tc.bindir, tc.bin, last_z3_time, ref absolute_exe);

                    if (absolute_exe == "")
                    {
                        say("Z3 NOT FOUND for `" + tc.name + "'");
                        continue;
                    }                    

                    tc.absolute_dir = absolute_exe.Substring(0, absolute_exe.Length - tc.bindir.Length - tc.bin.Length - 1);
                    bool have_new_tests = checkTestTime(tc.absolute_dir, last_tests_time);

                    if (have_new_binary || have_new_tests)
                    {                        
                        //say("found binary @ " + absolute_exe + " dated " + 
                        //    File.GetLastWriteTime(absolute_exe).ToString());

                        for (int i = 0; i < c.Directories.Count(); i++)
                        {
                            if (c.Directories[i].type == tc.type)
                            {
                                string cur = c.Directories[i].dir;
                                string curtype = c.Directories[i].type;
                                if (!Path.IsPathRooted(cur))
                                    cur = Path.GetFullPath(tc.absolute_dir + cur);

                                // say("Searching for tests at: " + cur);

                                DirectoryInfo di = new DirectoryInfo(cur);
                                runTests(di, tc, ref logFile);
                                foreach (DirectoryInfo sdi in di.GetDirectories())
                                    runTests(di, tc, ref logFile);
                            }
                        }
                    }
                    else
                    {
                        // say("No new binary or test files");
                    }
                }
            }            
        }

        void SendReport(DateTime d, string logFilename)
        {
            string msg = "Z3 Test Report for " + d.ToString() + Environment.NewLine + Environment.NewLine +
                    "Executed " + nrTests + " test cases and found " + nrBugs + " bugs.";
            if (nrBugs > 0)
                msg += Environment.NewLine  + Environment.NewLine + "Logfile attached.";

            Sendmail.send(c.Developers, "Z3 Test Report", msg, (nrBugs > 0) ? logFilename : null);
        }

        void run(string configFile)
        {
            c.load(configFile);

            DateTime last_z3_time, last_tests_time;

            if (File.Exists("last_check"))
            {
                last_z3_time = File.GetCreationTime("last_check");
                last_tests_time = last_z3_time;
                File.SetCreationTime("last_check", DateTime.Now);
            }
            else
            {
                File.Create("last_check");
                last_tests_time = new DateTime(1900, 1, 1);
                last_z3_time = new DateTime(1900, 1, 1);
            }

            DateTime d = DateTime.Now;
            string logFilename = "test-" + d.Year.ToString() + "-" +
                                           d.Month.ToString() + "-" +
                                           d.Day.ToString() + "_" +
                                           d.Hour.ToString() + "-" +
                                           d.Minute.ToString() + ".txt";
            //string logFilename = "test.log";
            FileStream logFile = File.Create(logFilename);

            // say("Logfile: " + logFilename);
            runTests(last_z3_time, last_tests_time, ref logFile);

            StreamWriter sw = new StreamWriter(logFile);
            sw.WriteLine("Executed " + nrTests + " test cases, reported " + nrBugs + " bugs.");
            sw.Flush();
            logFile.Flush();
            logFile.Close();

            SendReport(d, logFilename);

            try
            {
                File.Delete(logFilename);
            }
            catch
            {
                /* Ignore */
            }
        }

        static void Main(string[] args)
        {
            try
            {
                Program p = new Program();
                if (args.Length > 0)
                    p.run(args[0]);
                else
                    p.run("config.xml");
            }
            catch (Exception e)
            {
                say(DateTime.Now.ToString() + ": EXCEPTION: " + e.Message);
                say(e.StackTrace);
            }
        }
    }
}
