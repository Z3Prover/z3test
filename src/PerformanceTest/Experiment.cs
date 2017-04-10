using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using ExperimentID = System.Int32;


namespace PerformanceTest
{
    public class ExperimentDefinition
    {
        public static ExperimentDefinition Create(string executable, string benchmarkContainer, string benchmarkFileExtension)
        {
            return new ExperimentDefinition()
            {
                Executable = executable,
                BenchmarkContainer = benchmarkContainer,
                BenchmarkFileExtension = benchmarkFileExtension
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
        /// The extension of benchmark files, e.g., "smt2" for SMT-Lib version 2 files.
        /// </summary>
        public string BenchmarkFileExtension { get; private set; }



        /// <summary>
        /// The memory limit per benchmark (bytes).
        /// </summary>
        public int MemoryLimit { get; private set; }

        /// <summary>
        /// The time limit per benchmark.
        /// </summary>
        public TimeSpan BenchmarkTimeout { get; private set; }

        /// <summary>
        /// The time limit per experiment.
        /// </summary>
        public TimeSpan ExperimentTimeout { get; private set; }

        /// <summary>
        /// A higher-priority experiment have scheduling precedence over lower-priority experiment.
        /// A greater value corresponds to a higher priority.
        /// </summary>
        public int ExperimentPriority { get; private set; }


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
        public string Category;
        public string Creator;
        public string Note;
        public bool Flag;

        public int BenchmarksDone;
        public int BenchmarksQueued;
        public int BenchmarksTotal { get { return this.BenchmarksDone + this.BenchmarksQueued; } }
    }

    public enum ResultCode
    {
        Success = 0,
        Bug = 3,
        Error = 4,
        Timeout = 5,
        OutOfMemory = 6,
    }

    /// <summary>
    /// Aka "Data".
    /// </summary>
    public class BenchmarkResult
    {
        public int JobID;

        /// <summary>
        /// An experiment this job is part of.
        /// </summary>
        public int ExperimentID;

        /// <summary>
        /// A normalized total processor time that indicates the amount of time that the associated process has spent utilizing the CPU.
        /// </summary>
        public double NormalizedRuntime;
        public double ActualRuntime;
        public string WorkerInformation;

        public string StdOut;
        public string StdErr;

        /// <summary>
        /// Name of a file that is passed as an argument to the target executable.
        /// </summary>
        /// <example>smtlib-latest\sample\z3.01234.smt2</example>
        public string BenchmarkFileName;

        public int ReturnValue;
        public ResultCode ResultCode;
        public Dictionary<string, string> CustomResults;

        public DateTime AcquireTime;
        public DateTime FinishTime;
    }

   public class Group
    {
        public string Name;

        public string Creator;

        public string Category;

        public string Note;
    }


}
