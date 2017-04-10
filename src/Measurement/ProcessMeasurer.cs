using System;
using System.Diagnostics;
using System.IO;
using System.Threading;

namespace Measurement
{

    public static class ProcessMeasurer
    {
        /// <summary>
        /// Starts and measures performance of an executable file or a script.
        /// </summary>
        /// <param name="fileName">An executable file name or cmd file or bat file.</param>
        /// <param name="arguments"></param>
        /// <param name="timeout"></param>
        /// <param name="memoryLimit">Maximum allowed memory use for the process (bytes).</param>
        /// <param name="outputLimit">Maximum length of the process standard output stream (characters).</param>
        /// <param name="errorLimit">Maximum length of the process standard error stream (characters).</param>
        /// <returns></returns>
        public static ProcessRunMeasure Measure(string fileName, string arguments, TimeSpan timeout, long? memoryLimit = null, long? outputLimit = null, long? errorLimit = null)
        {
            var stdOut = new MemoryStream();
            var stdErr = new MemoryStream();
            StreamWriter out_writer = new StreamWriter(stdOut);
            StreamWriter err_writer = new StreamWriter(stdErr);
            long out_lim = outputLimit ?? long.MaxValue;
            long err_lim = errorLimit ?? long.MaxValue;

            Process p = StartProcess(fileName, arguments,
                output => WriteToStream(output, out_writer, ref out_lim),
                error => WriteToStream(error, err_writer, ref err_lim));

            long maxmem = 0L;
            bool exhausted_time = false, exhausted_memory = false;

            try
            {
                do
                {
                    p.Refresh();
                    if (!p.HasExited)
                    {
                        long m = Memory(p);
                        maxmem = Math.Max(maxmem, m);

                        TimeSpan wc = DateTime.Now - p.StartTime;
                        if (wc >= timeout)
                        {
                            Trace.WriteLine("Process timed out; killing.");
                            exhausted_time = true;
                            Kill(p);
                        }
                        else if (memoryLimit.HasValue && m > memoryLimit.Value)
                        {
                            Trace.WriteLine("Process uses too much memory; killing.");
                            exhausted_memory = true;
                            Kill(p);
                        }
                        else if (out_lim <= 0 || err_lim <= 0)
                        {
                            Trace.WriteLine("Process produced too much output; killing.");
                            Kill(p);
                            throw new Exception("Process produced too much output.");
                        }
                    }
                }
                while (!p.WaitForExit(500));
            }
            catch (InvalidOperationException ex)
            {
                Trace.WriteLine("Invalid Operation: " + ex.Message);
                Trace.WriteLine("Assuming process has ended.");
            }

            p.WaitForExit();

            maxmem = Math.Max(maxmem, Memory(p));
            TimeSpan processorTime = exhausted_time ? timeout : p.TotalProcessorTime;
            TimeSpan wallClockTime = exhausted_time ? timeout : (DateTime.Now - p.StartTime);
            int exitCode = p.ExitCode;        

            p.Close();

            Thread.Sleep(500); // Give the asynch stdout/stderr events a chance to finish.
            out_writer.Flush();
            err_writer.Flush();

            stdOut.Seek(0, SeekOrigin.Begin);
            stdErr.Seek(0, SeekOrigin.Begin);

            return new ProcessRunMeasure(
                processorTime,
                wallClockTime,
                maxmem,
                exhausted_time ? Measurement.Measure.CompletionStatus.Timeout : 
                    exhausted_memory ? Measurement.Measure.CompletionStatus.OutOfMemory :
                        exitCode != 0 && exitCode != 1 ? Measurement.Measure.CompletionStatus.Error : // For F*, a return value of 1 is still ok.
                            Measurement.Measure.CompletionStatus.Success,
                exitCode,
                stdOut,
                stdErr);
        }

        private static Process StartProcess(string fileName, string arguments, Action<string> stdOut, Action<string> stdErr)
        {
            Process p = new Process();
            p.StartInfo.FileName = fileName;
            p.StartInfo.Arguments = arguments;
            p.StartInfo.CreateNoWindow = true;
            p.StartInfo.RedirectStandardOutput = true;
            p.StartInfo.RedirectStandardError = true;
            p.StartInfo.UseShellExecute = false;
            p.OutputDataReceived += (sender, args) => { if (args != null && args.Data != null) stdOut(args.Data); };
            p.ErrorDataReceived += (sender, args) => { if (args != null && args.Data != null) stdErr(args.Data); };
            
            if (fileName.EndsWith(".cmd") || fileName.EndsWith(".bat"))
            {
                p.StartInfo.FileName = System.IO.Path.Combine(Environment.SystemDirectory, "cmd.exe");
                p.StartInfo.Arguments = "/c " + fileName + " " + p.StartInfo.Arguments;
            }

            bool retry;
            do
            {
                retry = false;
                try
                {
                    p.Start();
                    p.BeginOutputReadLine();
                    p.BeginErrorReadLine();
                    p.ProcessorAffinity = (IntPtr)1L;
                    p.PriorityClass = ProcessPriorityClass.RealTime;
                }
                catch (System.ComponentModel.Win32Exception ex)
                {
                    if (ex.Message == "The process cannot access the file because it is being used by another process")
                    {
                        Trace.WriteLine("Retrying to execute command...");
                        Thread.Sleep(500);
                        retry = true;
                    }
                    else throw ex;
                }
            } while (retry);

            return p;
        }

        private static void Kill(Process p)
        {
            bool retry;
            do
            {
                retry = false;
                try
                {
                    if (!p.HasExited) p.Kill();
                    //foreach (Process cp in Process.GetProcessesByName(p.ProcessName))
                    //    if(!cp.HasExited) cp.Kill();
                }
                catch
                {
                    Thread.Sleep(100);
                    retry = true; // could be access denied or similar
                }
            } while (retry);
        }

        private static void WriteToStream(string text, StreamWriter stream, ref long limit)
        {
            try
            {
                if (limit > 0 && text != null)
                {
                    stream.WriteLine(text);
                    limit -= text.Length;
                }
            }
            catch (System.NullReferenceException)
            {
                // That's okay, let's just discard the output.
            }
        }

        private static long Memory(Process p)
        {
            long r = 0;

            //foreach (Process cp in Process.GetProcessesByName(p.ProcessName))
            //    try { r += cp.PeakVirtualMemorySize64; } catch { /* OK */ }
            r = p.PeakVirtualMemorySize64;

            return r;
        }

        private static TimeSpan Time(Process p, bool wallclock)
        {
            if (wallclock)
                return DateTime.Now - p.StartTime;
            else
                return p.TotalProcessorTime;
        }

    }
}
