
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
        Dictionary<string, string> cfg = new Dictionary<string, string>() { { "AUTO_CONFIG", "true" } };

        using (Context ctx = new Context(cfg))
        {            
            RealExpr x = ctx.MkRealConst("x");
            RealExpr y = ctx.MkRealConst("y");

            Params ps = ctx.MkParams();
            ps.Add(":arith-lhs", true);

            Expr q = ctx.MkEq(x, ctx.MkAdd(y, ctx.MkReal(2)));
            q = q.Simplify(ps);

            Console.WriteLine(ps);
            Console.WriteLine(q);
        }
    }
}