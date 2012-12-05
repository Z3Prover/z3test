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
            ps.Add(":som", true);

            Expr q = ctx.MkPower(ctx.MkAdd(x, y), ctx.MkReal(3));
            q = q.Simplify(ps);

            Console.WriteLine(ps);
            Console.WriteLine(q);

            ps = ctx.MkParams();
            ps.Add(":mul-to-power", true);

            q = q.Simplify(ps);

            Console.WriteLine(ps);
            Console.WriteLine(q);
        }
    }
}