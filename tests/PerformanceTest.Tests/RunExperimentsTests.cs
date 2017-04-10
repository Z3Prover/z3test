using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using PerformanceTest;
using System.Threading.Tasks;

namespace UnitTests
{
    [TestClass]
    public class RunExperimentsTests
    {
        [TestMethod]
        public async Task RunExperiment()
        {
            ExperimentDefinition def = ExperimentDefinition.Create("LinearEquationSolver.exe", "benchmarks_1", "csv");

            ExperimentManager manager = new LocalExperimentManager();

            var expId = await manager.StartExperiment(def);
            var results = await manager.Result(expId);


            Assert.AreEqual(1, results.Length, "Number of completed benchmarks");
        }
    }
}
