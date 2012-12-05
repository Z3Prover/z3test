using Microsoft.Z3;
using System;

class Test
{

    public void Run()
    {        
        using (Context ctx = new Context())
        {
            Sort U = ctx.MkUninterpretedSort("U");
            FuncDecl f = ctx.MkFuncDecl("f", U, U);
            Expr a = ctx.MkConst("a", U);
            Expr b = ctx.MkConst("b", U);
            Expr c = ctx.MkConst("c", U);

            Solver s = ctx.MkSolver();
            s.Assert(ctx.MkEq(f[f[a]], b),
                     ctx.MkNot(ctx.MkEq(f[b], c)),
                     ctx.MkEq(f[c], c));
            Console.WriteLine(s.Check());
            Model m = s.Model;
            foreach (FuncDecl d in m.Decls)
                if (d.DomainSize == 0)
                    Console.WriteLine(d.Name + " -> " + m.ConstInterp(d));
                else 
                    Console.WriteLine(d.Name + " -> " + m.FuncInterp(d));
            
            Console.WriteLine(m.NumSorts);
            Console.WriteLine(m.Sorts[0]);

            foreach(Sort srt in m.Sorts)
                Console.WriteLine(srt);
            
            foreach (Expr v in m.SortUniverse(U))
                Console.WriteLine(v);
        }
    }
}