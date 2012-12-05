using Microsoft.Z3;
using System;

class Test
{

    public void Run()
    {        
        using (Context ctx = new Context())
        {
            Console.WriteLine(ctx.MkPower(ctx.MkReal(2), ctx.MkReal(1, 2)).Simplify());
            ctx.UpdateParamValue(":pp-decimal-precision", "50");
            ctx.UpdateParamValue(":pp-decimal", "true");
            Console.WriteLine(ctx.MkPower(ctx.MkReal(2), ctx.MkReal(1, 2)).Simplify());
            ctx.UpdateParamValue(":pp-decimal-precision", "20");
            Console.WriteLine(ctx.MkPower(ctx.MkReal(2), ctx.MkReal(1, 2)).Simplify());
        }
    }
}