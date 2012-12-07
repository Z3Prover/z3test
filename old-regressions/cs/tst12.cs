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

            Goal g = ctx.MkGoal();
            g.Assert(ctx.MkGt(x, ctx.MkReal(10)), ctx.MkEq(y, ctx.MkAdd(x, ctx.MkReal(1))));
            g.Assert(ctx.MkGt(y, ctx.MkReal(1)));

            Console.WriteLine(ctx.MkProbe("num-consts").Apply(g));
            Console.WriteLine(ctx.MkProbe("size").Apply(g));
            Console.WriteLine(ctx.MkProbe("num-exprs").Apply(g));
        }
    }
}