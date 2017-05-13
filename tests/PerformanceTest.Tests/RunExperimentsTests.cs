using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using PerformanceTest;
using System.Threading.Tasks;
using System.Linq;
using static Measurement.Measure;

namespace UnitTests
{
    [TestClass]
    public class RunExperimentsTests
    {
        private static ExperimentManager NewManager()
        {
            FileStorage storage = FileStorage.Open("measure");
            storage.Clear();
            ExperimentManager manager = new LocalExperimentManager(storage);
            return manager;
        }

        private static ExperimentManager OpenManager()
        {
            FileStorage storage = FileStorage.Open("measure");
            ExperimentManager manager = new LocalExperimentManager(storage);
            return manager;
        }

        [TestMethod]
        public async Task RunExperiment()
        {
            ExperimentDefinition def = ExperimentDefinition.Create("LinearEquationSolver.exe", "benchmarks_1", "csv", "{0}", TimeSpan.FromSeconds(10));

            ExperimentManager manager = NewManager();
            var expId = await manager.StartExperiment(def);

            var results = await Task.WhenAll(manager.GetResults(expId));
            Assert.AreEqual(1, results.Length, "Number of completed benchmarks");

            var res = results[0];
            Assert.AreEqual(0, res.Measurements.ExitCode, "exit code");
            Assert.AreEqual(CompletionStatus.Success, res.Measurements.Status, "status");
            Assert.IsTrue(res.Measurements.TotalProcessorTime.TotalSeconds < 1, "Total runtime");
        }

        [TestMethod]
        public async Task RunExperimentsWithCategory()
        {
            ExperimentDefinition def = ExperimentDefinition.Create("LinearEquationSolver.exe", "benchmarks_2", "csv", "{0} 1000", TimeSpan.FromSeconds(10), 
                category: "IdentitySquare");

            ExperimentManager manager = NewManager();
            var expId = await manager.StartExperiment(def);

            var results = await Task.WhenAll(manager.GetResults(expId));
            Assert.AreEqual(3, results.Length, "Number of completed benchmarks");

            foreach (var res in results)
            {
                Assert.AreEqual(0, res.Measurements.ExitCode, "exit code");
                Assert.AreEqual(CompletionStatus.Success, res.Measurements.Status, "status");
                Assert.IsTrue(res.Measurements.TotalProcessorTime.TotalSeconds < 10, "Total runtime");
            }
        }

        [TestMethod]
        public async Task FindExperiments()
        {
            ExperimentDefinition def1 = ExperimentDefinition.Create("LinearEquationSolver.exe", "benchmarks_2", "csv", "{0} 1", TimeSpan.FromSeconds(10), category: "IdentitySquare");
            ExperimentDefinition def2 = ExperimentDefinition.Create("LinearEquationSolver.exe", "benchmarks_2", "csv", "{0} 2", TimeSpan.FromSeconds(10), category: "IdentitySquare");

            ExperimentManager manager = NewManager();

            var e1 = await manager.StartExperiment(def1);
            var e2 = await manager.StartExperiment(def1);
            var e4 = await manager.StartExperiment(def2);

            var r1 = await Task.WhenAll(manager.GetResults(e1));
            var r2 = await Task.WhenAll(manager.GetResults(e2));
            var r4 = await Task.WhenAll(manager.GetResults(e4));

            var loaded = (await manager.FindExperiments()).ToArray();
            Assert.AreEqual(3, loaded.Length, "Number of found experiments (same manager)");

            var manager2 = OpenManager();
            var loaded2 = (await manager2.FindExperiments()).ToArray();
            Assert.AreEqual(3, loaded2.Length, "Number of found experiments (reloaded)");

            var loaded3 = (await manager2.FindExperiments(new ExperimentManager.ExperimentFilter { ParametersEquals = "{0} 2" })).ToArray();
            Assert.AreEqual(1, loaded3.Length, "Number of found experiments (reloaded, filtered)");
        }

        //[TestMethod]
        //public async Task RunExperimentsAndGetIntermediateStatus()
        //{
        //    ExperimentDefinition def = ExperimentDefinition.Create("LinearEquationSolver.exe", "benchmarks_2", "csv", "{0} 10000", TimeSpan.FromSeconds(10),
        //        category: "IdentitySquare");

        //    ExperimentManager manager = new LocalExperimentManager();

        //    var expId = await manager.StartExperiment(def);

        //    var results = await manager.Result(expId);

        //    Assert.AreEqual(3, results.Length, "Number of completed benchmarks");

        //    foreach (var res in results)
        //    {
        //        Assert.AreEqual(0, res.Measurements.ExitCode, "exit code");
        //        Assert.AreEqual(CompletionStatus.Success, res.Measurements.Status, "status");
        //        Assert.IsTrue(res.Measurements.TotalProcessorTime.TotalSeconds < 10, "Total runtime");
        //    }
        //}
    }
}
