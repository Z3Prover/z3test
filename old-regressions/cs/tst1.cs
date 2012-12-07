using Microsoft.Z3;
using System;

class Test
{

    public void Run()
    {        
        using (Context ctx = new Context())
        {
            IntExpr x = ctx.MkIntConst("x");
            Console.WriteLine(ctx.MkAdd(x, ctx.MkInt(1)));
        }
    }
}