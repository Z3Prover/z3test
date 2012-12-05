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
            
            Console.WriteLine(ctx.MkEq(x, y));
            Console.WriteLine(ctx.MkNot(ctx.MkEq(x, y)));

            BoolExpr f1 = ctx.MkEq(x, y);
            BoolExpr f2 = ctx.MkEq(x, y);
            BoolExpr f3 = ctx.MkNot(ctx.MkEq(x, y));

            Console.WriteLine(f1 == f2);
            Console.WriteLine(f2 == f1);
            Console.WriteLine(f1 == f3);

            FuncDecl f = ctx.MkFuncDecl("f", new Sort[] { ctx.IntSort, ctx.RealSort }, ctx.IntSort);

            IntExpr a = ctx.MkIntConst("a");
            IntExpr b = ctx.MkIntConst("b");
            
            Console.WriteLine(ctx.MkGt((IntExpr)f[a, ctx.MkInt2Real(a)], b));
            Console.WriteLine(f.Range);
            Console.WriteLine(f.Arity);
            Console.WriteLine(f.Domain[0]);
            Console.WriteLine(f.Domain[1]);
            Console.WriteLine(f.DeclKind == Z3_decl_kind.Z3_OP_UNINTERPRETED);
            Console.WriteLine(ctx.MkAdd(a, b).FuncDecl.DeclKind == Z3_decl_kind.Z3_OP_ADD);
            Console.WriteLine(ctx.MkAdd(a, b).FuncDecl.DeclKind == Z3_decl_kind.Z3_OP_UNINTERPRETED);
        }
    }
}