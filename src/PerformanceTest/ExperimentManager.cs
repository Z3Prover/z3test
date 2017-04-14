using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using ExperimentID = System.Int32;

namespace PerformanceTest
{

    public abstract class ExperimentManager
    {
        /// <summary>
        /// Schedules execution of a new experiment from the given experiment definition.
        /// </summary>
        /// <param name="definition">Describes the experiment to be performed.</param>
        /// <returns>Identifier of the new experiment for further reference.</returns>
        public abstract Task<ExperimentID> StartExperiment(ExperimentDefinition definition);

        /// <summary>
        /// Returns a definition of an existing experiment.
        /// </summary>
        public abstract Task<ExperimentDefinition> GetDefinition(ExperimentID id);

        /// <summary>
        /// Returns current execution status of an existing experiment.
        /// </summary>
        public abstract Task<ExperimentStatus> GetStatus(ExperimentID id);

        /// <summary>
        /// Allows to get a result of each of the experiment's benchmarks.
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public abstract Task<BenchmarkResult>[] GetResults(ExperimentID id);



        public abstract Task<IEnumerable<ExperimentID>> FindExperiments(ExperimentFilter? filter = null);

        public struct ExperimentFilter
        {
            public string BencmarkContainerEquals { get; set; }

            public string CategoryEquals { get; set; }

            public string ExecutableEquals { get; set; }

            public string ParametersEquals { get; set; }

        }
    }
}
