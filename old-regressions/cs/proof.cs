
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
            { "AUTO_CONFIG", "true" },
            { "PROOF_MODE", "2" } };

        using (Context ctx = new Context(cfg))
        {
            BoolExpr p = ctx.MkBoolConst("p");
            Solver s = ctx.MkSolver();
            s.Assert(p);
            s.Assert(ctx.MkNot(p));

            Console.WriteLine(s.Check());
            Console.WriteLine(s.Proof);
        }
    }
}