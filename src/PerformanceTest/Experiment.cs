using Measurement;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using ExperimentID = System.Int32;


namespace PerformanceTest
{
    public sealed class Experiment
    {
        public ExperimentID ID { get; }

        public Task<ExperimentDefinition> Definition { get; }

        public Task<ExperimentStatus> GetStatus()
        {
            throw new NotImplementedException();
        }

        public Task<BenchmarkResult>[] Results { get; }
    }

    public class ExperimentDefinition
    {
        public static ExperimentDefinition Create(string executable, string benchmarkContainer, string benchmarkFileExtension, string parameters, TimeSpan benchmarkTimeout,
            string category = null)
        {
            return new ExperimentDefinition()
            {
                Executable = executable,
                BenchmarkContainer = benchmarkContainer,
                BenchmarkFileExtension = benchmarkFileExtension,
                Parameters = parameters,
                BenchmarkTimeout = benchmarkTimeout,
                Category = category
            };
        }

        private ExperimentDefinition()
        {
        }

        /// <summary>
        /// An executable name to measure performance by running for multiple benchmark files.
        /// </summary>
        public string Executable { get; private set; }

        /// <summary>
        /// Command-line parameters for the executable.
        /// Special symbols:
        ///  - "{0}" will be replaced with a path to a benchmark file.
        /// </summary>
        public string Parameters { get; private set; }

        
        /// <summary>
        /// A shared container with the benchmark files.
        /// </summary>
        public string BenchmarkContainer { get; private set; }


        /// <summary>
        /// A category name to draw benchmarks from. Can be null or empty string.
        /// </summary>
        public string Category { get; private set; }

        /// <summary>
        /// The extension of benchmark files, e.g., "smt2" for SMT-Lib version 2 files.
        /// </summary>
        public string BenchmarkFileExtension { get; private set; }



        /// <summary>
        /// The memory limit per benchmark (bytes).
        /// Zero means no limit.
        /// </summary>
        public long MemoryLimit { get; private set; }

        /// <summary>
        /// The time limit per benchmark.
        /// </summary>
        public TimeSpan BenchmarkTimeout { get; private set; }

        /// <summary>
        /// The time limit per experiment.
        /// </summary>
        public TimeSpan ExperimentTimeout { get; private set; }

        /// <summary>
        /// A descriptive note, if you like.
        /// </summary>
        public string Note { get; private set; }

        public string GroupName { get; private set; }
    }
    
    /// <summary>
    /// Represents the experiment that runs multiple performance measurements jobs.
    /// Aka "TitleScreen"; used in ClusterExperiments for the main table.
    /// </summary>
    public class ExperimentStatus
    {
        public ExperimentID ID;
        
        public DateTime SubmissionTime;
        public string Creator;
        public string ExecutableVersion;

        public string Category;
        public string Note;
        public bool Flag;

        public int BenchmarksDone { get; private set; }
        public int BenchmarksTotal { get; private set; }
        public int BenchmarksQueued { get { return this.BenchmarksTotal - this.BenchmarksDone; } }
    }


    /// <summary>
    /// Aka "Data".
    /// </summary>
    public class BenchmarkResult
    {
        public BenchmarkResult(int experimentId, string benchmarkFileName, string workerInformation, double normalizedRuntime, DateTime acquireTime, ProcessRunMeasure measure)
        {
            this.ExperimentID = experimentId;
            this.BenchmarkFileName = benchmarkFileName;
            this.WorkerInformation = workerInformation;
            this.NormalizedRuntime = normalizedRuntime;
            this.Measurements = measure;
            this.AcquireTime = acquireTime;
        }

        /// <summary>
        /// An experiment this benchmark is part of.
        /// </summary>
        public int ExperimentID { get; private set; }

        public ProcessRunMeasure Measurements { get; private set; }

        /// <summary>
        /// A normalized total processor time that indicates the amount of time that the associated process has spent utilizing the CPU.
        /// </summary>
        public double NormalizedRuntime { get; private set; }
        public string WorkerInformation { get; private set; }


        /// <summary>
        /// Name of a file that is passed as an argument to the target executable.
        /// </summary>
        /// <example>smtlib-latest\sample\z3.01234.smt2</example>
        public string BenchmarkFileName { get; private set; }

        public DateTime AcquireTime { get; private set; }
    }

}
