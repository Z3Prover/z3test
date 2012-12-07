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

            BitVecExpr two = ctx.MkBV(2, 32);
            BitVecExpr three = ctx.MkBV(3, 32);
            BitVecExpr tf = ctx.MkBV(24, 32);            

            Solver s = ctx.MkSolver();
            s.Assert(ctx.MkEq(ctx.MkBVLSHR(x, two), three));
            Console.WriteLine(s.Check());
            Console.WriteLine(s.Model);

            s = ctx.MkSolver();
            s.Assert(ctx.MkEq(ctx.MkBVSHL(x, two), three));
            Console.WriteLine(s.Check());

            s = ctx.MkSolver();
            s.Assert(ctx.MkEq(ctx.MkBVRotateLeft(x, two), three));
            Console.WriteLine(s.Check());
            Console.WriteLine(s.Model);

            s = ctx.MkSolver();
            s.Assert(ctx.MkEq(ctx.MkBVSHL(x, two), tf));
            Console.WriteLine(s.Check());
            Console.WriteLine(s.Model);
        }
    }
}