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
        /* 
        --- JCT -- Returns (experiment ID, number of queued jobs) for each of the experiments.

        SELECT TitleScreen.ID, COUNT(JobQueue.ID) as Queued 
        FROM TitleScreen LEFT JOIN JobQueue 
        ON TitleScreen.ID = JobQueue.ExperimentID 
        GROUP BY TitleScreen.ID

        --- DCT -- Returns (experiment ID, number of done jobs) for each of the experiments.

        SELECT TitleScreen.ID, COUNT(Data.ID) as Done 
        FROM TitleScreen LEFT JOIN Data 
        ON TitleScreen.ID = Data.ExperimentID 
        GROUP BY TitleScreen.ID

        --- ProgressT -- Returns (experiment ID, number of done jobs, number of queued jobs, total [sum of done and queued]) for each of the experiments.
        SELECT DCT.ID, Done, Queued, (Done+Queued) as Total 
        FROM DCT, JCT
        WHERE DCT.ID = JCT.ID


        --- Returns experiment description including number of queued and done jobs.
        SELECT TitleScreen.*, Done, Queued, Total         
        FROM TitleScreen, ProgressT 
        WHERE TitleScreen.ID = ProgressT.ID
        */
        /// <summary>
        ///  Returns experiments ordered by submission time.
        /// </summary>
        public abstract Task<ExperimentStatus[]> GetExperiments(bool showProgress, string categoryFilter = null, string noteFilter = null, string creatorFilter = null);


        /// <summary>
        /// Returns information about completed jobs of the given experiment.
        /// </summary>
        /// <returns></returns>
        public abstract Task<BenchmarkResult[]> GetExperimentResults();

        public abstract Task<Group[]> GetGroups();




        public abstract Task<ExperimentID> StartExperiment(ExperimentDefinition definition);

        public abstract Task<BenchmarkResult[]> AllResults(ExperimentID experimentId);
        public abstract Task<BenchmarkResult>[] Results(ExperimentID experimentId);
    }
}
