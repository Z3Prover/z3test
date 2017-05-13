using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using PerformanceTest;
using System.Threading.Tasks;
using Measurement;
using System.Diagnostics;
using System.IO;

namespace UnitTests
{
    [TestClass]
    public class ProcessMeasurerTests
    {
        [TestMethod]
        public void MeasureProcessRun()
        {
            Measurement.ProcessRunMeasure m = ProcessMeasurer.Measure("Delay.exe", "100", TimeSpan.FromMilliseconds(1000));

            Assert.AreEqual(0, m.ExitCode, "Exit code");
            Assert.AreEqual(Measure.CompletionStatus.Success, m.Status);
            Assert.IsTrue(m.PeakMemorySize > 1024 * 1024, "Memory size seems too low");


            var ptime = m.TotalProcessorTime.TotalMilliseconds;
            var wctime = m.WallClockTime.TotalMilliseconds;
            Assert.IsTrue(ptime <= 1000 && wctime >= ptime, "Total processor time must be very small because Delay.exe mostly sleeps but it is " + ptime);
            Assert.IsTrue(wctime >= 100 && wctime <= 200, "Wall-clock time must be greater than given delay");

            StreamReader reader = new StreamReader(m.StdOut);
            string output = reader.ReadToEnd();
            Assert.IsTrue(output.Contains("Done."), "Output must contain certain text.");

            reader = new StreamReader(m.StdErr);
            string error = reader.ReadToEnd();
            Assert.IsTrue(error.Contains("Sample error text."), "Error output must contain certain text.");
        }

        [TestMethod]
        public void MeasureProcessRunWithTimeout()
        {
            Measurement.ProcessRunMeasure m = ProcessMeasurer.Measure("Delay.exe", "10000", TimeSpan.FromMilliseconds(100));

            Assert.AreEqual(Measure.CompletionStatus.Timeout, m.Status);
            Assert.AreEqual(-1, m.ExitCode, "Exit code");
            Assert.IsTrue(m.PeakMemorySize > 1024 * 1024, "Memory size seems too low");


            var ptime = m.TotalProcessorTime.TotalMilliseconds;
            var wctime = m.WallClockTime.TotalMilliseconds;
            Assert.IsTrue(ptime > 15 && ptime <= 100, "Total processor time");
            Assert.IsTrue(wctime >= 100 && wctime <= 500, "Wall-clock time must be greater than given timeout");

            StreamReader reader = new StreamReader(m.StdOut);
            string output = reader.ReadToEnd();
            Assert.IsTrue(output.Contains("Starting"), "Output must contain certain text.");

            reader = new StreamReader(m.StdErr);
            string error = reader.ReadToEnd();
            Assert.IsTrue(String.IsNullOrEmpty(error), "Error output");
        }

        [TestMethod]
        public void MeasureProcessExitCode()
        {
            Measurement.ProcessRunMeasure m = ProcessMeasurer.Measure("Delay.exe", "10000 extraArgument", TimeSpan.FromMilliseconds(10000));

            Assert.AreEqual(Measure.CompletionStatus.Error, m.Status);
            Assert.AreEqual(42, m.ExitCode, "Exit code");
            Assert.IsTrue(m.PeakMemorySize > 1024 * 1024, "Memory size seems too low");


            var ptime = m.TotalProcessorTime.TotalMilliseconds;
            var wctime = m.WallClockTime.TotalMilliseconds;
            Assert.IsTrue(ptime > 0 && ptime <= 100, "Total processor time");
            Assert.IsTrue(wctime > 0 && wctime <= 10000, "Wall-clock time must be greater than given timeout");

            StreamReader reader = new StreamReader(m.StdOut);
            string output = reader.ReadToEnd();
            Assert.IsTrue(output.Contains("Use: Delay.exe"), "Output must contain certain text.");

            reader = new StreamReader(m.StdErr);
            string error = reader.ReadToEnd();
            Assert.IsTrue(String.IsNullOrEmpty(error), "Error output");
        }

        [TestMethod]
        public void MeasureProcessThrowsException()
        {
            Measurement.ProcessRunMeasure m = ProcessMeasurer.Measure("FailingTool.exe", "arg1 arg2", TimeSpan.FromMilliseconds(10000));

            Assert.AreEqual(Measure.CompletionStatus.Error, m.Status);
            Assert.IsTrue(m.ExitCode < 0, "Exit code");
            Assert.IsTrue(m.PeakMemorySize > 1024 * 1024, "Memory size seems too low");


            var ptime = m.TotalProcessorTime.TotalMilliseconds;
            var wctime = m.WallClockTime.TotalMilliseconds;
            Assert.IsTrue(ptime <= 100, "Total processor time");
            Assert.IsTrue(wctime <= 10000, "Wall-clock time");

            StreamReader reader = new StreamReader(m.StdOut);
            string output = reader.ReadToEnd();
            reader = new StreamReader(m.StdErr);
            string error = reader.ReadToEnd();

            Assert.IsTrue(String.IsNullOrEmpty(output), "Output");
            Assert.IsTrue(error.Contains("Unhandled Exception"), "Error must contain certain text.");
        }

        [TestMethod]
        public void MeasureProcessOutOfMemory()
        {
            Measurement.ProcessRunMeasure m = ProcessMeasurer.Measure("FailingTool.exe", "out-of-memory", TimeSpan.FromMinutes(10));

            Assert.AreEqual(Measure.CompletionStatus.Error, m.Status);
            Assert.IsTrue(m.ExitCode < 0, "Exit code");
            Assert.IsTrue(m.PeakMemorySize > 1 << 20, "Memory size seems too low");


            var ptime = m.TotalProcessorTime.TotalMilliseconds;
            var wctime = m.WallClockTime.TotalMilliseconds;
            Assert.IsTrue(ptime <= 100000, "Total processor time");
            Assert.IsTrue(wctime <= 100000, "Wall-clock time");

            StreamReader reader = new StreamReader(m.StdOut);
            string output = reader.ReadToEnd();
            reader = new StreamReader(m.StdErr);
            string error = reader.ReadToEnd();

            Assert.IsTrue(output.Contains("i = 0"), "Output");
            Assert.IsTrue(error.Contains("OutOfMemoryException"), "Error must contain certain text.");
        }
    }
}
