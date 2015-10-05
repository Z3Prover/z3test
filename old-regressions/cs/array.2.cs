
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
            ArrayExpr X = ctx.MkArrayConst("A", ctx.IntSort, ctx.IntSort);

            Expr q = ctx.MkGe(
                        ctx.MkAdd((IntExpr)ctx.MkSelect(X, ctx.MkInt(0)),
                                  (IntExpr)ctx.MkSelect(X, ctx.MkInt(1)),
                                  (IntExpr)ctx.MkSelect(X, ctx.MkInt(2))),
                        ctx.MkInt(0));

            Console.WriteLine(q);
            Console.WriteLine(q.Simplify());
        }
    }
}