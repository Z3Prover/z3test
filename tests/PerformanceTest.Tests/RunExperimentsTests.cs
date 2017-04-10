using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using PerformanceTest;
using System.Threading.Tasks;
using static Measurement.Measure;

namespace UnitTests
{
    [TestClass]
    public class RunExperimentsTests
    {
        [TestMethod]
        public async Task RunExperiment()
        {
            ExperimentDefinition def = ExperimentDefinition.Create("LinearEquationSolver.exe", "benchmarks_1", "csv", "{0}", TimeSpan.FromSeconds(10));

            ExperimentManager manager = new LocalExperimentManager();

            var expId = await manager.StartExperiment(def);
            var results = await manager.Result(expId);

            Assert.AreEqual(1, results.Length, "Number of completed benchmarks");

            var res = results[0];
            Assert.AreEqual(0, res.Measurements.ExitCode, "exit code");
            Assert.AreEqual(CompletionStatus.Success, res.Measurements.Status, "status");
            Assert.IsTrue(res.Measurements.TotalProcessorTime.TotalSeconds < 1, "Total runtime");
        }
    }
}
