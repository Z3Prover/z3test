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


            ExperimentStorage storage = ExperimentStorage.Open("measure");
            LocalExperimentManager manager = new LocalExperimentManager(storage);
            
            int expId = Run(manager, definition).Result;
            

            Save(storage, manager, expId).Wait();


            return 0;
        }

        static async Task<int> Run(LocalExperimentManager manager, ExperimentDefinition definition)
        {
            int id = await manager.StartExperiment(definition);
            var results = manager.Results(id);
            
            var history = await manager.GetExperiments(definition.BenchmarkContainer, definition.Category, definition.Executable, definition.Parameters);
            var last = history.OrderByDescending(e => e.ID).FirstOrDefault();
            Dictionary<string, BenchmarkResult> lastBenchmarks = new Dictionary<string, BenchmarkResult>();
            if (last != null)
            {
                var lastResults = await manager.GetExperimentResults(last.ID);
                foreach(var b in lastResults)
                {
                    lastBenchmarks[b.BenchmarkFileName] = b;
                }
            }

            var print = results.Select(task => task.ContinueWith(benchmark =>
                {
                    BenchmarkResult lastBenchmark = null;
                    lastBenchmarks.TryGetValue(benchmark.Result.BenchmarkFileName, out lastBenchmark);
                    if (lastBenchmark != null && lastBenchmark.Measurements.Status != Measurement.Measure.CompletionStatus.Success)
                        lastBenchmark = null;
                    PrintBenchmark(benchmark.Result, lastBenchmark);
                })).ToArray();
            await Task.WhenAll(print);


            return id;
        }


        private static async Task Save(ExperimentStorage storage, ExperimentManager manager, int expId)
        {            
            ExperimentDefinition experiment = await manager.GetExperiment(expId);
            BenchmarkResult[] benchmarks = await manager.AllResults(expId);
            storage.Add(expId, experiment, benchmarks);
        }



        static void PrintBenchmark(BenchmarkResult result, BenchmarkResult lastResult = null)
        {
            string info;
            double speedup = 1.0;
            double extraMem = 1.0;
            double threshold = 0.15;

            if (lastResult == null)
                info = String.Format("{1:0.0000}\t{2:0.00} MB\t{0}",
                    result.BenchmarkFileName, result.NormalizedRuntime, result.Measurements.PeakMemorySize >> 20);
            else
            {
                speedup = (lastResult.NormalizedRuntime / result.NormalizedRuntime);
                extraMem = (result.Measurements.PeakMemorySize - lastResult.Measurements.PeakMemorySize) >> 20;
                info = String.Format("{0:0.0000} ({1:0.00}{2})\t{3:0.00} MB ({4}{5:0.00})\t{6}",
                        result.NormalizedRuntime, 
                        speedup,
                        speedup == 1 ? " same" : speedup > 1 ? " faster" : " slower",
                        result.Measurements.PeakMemorySize >> 20,
                        extraMem >= 0 ? "+" : "",
                        extraMem,
                        result.BenchmarkFileName);
                extraMem = ((double)result.Measurements.PeakMemorySize) / lastResult.Measurements.PeakMemorySize;
            }


            if (result.Measurements.Status == Measurement.Measure.CompletionStatus.Success)
            {
                if(speedup < 1 - threshold)
                    PrintWarning("Slower   " + info);                
                else if(extraMem > 1 + threshold)
                    PrintWarning("More memory   " + info);
                else if (speedup > 1 + threshold)
                    PrintNotice("Faster   " + info);
                else if (extraMem < 1 - threshold)
                    PrintNotice("Less memory   " + info);
                else 
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


        static void PrintWarning(string s)
        {
            var color = Console.ForegroundColor;
            Console.ForegroundColor = ConsoleColor.Yellow;
            Console.WriteLine(s);
            Console.ForegroundColor = color;
        }

        static void PrintNotice(string s)
        {
            var color = Console.ForegroundColor;
            Console.ForegroundColor = ConsoleColor.Green;
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
