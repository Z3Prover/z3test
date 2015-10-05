
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
            Sort A = ctx.MkUninterpretedSort("A");
            Expr x = ctx.MkConst("x", A);
            Expr y = ctx.MkConst("y", A);
            FuncDecl f = ctx.MkFuncDecl("f", A, A);

            Solver s = ctx.MkSolver();
            s.Assert(ctx.MkEq(f[f[x]], x),
                     ctx.MkEq(f[x], y),
                     ctx.MkNot(ctx.MkEq(x, y)));

            Console.WriteLine(s.Check());
            Model m = s.Model;
            Console.WriteLine(m);
            Console.WriteLine("interpretation assigned to A: ");
            foreach (Expr a in m.SortUniverse(A))
                Console.WriteLine(a);
        }
    }
}
