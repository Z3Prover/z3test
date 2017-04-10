using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Collections.Concurrent;
using System.Threading.Tasks;
using System.IO;

using ExperimentID = System.Int32;
using System.Threading;
using System.Threading.Tasks.Schedulers;
using System.Diagnostics;
using Measurement;

namespace PerformanceTest
{
    public class LocalExperimentManager : ExperimentManager
    {
        private readonly ConcurrentDictionary<ExperimentID, ExperimentInstance> experiments;
        private readonly LocalExperimentRunner runner;

        private int nextId = 0;

        public LocalExperimentManager()
        {
            experiments = new ConcurrentDictionary<ExperimentID, ExperimentInstance>();
            runner = new LocalExperimentRunner();
        }


        public override Task<BenchmarkResult[]> GetExperimentResults()
        {
            throw new NotImplementedException();
        }

        public override Task<ExperimentStatus[]> GetExperiments(bool showProgress, string categoryFilter = null, string noteFilter = null, string creatorFilter = null)
        {
            throw new NotImplementedException();
        }

        public override Task<Group[]> GetGroups()
        {
            throw new NotImplementedException();
        }

        public override Task<ExperimentID> StartExperiment(ExperimentDefinition definition)
        {
            ExperimentID id = Interlocked.Increment(ref nextId);

            var results = runner.Enqueue(id, definition);
            ExperimentInstance experiment = new ExperimentInstance(id, definition, results);
            experiments[id] = experiment;

            return Task.FromResult(id);
        }

        public override Task<BenchmarkResult[]> Result(int experimentId)
        {
            ExperimentInstance experiment;
            if (experiments.TryGetValue(experimentId, out experiment))
            {
                return experiment.Results;
            }
            else throw new ArgumentException("Experiment not found");
        }
    }

    public class LocalExperimentRunner
    {
        private readonly LimitedConcurrencyLevelTaskScheduler scheduler;
        private readonly TaskFactory factory;

        public LocalExperimentRunner()
        {
            scheduler = new LimitedConcurrencyLevelTaskScheduler(1);
            factory = new TaskFactory(scheduler);
        }

        public Task<BenchmarkResult[]> Enqueue(ExperimentID id, ExperimentDefinition experiment)
        {
            if (experiment == null) throw new ArgumentNullException("experiment");

            Task<BenchmarkResult[]> task = factory.StartNew(_state => RunExperiment(id, (ExperimentDefinition)_state),
                (object)experiment, TaskCreationOptions.LongRunning);
            return task;
        }

        private static BenchmarkResult[] RunExperiment(ExperimentID id, ExperimentDefinition experiment)
        {
            if (!File.Exists(experiment.Executable)) throw new ArgumentException("Executable not found");

            var workerInfo = GetWorkerInfo();


            string benchmarkFolder = string.IsNullOrEmpty(experiment.Category) ? experiment.BenchmarkContainer : Path.Combine(experiment.BenchmarkContainer, experiment.Category);
            var benchmarks = Directory.EnumerateFiles(benchmarkFolder, "*." + experiment.BenchmarkFileExtension, SearchOption.AllDirectories).ToArray();

            BenchmarkResult[] results = new BenchmarkResult[benchmarks.Length]; 
            for (int i = 0; i < benchmarks.Length; i++)
            {
                string benchmark = benchmarks[i];
                Trace.WriteLine("Running benchmark " + Path.GetFileName(benchmark));

                string args = experiment.Parameters;
                if(args != null)
                {
                    args = args.Replace("{0}", benchmark);
                }

                DateTime acq = DateTime.Now;
                var m = ProcessMeasurer.Measure(experiment.Executable, args, experiment.BenchmarkTimeout, experiment.MemoryLimit == 0 ? null : new Nullable<long>(experiment.MemoryLimit));
                Trace.WriteLine(String.Format("Done in {0}", m.WallClockTime));

                var performanceIndex = Normalize(m.TotalProcessorTime);
                results[i] = new BenchmarkResult(id, benchmark, workerInfo, performanceIndex, acq, m);
            }

            return results;
        }

        private static string GetWorkerInfo()
        {
            return "";
        }

        private static double Normalize(TimeSpan totalProcessorTime)
        {
            return totalProcessorTime.TotalSeconds;
        }
    }

    public class ExperimentInstance
    {
        private readonly ExperimentID id;
        private readonly ExperimentDefinition def;

        private Task<BenchmarkResult[]> results;

        public ExperimentInstance(ExperimentID id, ExperimentDefinition def, Task<BenchmarkResult[]> results)
        {
            if (def == null) throw new ArgumentNullException("def");
            this.id = id;
            this.def = def;

            this.results = results;
        }

        public Task<BenchmarkResult[]> Results { get { return results; } }
    }
    
}
