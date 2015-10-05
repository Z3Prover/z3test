
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
            RealExpr d = ctx.MkRealConst("d");
            RealExpr a = ctx.MkRealConst("a");
            RealExpr t = ctx.MkRealConst("t");
            RealExpr v_i = ctx.MkRealConst("v_i");
            RealExpr v_f = ctx.MkRealConst("v_f");

            BoolExpr[] equations = new BoolExpr[] {
                ctx.MkEq(d, ctx.MkAdd(ctx.MkMul(v_i, t), 
                                      ctx.MkDiv(ctx.MkMul(a, ctx.MkPower(t, ctx.MkReal(2))), 
                                                ctx.MkReal(2)))),
                ctx.MkEq(v_f, ctx.MkAdd(v_i, ctx.MkMul(a, t)))
            };

            Console.WriteLine("Kinematic equations: ");
            foreach (BoolExpr e in equations)
                Console.WriteLine(e);

            BoolExpr[] problem = new BoolExpr[] {
                ctx.MkEq(v_i, ctx.MkReal(30)),
                ctx.MkEq(v_f, ctx.MkReal(0)),
                ctx.MkEq(a, ctx.MkReal(-8))
            };

            Console.WriteLine("Problem: ");
            foreach (BoolExpr p in problem)
                Console.WriteLine(p);

            Solver s = ctx.MkSolver();
            s.Assert(equations);
            s.Assert(problem);

            if (s.Check() != Status.SATISFIABLE)
                throw new Exception("BUG");

            Console.WriteLine("Solution: ");
            Console.WriteLine(s.Model);
        }
    }
}