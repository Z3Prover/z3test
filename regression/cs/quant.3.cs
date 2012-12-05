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
            Sort T = ctx.MkUninterpretedSort("Type");
            FuncDecl subtype = ctx.MkFuncDecl("subtype", new Sort[] { T, T }, ctx.BoolSort);
            FuncDecl array_of = ctx.MkFuncDecl("array_of", T, T);
            Expr root = ctx.MkConst("root", T);

            Expr x = ctx.MkConst("x", T);
            Expr y = ctx.MkConst("y", T);
            Expr z = ctx.MkConst("z", T);

            BoolExpr[] axioms = new BoolExpr[] {
                ctx.MkForall(new Expr[] { x }, subtype[x, x]),
                ctx.MkForall(new Expr[] { x, y , z }, ctx.MkImplies(ctx.MkAnd((BoolExpr)subtype[x,y], (BoolExpr)subtype[y,z]), (BoolExpr)subtype[x,z])),
                ctx.MkForall(new Expr[] { x, y }, ctx.MkImplies(ctx.MkAnd((BoolExpr)subtype[x, y], (BoolExpr)subtype[y,x]), ctx.MkEq(x, y))),
                ctx.MkForall(new Expr[] { x, y, z }, ctx.MkImplies(ctx.MkAnd((BoolExpr)subtype[x,y],(BoolExpr)subtype[x,z]), 
                                                                   ctx.MkOr((BoolExpr)subtype[y,z], (BoolExpr)subtype[z,y]))),
                ctx.MkForall(new Expr[] { x, y }, ctx.MkImplies((BoolExpr)subtype[x,y], (BoolExpr)subtype[array_of[x], array_of[y]])),
                ctx.MkForall(new Expr[] { x }, (BoolExpr) subtype[root, x])
            };

            Solver s = ctx.MkSolver();
            s.Assert(axioms);
            Console.WriteLine(s);
            Console.WriteLine(s.Check());
            Expr[] universe = s.Model.SortUniverse(T);
            foreach (var e in universe)
                Console.WriteLine(e);
            Console.WriteLine(s.Model);
        }
    }
}