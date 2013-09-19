using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using System.Threading;
using System.Diagnostics;

namespace runlib
{
    public class Executor
    {
        private string _binary = null;
        private ulong _output_limit = ulong.MaxValue;
        private ulong _error_limit = ulong.MaxValue;
        private string[] _args = null;
        private ulong _time_limit = uint.MaxValue; /* in seconds */
        private ulong _memory_limit = 0; /* in bytes; 0 = no limit */

        public Executor(string binary, string[] args,
                         ulong time_limit = ulong.MaxValue,
                         ulong memory_limit = 0,
                         ulong output_limit = ulong.MaxValue,
                         ulong error_limit = ulong.MaxValue)
        {
            _binary = binary;
            _args = args;
            _time_limit = time_limit;
            _memory_limit = memory_limit;
            _output_limit = output_limit;
            _error_limit = error_limit;
        }

        private TimeSpan Time(Process p)
        {
            // Wallclock time
            //return DateTime.Now - p.StartTime;

            // Process time
            return p.TotalProcessorTime;

            // Complicated multi-process time. Note that sub-processes may be unavailable after the main process has exited. 
            //TimeSpan r = new TimeSpan(0);            
            //foreach (Process cp in Process.GetProcessesByName(p.ProcessName))
            //    r += cp.TotalProcessorTime;
            //return r;
        }

        private ulong Memory(Process p)
        {
            return (ulong) p.PeakVirtualMemorySize64;

            //ulong r = 0;

            //foreach (Process cp in Process.GetProcessesByName(p.ProcessName))
            //    try
            //    {
            //        r += (ulong)cp.PeakVirtualMemorySize64;
            //    }
            //    catch
            //    {
            //        // Ignore; could be access is denied
            //    }

            //return r;
        }

        private void Kill(Process p)
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

        private void WriteToStream(object sender, DataReceivedEventArgs args, StreamWriter stream, ref ulong limit)
        {
            try
            {
                if (limit > 0 && args != null && args.Data != null)
                {
                    stream.WriteLine(args.Data);
                    limit -= (ulong) args.Data.Length;
                }
            }
            catch (System.NullReferenceException)
            {
                // That's okay, let's just discared the output.
            }
        }

        public Result Execute()
        {
            try
            {
                Result r = new Result();

                StreamWriter out_writer = new StreamWriter(r.stdout);
                StreamWriter err_writer = new StreamWriter(r.stderr);

                Process p = new Process();
                p.StartInfo.FileName = _binary;
                p.StartInfo.WorkingDirectory = Directory.GetCurrentDirectory();
                p.StartInfo.Arguments = "";
                for (int i = 0; i < _args.Length; i++)
                    p.StartInfo.Arguments += _args[i] + " ";
                p.StartInfo.CreateNoWindow = true;
                p.StartInfo.RedirectStandardOutput = true;
                p.StartInfo.RedirectStandardError = true;
                p.StartInfo.UseShellExecute = false;

                p.OutputDataReceived += (sender, args) => WriteToStream(sender, args, out_writer, ref _output_limit);
                p.ErrorDataReceived += (sender, args) => WriteToStream(sender, args, err_writer, ref _error_limit);
                bool exhausted_time = false, exhausted_memory = false, exhausted_output = false;

                // if (binary_fn.EndsWith(".cmd") || binary_fn.EndsWith(".bat"))
                {
                    p.StartInfo.FileName = @"C:\Windows\System32\cmd.exe";
                    p.StartInfo.Arguments = "/c " + _binary + " " + p.StartInfo.Arguments;
                }

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
                            if (Time(p).TotalSeconds >= _time_limit)
                            {
                                // Console.WriteLine("Job timed out; killing.");
                                exhausted_time = true;
                                Kill(p);
                            }
                            else if (_memory_limit != 0 && Memory(p) > _memory_limit)
                            {
                                // Console.WriteLine("Job uses too much memory; killing ({0}).", Memory(p));
                                exhausted_memory = true;
                                Kill(p);
                            }
                            else if (_output_limit <= 0 || _error_limit <= 0)
                            {
                                // Console.WriteLine("Job produced too much output; killing.");
                                exhausted_output = true;
                                Kill(p);                                
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
                double runtime = (exhausted_time ? _time_limit : Time(p).TotalSeconds);

                p.Close();

                Thread.Sleep(500); // Give the asynch stdout/stderr events a chance to finish.

                out_writer.Flush();
                err_writer.Flush();

                r.status = ((exhausted_time) ? "TIME" : (exhausted_memory) ? "MEMORY" : (exhausted_output) ? "OUTPUT" : "OK");
                if (r.status == "OK") r.return_value = excode;
                r.runtime = runtime;
                return r;
            }
            catch (Exception ex)
            {
                Console.WriteLine("EXCEPTION: {0}", ex.Message);
                return null;
            }
        }
    }
}
