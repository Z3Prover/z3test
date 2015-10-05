
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
        using (Context ctx1 = new Context(new Dictionary<string, string>() { { ":relevancy", "0" } }))
        using (Context ctx2 = new Context(new Dictionary<string, string>() { { ":model", "false" },
                                                                             { ":pp-decimal", "true" },
                                                                             { ":relevancy", "2" },
                                                                             { ":pp-decimal-precision", "50" } }))
        {
            IntExpr x = ctx1.MkIntConst("x");
            IntExpr _x = (IntExpr) x.Translate(ctx2);

            Console.WriteLine(ctx2.MkEq(_x, ctx1.MkAdd(x, ctx1.MkInt(1)).Translate(ctx2)));
            Console.WriteLine(ctx2.MkPower(ctx2.MkReal(2), ctx2.MkReal(1, 2)).Simplify());
            
            Console.WriteLine(ctx1.MkPower(ctx1.MkReal(2), ctx1.MkReal(1, 2)).Simplify());

            Solver s = ctx1.MkSolver();
            s.Assert(ctx1.MkEq(x, ctx1.MkInt(2)));
            Console.WriteLine(s);
            Console.WriteLine(s.Check());
            Console.WriteLine(s.Model);
            
            s = ctx2.MkSolver();
            s.Assert(ctx2.MkEq(_x, ctx2.MkInt(2)));
            Console.WriteLine(s.Check());

            try
            {
                Console.WriteLine(s.Model);
            }
            catch (Z3Exception ex)
            {
                Console.WriteLine("failed: " + ex.Message);
            }
        } 
    }
}