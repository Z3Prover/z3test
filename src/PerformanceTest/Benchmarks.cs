using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PerformanceTest
{
    public class Benchmark
    {
        public Benchmark(ExperimentDefinition experiment, string parameters, string benchmarkFile)
        {
            if (experiment == null) throw new ArgumentNullException("experiment");
            if (parameters == null) throw new ArgumentNullException("parameters");
            if (benchmarkFile == null) throw new ArgumentNullException("benchmarkFile");

            Experiment = experiment;
            Parameters = parameters;
            BenchmarkFile = benchmarkFile;
        }

        public ExperimentDefinition Experiment { get; private set; }

        /// <summary>
        /// Command-lines parameters specific for this benchmark.
        /// All wildcards are resolved here.
        /// </summary>
        public string Parameters { get; private set; }

        /// <summary>
        /// Identifies the benchmark file which is referred in the Parameters.
        /// </summary>
        public string BenchmarkFile { get; private set; }
    }

    public static class Benchmarks
    {
    }
}
