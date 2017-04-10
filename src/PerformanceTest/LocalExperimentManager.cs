using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Collections.Concurrent;
using System.Threading.Tasks;

using ExperimentID = System.Int32;
using System.Threading;

namespace PerformanceTest
{
    public class LocalExperimentManager : ExperimentManager
    {
        private int nextId = 0;
        private ConcurrentDictionary<ExperimentID, ExperimentDefinition> experiments;

        public LocalExperimentManager()
        {
            experiments = new ConcurrentDictionary<ExperimentID, ExperimentDefinition>();
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
            experiments[id] = definition;

            throw new NotImplementedException();
        }

        public override Task<BenchmarkResult[]> Result(int experimentId)
        {            
            throw new NotImplementedException();
        }
    }

    
}
