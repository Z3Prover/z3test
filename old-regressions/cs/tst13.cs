
/*++
Copyright (c) 2015 Microsoft Corporation

--*/

using Microsoft.Z3;
using System;

class Test
{

    public void Run()
    {        
        using (Context ctx = new Context())
        {
            Expr a1 = ctx.MkAdd(ctx.MkRealConst("x"), ctx.MkReal(1));
            Expr a2 = ctx.MkAdd(ctx.MkRealConst("x"), ctx.MkReal(1));

            Console.WriteLine(a1.GetHashCode() == a2.GetHashCode());
            Expr a3 = ctx.MkAdd(ctx.MkRealConst("x"), ctx.MkReal(2));
            Console.WriteLine(a3.GetHashCode() == a1.GetHashCode());
        }
    }
}