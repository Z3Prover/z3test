using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Angara.Data;
using Angara.Data.DelimitedFile;
using System.Diagnostics;
using Microsoft.FSharp.Core;
using Measurement;

namespace PerformanceTest
{
    public class ExperimentStorage
    {
        private static FSharpOption<int> None = FSharpOption<int>.None;

        private readonly DirectoryInfo dir;
        private readonly DirectoryInfo dirBenchmarks;


        private ExperimentStorage(string storageName)
        {
            dir = Directory.CreateDirectory(storageName);
            dirBenchmarks = dir.CreateSubdirectory("benchmarks");
        }

        public static ExperimentStorage Open(string storageName)
        {
            return new ExperimentStorage(storageName);
        }

        public void Save(int id, ExperimentDefinition experiment, BenchmarkResult[] benchamrks)
        {
            var table = Table.OfColumns(new []
            {
                Column.CreateFromUntyped("ID", new [] { id }),
                Column.CreateFromUntyped("Executable", new [] { experiment.Executable }),
                Column.CreateFromUntyped("Version", new [] { GetVersion(experiment.Executable) }),
                Column.CreateFromUntyped("Parameters", new [] { experiment.Parameters }),
                Column.CreateFromUntyped("BenchmarkContainer", new [] { experiment.BenchmarkContainer }),
                Column.CreateFromUntyped("Category", new [] { experiment.Category }),
                Column.CreateFromUntyped("BenchmarkFileExtension", new [] { experiment.BenchmarkFileExtension }),
                Column.CreateFromUntyped("MemoryLimit", new [] { (int)experiment.MemoryLimit }),
                Column.CreateFromUntyped("BenchmarkTimeout", new [] { experiment.BenchmarkTimeout.TotalSeconds }),
                Column.CreateFromUntyped("ExperimentTimeout", new [] { experiment.ExperimentTimeout.TotalSeconds }),
                Column.CreateFromUntyped("ExperimentPriority", new [] { experiment.ExperimentPriority }),
                Column.CreateFromUntyped("Note", new [] { experiment.Note }),
                Column.CreateFromUntyped("GroupName", new [] { experiment.GroupName })
            });
            Table.Save(table, Path.Combine(dir.FullName, "experiments.csv"), new WriteSettings(Delimiter.Comma, true, true));

            
            SaveBenchmarks(Path.Combine(dirBenchmarks.FullName, id.ToString("000000") + ".csv"), benchamrks);
        }

        private void SaveBenchmarks(string fileName, BenchmarkResult[] benchmarks)
        {
            var table = Table.OfColumns(new[]
            {
                Column.Create("BenchmarkFileName", benchmarks.Select(b => b.BenchmarkFileName), None),
                Column.Create("AcquireTime", benchmarks.Select(b => b.AcquireTime), None),
                Column.Create("NormalizedRuntime", benchmarks.Select(b => b.NormalizedRuntime), None),
                Column.Create("TotalProcessorTime", benchmarks.Select(b => b.Measurements.TotalProcessorTime.TotalSeconds), None),
                Column.Create("WallClockTime", benchmarks.Select(b => b.Measurements.WallClockTime.TotalSeconds), None),
                Column.Create("PeakMemorySize", benchmarks.Select(b => (int)(b.Measurements.PeakMemorySize >> 20)), None),
                Column.Create("Status", benchmarks.Select(b => AsString(b.Measurements.Status)), None),
                Column.Create("ExitCode", benchmarks.Select(b => b.Measurements.ExitCode), None),
                Column.Create("StdOut", benchmarks.Select(b => b.Measurements.OutputToString()), None),
                Column.Create("StdErr", benchmarks.Select(b => b.Measurements.ErrorToString()), None),
                Column.Create("WorkerInformation", benchmarks.Select(b => b.WorkerInformation), None),
            });
            Table.Save(table, fileName, new WriteSettings(Delimiter.Comma, true, true));
        }

        private static string AsString(Measure.CompletionStatus status)
        {
            switch (status)
            {
                case Measure.CompletionStatus.Success: return "success";
                case Measure.CompletionStatus.OutOfMemory: return "out-of-memory";
                case Measure.CompletionStatus.Timeout: return "timeout";
                case Measure.CompletionStatus.Error: return "error";
                default: return "unknown";
            }
        }

        private static string GetVersion(string pathToExe)
        {
            var versionInfo = FileVersionInfo.GetVersionInfo(pathToExe);
            return versionInfo.ProductVersion;
        }
    }
}
