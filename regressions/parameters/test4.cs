using Microsoft.Z3;
using System;
using System.Collections.Generic;

clas Test {
   static Context CreateContext()
        {
            var mbqiMaxIterations = "10000";
            var settings = new Dictionary<string, string>()
            {
                { "MODEL", "true" },
                { "MBQI", "false" }, //experimenting... didn't take
                { "MBQI_MAX_ITERATIONS", mbqiMaxIterations },
                { "MBQI.MAX_ITERATIONS", mbqiMaxIterations },
                { "mbqi.max_iterations", mbqiMaxIterations },
                { "smt.mbqi.max_iterations", mbqiMaxIterations },
                { "MBQI_TRACE", "true" },
            };

                return new Context(settings);
        }


                using (var context = CreateContext())
                {
                    var solver = context.MkSimpleSolver();

                    {
                        var @params = context.MkParams();

                        foreach (var colon in new[] { false, true })
                            foreach (var lower in new[] { false, true })
                            foreach (var smt in new[] { false, true })
                                foreach (var str in new[] { "mbqi.max_iterations", "mbqi-max-iterations", "MBQI_MAX_ITERATIONS" })
                                {
                                    var name = (colon ? ":" : "") + (smt ? "smt." : "") + (lower ? str.ToLowerInvariant() : str);
                                    Debug.WriteLine(name);
                                    @params.Add(name, 10000U);
                                }

                        solver.Parameters = @params;
                    }

                    solver.Assert(SOME_EXPRESSION);

                    var status = solver.Check();
                }

}
