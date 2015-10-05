
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
            { "AUTO_CONFIG", "true" },
            { "MODEL", "true" } };

        using (Context ctx = new Context(cfg))
        {
            ArrayExpr A = ctx.MkArrayConst("A", ctx.IntSort, ctx.IntSort);

            IntExpr x = ctx.MkIntConst("x");
            IntExpr y = ctx.MkIntConst("y");

            Solver s = ctx.MkSolver();
            s.Assert(ctx.MkEq(ctx.MkSelect(A, x), x));
            s.Assert(ctx.MkEq(ctx.MkStore(A, x, y), A));
            Console.WriteLine(s);
            Console.WriteLine(s.Check());
            Console.WriteLine(s.Model);
        }
    }
}