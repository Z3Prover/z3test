using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

using Microsoft.Z3;

namespace cp560796
{
    class Program
    {
        static Random rng = null;

        static Context CreateContext()
        {
            // var mbqiMaxIterations = "10000";
            var settings = new Dictionary<string, string>() { 
                { "unsat_core", "true" },
                { "smt.mbqi.trace", "true"},
                { "blah", "none"}
            };

            return new Context(settings);
        }
        static void doit()
        {
            using (var context = CreateContext())
            {
                var solver = context.MkSimpleSolver();
                {
                    var @params = context.MkParams();

                    // foreach (var colon in new[] { false, true })
                    //    foreach (var lower in new[] { false, true })
                    //      foreach (var smt in new[] { false, true })
                    //foreach (var str in new[] { 
                    //    "mbqi.max_iterations", 
                    //    "mbqi-max-iterations", 
                    //    "MBQI_MAX_ITERATIONS" })
                    //{
                    //    var name = (colon ? ":" : "") + (smt ? "smt." : "") + (lower ? str.ToLowerInvariant() : str);
                    //    Console.WriteLine(name);
                    //    @params.Add(name, 10000U);
                    //}                                            

                    // @params.Add("auto_config", false);
                    @params.Add("mbqi.trace", true);

                    solver.Parameters = @params;
                }

                ParamDescrs q = solver.ParameterDescriptions;
                
                BoolExpr c =
                        context.ParseSMTLIB2File(@"C:\cwinter\SMTLIB\BV\wintersteiger\fmsd13\fixpoint\small-bug1-fixpoint-10.smt2");

                solver.Assert(c); // <---- Sometimes this call has mbqi.trace on, and sometimes it's off.

                var status = solver.Check();

                Console.WriteLine(solver.UnsatCore);
            }            
        }

        static void Main(string[] args)
        {
            // Global.SetParameter("auto_config", "false");
            rng = new Random();
            while (true)
            {
                doit();
                if (rng.Next(0,2) == 1)
                    GC.Collect();
            }
        }
    }
}
