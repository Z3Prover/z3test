using Microsoft.Z3;
using System;

class Test
{

    public void Run()
    {        
        using (Context ctx = new Context())
        {
            RealExpr x = ctx.MkRealConst("x");
            RealExpr y = ctx.MkRealConst("y");
            RealExpr z = ctx.MkRealConst("z");

            FuncDecl f = ctx.MkFuncDecl("f", ctx.RealSort, ctx.RealSort);
            Solver s = ctx.MkSolver();

            s.Assert(ctx.MkGt(x, ctx.MkReal(10)),
                     ctx.MkEq(y, ctx.MkAdd(x, ctx.MkReal(3))),
                     ctx.MkLt(y, ctx.MkReal(15)),
                     ctx.MkGt((RealExpr)f[x], ctx.MkReal(2)),
                     ctx.MkNot(ctx.MkEq(f[y], f[x])));
            
            Console.WriteLine(s.Check());
            
            Model m = s.Model;
            
            foreach (FuncDecl fd in m.Decls)
                Console.Write(" " + fd.Name);
            Console.WriteLine();

            foreach (FuncDecl fd in m.Decls)
            {
                if (fd.DomainSize == 0)
                    Console.WriteLine(fd.Name + " -> " + m.ConstInterp(fd));
                else
                    Console.WriteLine(fd.Name + " -> " + m.FuncInterp(fd));
            }

            Console.WriteLine(m.Evaluate(ctx.MkAdd(z, ctx.MkReal(1))));
            Console.WriteLine(m.Evaluate(ctx.MkAdd(z, ctx.MkReal(1)), true));
            Console.WriteLine(m.Evaluate(z));

            FuncInterp fi = m.FuncInterp(f);

            Console.WriteLine(fi.Else);
            Console.WriteLine(fi.NumEntries);
            Console.WriteLine(fi.Entries[0]);
            Console.WriteLine(fi.Entries[0].NumArgs);
            Console.WriteLine(fi.Entries[0].Args[0]);
            Console.WriteLine(fi.Entries[0].Value);

            ArrayExpr a = ctx.MkArrayConst("a", ctx.RealSort, ctx.RealSort);
            s.Assert(ctx.MkGt((RealExpr)ctx.MkSelect(a, x), ctx.MkReal(10)),
                     ctx.MkGt((RealExpr)ctx.MkSelect(a, y), ctx.MkReal(20)));

            Console.WriteLine(s);
            Console.WriteLine(s.Check());
            Console.WriteLine(s.Model);
            Console.WriteLine(s.Model.Evaluate(a));
            Console.WriteLine(s.Model.FuncInterp(a.FuncDecl));
        }
    }
}