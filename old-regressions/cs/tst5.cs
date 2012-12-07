using Microsoft.Z3;
using System;

class Test
{

    public void Run()
    {        
        using (Context ctx = new Context())
        {
            FuncDecl f = ctx.MkFuncDecl("f", new Sort[] { ctx.IntSort, ctx.RealSort }, ctx.IntSort);

            try
            {
                Console.WriteLine(f.Domain[3]);
            }
            catch (IndexOutOfRangeException ex)
            {
                Console.WriteLine("failed: " + ex.Message);
            }

            IntExpr x = ctx.MkIntConst("x");

            Console.WriteLine(f[ctx.MkInt(1), ctx.MkReal(1)]);
            Console.WriteLine(f[ctx.MkInt(1), ctx.MkReal(1)].Sort);
            Console.WriteLine(f[ctx.MkInt(1), ctx.MkReal(1)].NumArgs);
            foreach (Expr e in f[ctx.MkAdd(x, ctx.MkInt(1)), ctx.MkReal(1)].Args)
            Console.WriteLine(e);
            Console.WriteLine(f[ctx.MkAdd(x, ctx.MkInt(1)), ctx.MkReal(1)].Args[0]);
            Console.WriteLine(f[ctx.MkAdd(x, ctx.MkInt(1)), ctx.MkReal(1)].Args[0].Equals(ctx.MkAdd(x, ctx.MkInt(1))));
            Console.WriteLine(f[ctx.MkAdd(x, ctx.MkInt(1)), ctx.MkReal(1)].FuncDecl[ctx.MkInt(2), ctx.MkInt2Real((IntExpr)ctx.MkAdd(x, ctx.MkInt(1)))]);

            Console.WriteLine(ctx.MkInt(1).IsExpr);
            Console.WriteLine(ctx.MkAdd(x, ctx.MkInt(1)).IsExpr);
            Console.WriteLine(ctx.MkForall(new Expr[] { x }, ctx.MkGt(x, ctx.MkInt(0))).IsExpr);
            Console.WriteLine(ctx.MkInt(1).IsConst);
            Console.WriteLine(x.IsConst);
            Console.WriteLine(ctx.MkAdd(x, ctx.MkInt(1)).IsConst);
            Console.WriteLine(ctx.MkForall(new Expr[] { x }, ctx.MkGt(x, ctx.MkInt(0))).IsConst);

            Console.WriteLine(ctx.MkForall(new Expr[] { x }, ctx.MkGt(x, ctx.MkInt(0))).Body.Args[0]);
            Console.WriteLine(ctx.MkForall(new Expr[] { x }, ctx.MkGt(x, ctx.MkInt(0))).Body.Args[0].IsExpr);
            Console.WriteLine(ctx.MkForall(new Expr[] { x }, ctx.MkGt(x, ctx.MkInt(0))).Body.Args[0].IsConst);
            Console.WriteLine(ctx.MkForall(new Expr[] { x }, ctx.MkGt(x, ctx.MkInt(0))).Body.Args[0].IsVar);
            Console.WriteLine(x.IsVar);
            Console.WriteLine(ctx.MkITE(ctx.MkTrue(), x, ctx.MkAdd(x, ctx.MkInt(1))));

            Context ctx1 = new Context();
            Console.WriteLine(ctx1.MkITE(ctx1.MkTrue(), x.Translate(ctx1), ctx.MkAdd(x, ctx.MkInt(1)).Translate(ctx1)));
            Console.WriteLine(ctx.MkITE(ctx.MkTrue(), ctx.MkInt(1), ctx.MkInt(1)));

            Console.WriteLine(ctx.MkDistinct(x, ctx.MkAdd(x, ctx.MkInt(1)), ctx.MkAdd(x, ctx.MkInt(2))));

            Console.WriteLine(ctx1.MkAnd(ctx1.MkDistinct(x.Translate(ctx1), ctx1.MkInt(1)),
                                         ctx1.MkGt((IntExpr)x.Translate(ctx1), ctx1.MkInt(0))));
                        
        }
    }
}