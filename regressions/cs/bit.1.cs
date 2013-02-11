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
            BitVecExpr x = ctx.MkBVConst("x", 32);
            BitVecExpr[] powers = new BitVecExpr[32];
            for (uint i = 0; i < 32; i++)
                powers[i] = ctx.MkBVSHL(ctx.MkBV(1, 32), ctx.MkBV(i, 32));

            BoolExpr step_zero = ctx.MkEq(ctx.MkBVAND(x, ctx.MkBVSub(x, ctx.MkBV(1, 32))), ctx.MkBV(0, 32));

            BoolExpr fast = ctx.MkAnd(ctx.MkNot(ctx.MkEq(x, ctx.MkBV(0, 32))),
                                      step_zero);

            BoolExpr slow = ctx.MkFalse();
            foreach (BitVecExpr p in powers)
                slow = ctx.MkOr(slow, ctx.MkEq(x, p));

	    TestDriver.CheckString(fast, "(and (not (= x #x00000000)) (= (bvand x (bvsub x #x00000001)) #x00000000))");

            Solver s = ctx.MkSolver();
            s.Assert(ctx.MkNot(ctx.MkEq(fast, slow)));
            TestDriver.CheckUNSAT(s.Check());

            s = ctx.MkSolver();
            s.Assert(ctx.MkNot(step_zero));
            TestDriver.CheckSAT(s.Check());
        }
    }
}