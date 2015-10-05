
/*++
Copyright (c) 2015 Microsoft Corporation

--*/

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

            Solver s = ctx.Then(ctx.MkTactic("simplify"), ctx.MkTactic("nlsat")).Solver;

            s.Assert(ctx.MkEq(ctx.MkPower(x, ctx.MkReal(2)), ctx.MkReal(2)),
                     ctx.MkEq(ctx.MkPower(y, ctx.MkReal(3)), ctx.MkAdd(x, ctx.MkReal(1))));
            Console.WriteLine(s.Check());
            ctx.UpdateParamValue(":pp-decimal", "true");
            Console.WriteLine(s.Model);
            Console.WriteLine(s.Statistics);

            foreach (string k in s.Statistics.Keys)
                Console.WriteLine(k);

            Console.WriteLine("NLSAT stages: " + s.Statistics["nlsat stages"].Value);
            Console.WriteLine("NLSAT propagations: " + s.Statistics["nlsat propagations"].Value);
        }
    }
}