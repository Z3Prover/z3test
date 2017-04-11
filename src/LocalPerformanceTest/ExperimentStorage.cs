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


        public static ExperimentStorage Open(string storageName)
        {
            return new ExperimentStorage(storageName);
        }



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
            }
            else
            {
                experimentsTable = Table.OfRows<ExperimentsTableRow>(new ExperimentsTableRow[0]);
            }
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

        public ExperimentsTableRow[] GetExperiments()
        {
            return experimentsTable.Rows.ToArray();
        }


        public BenchmarkResult[] GetResults(int experimentId)
        {
            var bt = Table.Load(IdToTableName(experimentId), new ReadSettings(Delimiter.Comma, true, true, None,
                FSharpOption<FSharpFunc<Tuple<int, string>, FSharpOption<Type>>>.Some(FSharpFunc<Tuple<int, string>, FSharpOption<Type>>.FromConverter(tuple =>
                {
                    var colName = tuple.Item2;
                    switch (colName)
                    {
                        case "PeakMemorySize":
                        case "ExitCode": return FSharpOption<Type>.Some(typeof(int));
                    }
                    return FSharpOption<Type>.None;
                }))))
                .ToRows<BenchmarkTableRow>();
            return bt.Select(row =>
                new BenchmarkResult(experimentId, row.BenchmarkFileName, row.WorkerInformation, row.NormalizedRuntime, row.AcquireTime,
                    new ProcessRunMeasure(TimeSpan.FromSeconds(row.TotalProcessorTime), TimeSpan.FromSeconds(row.WallClockTime), row.PeakMemorySize << 20,
                        StatusFromString(row.Status), row.ExitCode, AsStream(row.StdOut), AsStream(row.StdErr)))
                ).ToArray();
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
            SaveBenchmarks(IdToTableName(id), benchmarks);
        }

        private string IdToTableName(int id)
        {
            return Path.Combine(dirBenchmarks.FullName, id.ToString("000000") + ".csv");
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
                Column.Create("Status", benchmarks.Select(b => StatusAsString(b.Measurements.Status)), None),
                Column.Create("ExitCode", benchmarks.Select(b => b.Measurements.ExitCode), None),
                Column.Create("StdOut", benchmarks.Select(b => b.Measurements.OutputToString()), None),
                Column.Create("StdErr", benchmarks.Select(b => b.Measurements.ErrorToString()), None),
                Column.Create("WorkerInformation", benchmarks.Select(b => b.WorkerInformation), None),
            });
            Table.Save(table, fileName, new WriteSettings(Delimiter.Comma, true, true));
        }

        private static string StatusAsString(Measure.CompletionStatus status)
        {
            return status.ToString();
        }

        private Measure.CompletionStatus StatusFromString(string status)
        {
            return (Measure.CompletionStatus)Enum.Parse(typeof(Measure.CompletionStatus), status);
        }

        private static string GetVersion(string pathToExe)
        {
            var versionInfo = FileVersionInfo.GetVersionInfo(pathToExe);
            return versionInfo.ProductVersion;
        }


        private static Stream AsStream(string s)
        {
            byte[] byteArray = Encoding.UTF8.GetBytes(s);
            MemoryStream stream = new MemoryStream(byteArray);
            stream.Position = 0;
            return stream;
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

    public class BenchmarkTableRow
    {
        public string BenchmarkFileName { get; set; }
        public DateTime AcquireTime { get; set; }
        public double NormalizedRuntime { get; set; }
        public double TotalProcessorTime { get; set; }
        public double WallClockTime { get; set; }
        public int PeakMemorySize { get; set; }
        public string Status { get; set; }
        public int ExitCode { get; set; }

        public string StdOut { get; set; }
        public string StdErr { get; set; }
        public string WorkerInformation { get; set; }

    }
}
