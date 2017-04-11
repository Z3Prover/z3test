using PerformanceTest;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Measure
{
    class Program
    {
        static int Main(string[] args)
        {
            if (args.Length != 5)
            {
                Console.WriteLine("Use: Measure.exe <executable> <arguments> <benchmarkContainer> <category> <extension>");
                return 2;
            }

            TimeSpan timeout = TimeSpan.FromHours(1);
            ExperimentDefinition definition = ExperimentDefinition.Create(args[0], args[2], args[4], args[1], timeout, category: args[3]);

            string version = GetVersion(args[0]);
            Print(String.Format("\n\nMeasuring performance of {0} {1}...\n", args[0], version));

            ExperimentManager manager = new LocalExperimentManager();
            int expId = Run(manager, definition).Result;

            Save(manager, expId).Wait();

            return 0;
        }

        static async Task<int> Run(ExperimentManager manager, ExperimentDefinition definition)
        {
            int id = await manager.StartExperiment(definition);
            var results = manager.Results(id);

            var print = results.Select(task => task.ContinueWith(benchmark => PrintBenchmark(benchmark.Result))).ToArray();
            await Task.WhenAll(print);
            return id;
        }


        private static async Task Save(ExperimentManager manager, int expId)
        {
            ExperimentStorage storage = ExperimentStorage.Open("measure");
            ExperimentDefinition experiment = await manager.GetExperiment(expId);
            BenchmarkResult[] benchmarks = await manager.AllResults(expId);
            storage.Save(expId, experiment, benchmarks);
        }



        static void PrintBenchmark(BenchmarkResult result)
        {
            string info = String.Format("{1:0.0000}\t{2:0.00} MB\t{0}",
                result.BenchmarkFileName, result.NormalizedRuntime, result.Measurements.PeakMemorySize >> 20);

            if (result.Measurements.Status == Measurement.Measure.CompletionStatus.Success)
            {
                Print("Passed   " + info);
            }
            else if (result.Measurements.Status == Measurement.Measure.CompletionStatus.OutOfMemory)
            {
                PrintError("Out of memory    " + info);
            }
            else if (result.Measurements.Status == Measurement.Measure.CompletionStatus.Error)
            {
                PrintError("Error    " + info);
            }
            else if (result.Measurements.Status == Measurement.Measure.CompletionStatus.Timeout)
            {
                PrintError("Timeout    " + info);
            }
        }


        static void Print(string s)
        {
            Console.WriteLine(s);
        }

        static void PrintError(string s)
        {
            var color = Console.ForegroundColor;
            Console.ForegroundColor = ConsoleColor.Red;
            Console.WriteLine(s);
            Console.ForegroundColor = color;
        }


        private static string GetVersion(string pathToExe)
        {
            var versionInfo = FileVersionInfo.GetVersionInfo(pathToExe);
            return versionInfo.ProductVersion;
        }
    }
}
