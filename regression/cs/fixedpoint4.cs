using Microsoft.Z3;
using System;


class Test
{
    public void Run()
    {        
        using (Context ctx = new Context()) {
            ctx.UpdateParamValue("DL_ENGINE","1");
            ctx.UpdateParamValue("DL_PDR_USE_FARKAS","true");
//          ctx.UpdateParamValue("VERBOSE","2");
            var s = ctx.MkFixedpoint();
            BoolSort B = ctx.BoolSort;
            IntSort I = ctx.IntSort;
            FuncDecl mc = ctx.MkFuncDecl("mc", new Sort[]{I, I}, B);
            ArithExpr x = (ArithExpr)ctx.MkBound(0,I);
            ArithExpr y = (ArithExpr)ctx.MkBound(1,I);
            ArithExpr z = (ArithExpr)ctx.MkBound(2,I);
            s.RegisterRelation(mc);
            BoolExpr gt = ctx.MkGt(x, ctx.MkInt(100));
            s.AddRule(ctx.MkImplies(gt,(BoolExpr)mc[x,ctx.MkSub(x,ctx.MkInt(10))]));
            s.AddRule(ctx.MkImplies(ctx.MkAnd(ctx.MkNot(gt), 
                                      (BoolExpr) mc[ctx.MkAdd(x,ctx.MkInt(11)),y], 
                                      (BoolExpr) mc[y,z]), 
                                      (BoolExpr) mc[x,z]));
            Console.WriteLine(s.Query(ctx.MkAnd((BoolExpr)mc[x,y], ctx.MkGt(y,ctx.MkInt(100)))));
            Console.WriteLine(s.GetAnswer());

            Console.WriteLine(s.Query(ctx.MkAnd((BoolExpr)mc[x,y], ctx.MkLt(y,ctx.MkInt(91)))));
            Console.WriteLine(s.GetAnswer());
        }
    }
}
