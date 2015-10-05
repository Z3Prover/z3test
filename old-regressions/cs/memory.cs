
/*++
Copyright (c) 2015 Microsoft Corporation

--*/

using System;
using Microsoft.Z3;
using System.Collections.Generic;
class Test {

        /// <summary>
        /// Generates a slightly randomized expression.
        /// </summary>
        static BoolExpr MkRandomExpr(Context ctx, System.Random rng)
        {
            int limit = 1073741823;
            Sort i = ctx.IntSort;
            Sort b = ctx.BoolSort;
            Symbol sr1 = ctx.MkSymbol(rng.Next(0, limit));
            Symbol sr2 = ctx.MkSymbol(rng.Next(0, limit));
            Symbol sr3 = ctx.MkSymbol(rng.Next(0, limit));
            FuncDecl r1 = ctx.MkFuncDecl(sr1, i, b);
            FuncDecl r2 = ctx.MkFuncDecl(sr2, i, b);
            FuncDecl r3 = ctx.MkFuncDecl(sr3, i, b);
            Symbol s = ctx.MkSymbol(rng.Next(0, limit));
            Expr x = ctx.MkConst(s, i);
            BoolExpr r1x = (BoolExpr)ctx.MkApp(r1, x);
            BoolExpr r2x = (BoolExpr)ctx.MkApp(r2, x);
            BoolExpr r3x = (BoolExpr)ctx.MkApp(r3, x);
            Expr[] vars = { x };
            BoolExpr rl1 = ctx.MkForall(vars, ctx.MkImplies(r1x, r2x));
            BoolExpr rl2 = ctx.MkForall(vars, ctx.MkImplies(r2x, r1x));
            BoolExpr rl3 = (BoolExpr)ctx.MkApp(r1, ctx.MkInt(3));
            BoolExpr q = (BoolExpr)ctx.MkApp(r3, ctx.MkInt(2));
            BoolExpr a1 = ctx.MkNot(q);
            BoolExpr q1 = ctx.MkExists(vars, ctx.MkAnd(r3x, r2x));
            BoolExpr q2 = ctx.MkExists(vars, ctx.MkAnd(r3x, r1x));
            BoolExpr[] all = { a1, q1, q2 };
            return ctx.MkAnd(all);
        }


        /// <summary>
        /// Tests garbage collection by repeatedly allocating and freeing random expressions.
        /// </summary>

        public void Run()
        {
            System.DateTime before = System.DateTime.Now;

            Console.Write("Memory test ");
            System.GC.Collect();

            Context ctx = new Context(new Dictionary<string, string>() { { "MODEL", "true" } });

            System.Random rng = new System.Random(0);

            for (uint i = 0; i < 10000; i++)
            {                
                BoolExpr q = MkRandomExpr(ctx, rng);
                
                q = (BoolExpr)q.Simplify();

                //Goal g = ctx.MkGoal(true);
                //g.Assert(q);
                //Tactic t = ctx.MkTactic("simplify");
                //ApplyResult res = t.Apply(g);

                System.GC.Collect();
                if ((i % 1000) == 0) Console.Write(".");
            }

            Console.WriteLine();

            System.DateTime after = System.DateTime.Now;

            // Console.WriteLine("Memory test took " + (after - before).TotalSeconds + " sec");
        }
}