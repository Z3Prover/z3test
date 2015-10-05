
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
                        RealExpr x = ctx.MkRealConst("x");
            RealExpr y = ctx.MkRealConst("y");

            Solver s = ctx.MkSolver();

            s.Assert(ctx.MkGt(x, ctx.MkReal(1)),
                     ctx.MkGt(y, ctx.MkReal(1)),
                     ctx.MkOr(ctx.MkGt(ctx.MkAdd(x, y), ctx.MkReal(1)),
                              ctx.MkLt(ctx.MkSub(x, y), ctx.MkReal(2))));

            Console.WriteLine("asserted constraints: ");
            foreach (var c in s.Assertions)
                Console.WriteLine(c);

            Console.WriteLine(s.Check());
            Console.WriteLine(s.Statistics);

            Console.WriteLine("stats for last check: ");
            foreach (Statistics.Entry e in s.Statistics.Entries)
                Console.WriteLine(e);        
        }
    }
}