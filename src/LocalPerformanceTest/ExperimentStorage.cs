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

        private Table<ExperimentsTableRow> experimentsTable;


        private ExperimentStorage(string storageName)
        {
            dir = Directory.CreateDirectory(storageName);
            dirBenchmarks = dir.CreateSubdirectory("benchmarks");

            string tableFile = Path.Combine(dir.FullName, "experiments.csv");
            if (File.Exists(tableFile))
            {
                experimentsTable =
                    Table.OfRows( // FSharpFunc<Tuple<int, string>, FSharpOption<Type>>.
                        Table.Load(tableFile, new ReadSettings(Delimiter.Comma, true, true, None,
                            FSharpOption<FSharpFunc<Tuple<int, string>, FSharpOption<Type>>>.Some(FSharpFunc<Tuple<int, string>, FSharpOption<Type>>.FromConverter(tuple =>
                            {
                                var colName = tuple.Item2;
                                switch (colName)
                                {
                                    case "ID": return FSharpOption<Type>.Some(typeof(int));
                                    case "MemoryLimit": return FSharpOption<Type>.Some(typeof(int));
                                }
                                return FSharpOption<Type>.None;
                            }))))
                        .ToRows<ExperimentsTableRow>());
            }else
            {
                experimentsTable = Table.OfRows<ExperimentsTableRow>(new ExperimentsTableRow[0]);
            }
        }

        public static ExperimentStorage Open(string storageName)
        {
            return new ExperimentStorage(storageName);
        }

        public int MaxExperimentId
        {
            get
            {
                if (experimentsTable.RowsCount > 0)
                    return experimentsTable["ID"].Rows.AsInt.Max();
                else return 0;
            }
        }

        public void Add(int id, ExperimentDefinition experiment, BenchmarkResult[] benchmarks)
        {
            experimentsTable = experimentsTable.AddRow(new ExperimentsTableRow
            {
                ID = id,
                Executable = experiment.Executable,
                Version = GetVersion(experiment.Executable),
                Parameters = experiment.Parameters,
                BenchmarkContainer = experiment.BenchmarkContainer,
                BenchmarkFileExtension = experiment.BenchmarkFileExtension,
                Category = experiment.Category,
                BenchmarkTimeout = experiment.BenchmarkTimeout.TotalSeconds,
                ExperimentTimeout = experiment.ExperimentTimeout.TotalSeconds,
                MemoryLimit = (int)(experiment.MemoryLimit >> 20), // bytes to MB
                GroupName = experiment.GroupName,
                Note = experiment.Note,
            });
            Table.Save(experimentsTable, Path.Combine(dir.FullName, "experiments.csv"), new WriteSettings(Delimiter.Comma, true, true));
            SaveBenchmarks(Path.Combine(dirBenchmarks.FullName, id.ToString("000000") + ".csv"), benchmarks);
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

    public class ExperimentsTableRow
    {
        public int ID { get; set; }
        public string Executable { get; set; }
        public string Version { get; set; }
        public string Parameters { get; set; }
        public string BenchmarkContainer { get; set; }
        public string Category { get; set; }
        public string BenchmarkFileExtension { get; set; }
        /// <summary>
        /// MegaBytes.
        /// </summary>
        public int MemoryLimit { get; set; }
        /// <summary>
        /// Seconds.
        /// </summary>
        public double BenchmarkTimeout { get; set; }
        /// <summary>
        /// Seconds.
        /// </summary>
        public double ExperimentTimeout { get; set; }
        public string Note { get; set; }
        public string GroupName { get; set; }
    }
}
