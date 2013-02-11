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
            TestDriver.CheckString(ctx.MkAdd(x, ctx.MkInt2Real(y), ctx.MkReal(1), ctx.MkAdd(a, ctx.MkInt2Real(s))),
                        "(+ x (to_real y) 1.0 a (to_real s))");
            TestDriver.CheckString(ctx.MkAdd(ctx.MkInt2Real(y), c), "(+ (to_real y) c)");
        }
    }
}