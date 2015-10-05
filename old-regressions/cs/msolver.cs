
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
            IntExpr x = ctx.MkIntConst("x");
            IntExpr y = ctx.MkIntConst("y");

            Solver s1 = ctx.MkSolver();
            s1.Assert(new BoolExpr[] { ctx.MkGt(x, ctx.MkInt(10)), ctx.MkGt(y, ctx.MkInt(10)) });

            Solver s2 = ctx.MkSolver();
            
            Console.WriteLine(s2);
            s2.Assert(s1.Assertions);

            Console.WriteLine(s2);
        }
    }
}