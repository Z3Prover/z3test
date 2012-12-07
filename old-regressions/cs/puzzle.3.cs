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
            ArithExpr[] Q = new ArithExpr[8];
            for (uint i = 0; i < 8; i++)
                Q[i] = ctx.MkIntConst(string.Format("Q_{0}", i + 1));

            BoolExpr[] val_c = new BoolExpr[8];
            for (uint i = 0; i < 8; i++)
                val_c[i] = ctx.MkAnd(ctx.MkLe(ctx.MkInt(1), Q[i]),
                                     ctx.MkLe(Q[i], ctx.MkInt(8)));

            BoolExpr col_c = ctx.MkDistinct(Q);

            BoolExpr[][] diag_c = new BoolExpr[8][];
            for (uint i = 0; i < 8; i++)
            {
                diag_c[i] = new BoolExpr[i];
                for (uint j = 0; j < i; j++)
                    diag_c[i][j] = (BoolExpr)ctx.MkITE(ctx.MkEq(ctx.MkInt(i), ctx.MkInt(j)),
                                             ctx.MkTrue(),
                                             ctx.MkAnd(ctx.MkNot(ctx.MkEq(ctx.MkSub(Q[i], Q[j]), 
                                                                          ctx.MkSub(ctx.MkInt(i), ctx.MkInt(j)))),
                                                       ctx.MkNot(ctx.MkEq(ctx.MkSub(Q[i], Q[j]), 
                                                                          ctx.MkSub(ctx.MkInt(j), ctx.MkInt(i))))));
            }

            Solver s = ctx.MkSolver();
            s.Assert(val_c);
            s.Assert(col_c);
            foreach (var c in diag_c)
                s.Assert(c);

            Console.WriteLine(s.Check());
            Console.WriteLine(s.Model);
        }
    }
}