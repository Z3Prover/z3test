using Microsoft.Z3;
using System;
using System.Collections.Generic;

class Test
{
    public void Run()
    {
        Dictionary<string, string> cfg = new Dictionary<string, string>() { 
            { "AUTO_CONFIG", "true" } };

        Context ctx = new Context(cfg);
        Context.ToggleWarningMessages(false);

        IntExpr x = ctx.MkIntConst("x");

        try
        {
            Solver s = ctx.MkSolver();
            s.Assert(ctx.MkEq(x, ctx.MkReal("3/2")));
            Console.WriteLine(s.Check());
        }
        catch (Z3Exception ex)
        {
            Console.WriteLine("Exception: " + ex.Message);
        }
    }
}