using Microsoft.Z3;
using System;

class Test
{
    public void Run()
    {
        using (Context ctx = new Context())
        {
            BoolExpr e = ctx.MkFalse();
            Solver s = ctx.MkSolver();
            s.Assert(e);
            Console.WriteLine(s.Check());
        }
    }
}






