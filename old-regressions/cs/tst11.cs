using Microsoft.Z3;
using System;

class Test
{

    public void Run()
    {        
        using (Context ctx = new Context())
        {
            RealExpr x = ctx.MkRealConst("x");
            RealExpr y = ctx.MkRealConst("y");

            Goal g = ctx.MkGoal();
            g.Assert(ctx.MkGt(x, ctx.MkReal(10)), ctx.MkEq(y, ctx.MkAdd(x, ctx.MkReal(1))));
            g.Assert(ctx.MkGt(y, ctx.MkReal(1)));

            Tactic t = ctx.MkTactic("simplify");
            ApplyResult r = t.Apply(g);
             
            Console.WriteLine(r);
            Console.WriteLine(g.Size);

            foreach (Goal s in r.Subgoals)
                Console.WriteLine(s);

            Console.WriteLine("Old goal: ");
            Console.WriteLine(g);

            t = ctx.Then(ctx.MkTactic("simplify"), ctx.MkTactic("solve-eqs"));
            r = t.Apply(g);

            Console.WriteLine(r);

            Solver solver = ctx.MkSolver();
            foreach (BoolExpr f in r.Subgoals[0].Formulas)
                solver.Assert(f);

            Console.WriteLine(solver);
            Console.WriteLine(solver.Check());
            Console.WriteLine(solver.Model);
            Console.WriteLine("applying model convert");
            Console.WriteLine(r.ConvertModel(0, solver.Model));
            Console.WriteLine("done");
        }
    }
}