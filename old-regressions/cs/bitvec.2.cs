
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
            { "AUTO_CONFIG", "true" } };
        
        using (Context ctx = new Context(cfg))
        {
            BitVecExpr x = ctx.MkBVConst("x", 32);
            BitVecExpr y = ctx.MkBVConst("y", 32);

            BoolExpr q = ctx.MkAnd(ctx.MkEq(ctx.MkBVAdd(x, y), ctx.MkBV(2, 32)),
                                   ctx.MkBVSGT(x, ctx.MkBV(0, 32)),
                                   ctx.MkBVSGT(y, ctx.MkBV(0, 32)));

            Console.WriteLine(q);

            Solver s = ctx.MkSolver();
            s.Assert(q);
            Console.WriteLine(s.Check());
            Console.WriteLine(s.Model);

            q = ctx.MkEq(ctx.MkBVAND(x, y), ctx.MkBVNeg(y));
            Console.WriteLine(q);

            s = ctx.MkSolver();
            s.Assert(q);
            Console.WriteLine(s.Check());
            Console.WriteLine(s.Model);

            q = ctx.MkBVSLT(x, ctx.MkBV(0, 32));
            Console.WriteLine(q);

            s = ctx.MkSolver();
            s.Assert(q);
            Console.WriteLine(s.Check());
            Console.WriteLine(s.Model);

            q = ctx.MkBVULT(x, ctx.MkBV(0, 32));
            Console.WriteLine(q);

            s = ctx.MkSolver();
            s.Assert(q);
            Console.WriteLine(s.Check());            
        }
    }
}