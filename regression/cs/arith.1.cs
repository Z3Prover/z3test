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
            IntExpr y = ctx.MkIntConst("y");
            RealExpr a, b, c;
            a = ctx.MkRealConst("a");
            b = ctx.MkRealConst("b");
            c = ctx.MkRealConst("c");
            IntExpr s, r;
            s = ctx.MkIntConst("s");
            r = ctx.MkIntConst("r");
            Console.WriteLine(ctx.MkAdd(x, ctx.MkInt2Real(y), ctx.MkReal(1), ctx.MkAdd(a, ctx.MkInt2Real(s))));
            Console.WriteLine(ctx.MkAdd(ctx.MkInt2Real(y), c));
        }
    }
}