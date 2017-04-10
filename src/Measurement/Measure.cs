using System;
using System.Collections.Generic;
using System.IO;

namespace Measurement
{    
    public class Measure
    {
        public Measure(TimeSpan totalProcessorTime, TimeSpan wallClockTime, long peakMemorySize, CompletionStatus status)
        {
            TotalProcessorTime = totalProcessorTime;
            WallClockTime = wallClockTime;
            PeakMemorySize = peakMemorySize;
            Status = status;
        }

        public TimeSpan TotalProcessorTime { get; private set; }
        public TimeSpan WallClockTime { get; private set; }

        /// <summary>
        /// Gets the maximum amount of virtual memory, in bytes, allocated for the process.
        /// </summary>
        public long PeakMemorySize { get; private set; }

        public CompletionStatus Status { get; private set; }

        public enum CompletionStatus
        {
            Success,
            OutOfMemory,
            Timeout,
            Error
        }
    }

    public class ProcessRunMeasure : Measure
    {
        public ProcessRunMeasure(TimeSpan totalProcessorTime, TimeSpan wallClockTime, long peakMemorySize, CompletionStatus status, int exitCode, Stream stdOut, Stream stdErr) :
            base(totalProcessorTime, wallClockTime, peakMemorySize, status)
        {
            ExitCode = exitCode;
            StdOut = stdOut;
            StdErr = stdErr;
        }

        public int ExitCode { get; private set; }
        public Stream StdOut { get; private set; }
        public Stream StdErr { get; private set; }

        public string OutputToString()
        {
            StreamReader r = new StreamReader(StdOut);
            string s = r.ReadToEnd();
            StdOut.Position = 0L;
            return s;
        }
    }
}
