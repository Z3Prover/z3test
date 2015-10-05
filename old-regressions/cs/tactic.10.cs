
/*++
Copyright (c) 2015 Microsoft Corporation

--*/

using Microsoft.Z3;
using System;
using System.Collections.Generic;

class Test
{
    public void Run()
    {
        Dictionary<string, string> cfg = new Dictionary<string, string>() { 
            { "AUTO_CONFIG", "true" } };

        using (Context ctx = new Context(cfg))
        {
            Tactic t = ctx.Then(ctx.MkTactic("simplify"), 
                                ctx.MkTactic("normalize-bounds"), 
                                ctx.MkTactic("solve-eqs"));

            IntExpr x = ctx.MkIntConst("x");
            IntExpr y = ctx.MkIntConst("y");
            IntExpr z = ctx.MkIntConst("z");


            Goal g = ctx.MkGoal();
            g.Assert(ctx.MkGt(x, ctx.MkInt(10)));
            g.Assert(ctx.MkEq(y, ctx.MkAdd(x, ctx.MkInt(3))));
            g.Assert(ctx.MkGt(z, y));

            ApplyResult r = t[g];
            Console.WriteLine(r);

            Solver s = ctx.MkSolver();
            s.Assert(r.Subgoals[0].Formulas);

            Console.WriteLine(s.Check());

            Console.WriteLine("subgoal model");
            Model sgm = s.Model;
            Console.WriteLine(sgm);

            Console.WriteLine("converted model");
            Model m = r.ConvertModel(0, sgm);
            Console.WriteLine(m);

            Console.WriteLine(m.Evaluate(x));                
        }
    }
}