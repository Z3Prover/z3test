
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
            Sort I = ctx.IntSort;
            ArrayExpr A = ctx.MkArrayConst("A", I, I);
            IntExpr x = ctx.MkIntConst("x");

            Console.WriteLine(ctx.MkSelect(A, x));
            Console.WriteLine(ctx.MkStore(A, x, ctx.MkInt(10)));

            Expr q = ctx.MkSelect(ctx.MkStore(A, ctx.MkInt(2), ctx.MkAdd(x, ctx.MkInt(1))), ctx.MkInt(2));

            Console.WriteLine(q);
            Console.WriteLine(q.Simplify());
        }
    }
}