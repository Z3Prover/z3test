
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
        using (Context ctx = new Context()) {
            Symbol s1 = ctx.MkSymbol(1);
            Symbol s2 = ctx.MkSymbol(1);
            Symbol s3 = ctx.MkSymbol(2);
            Sort[] domain = new Sort[0];
	    Sort range = ctx.IntSort;
            TestDriver.CheckAssertion("a1", s1 == s2);
            TestDriver.CheckAssertion("a2", s1 != s3);
            TestDriver.CheckAssertion("a3", ctx.MkSymbol("x") != s1);
            TestDriver.CheckAssertion("a4", ctx.MkSymbol("x") == ctx.MkSymbol("x"));
            TestDriver.CheckAssertion("a5", ctx.MkFuncDecl("f", domain, range) == ctx.MkFuncDecl("f", domain, range));
            TestDriver.CheckAssertion("a6", ctx.MkFuncDecl("f", domain, range) != ctx.MkFuncDecl("g", domain, range));
            TestDriver.CheckAssertion("a7", ctx.MkUninterpretedSort("s") == ctx.MkUninterpretedSort("s"));
            TestDriver.CheckAssertion("a8", ctx.MkUninterpretedSort("s") != ctx.MkUninterpretedSort("t"));
            TestDriver.CheckAssertion("a9", ctx.MkUninterpretedSort("s") != ctx.IntSort);
            TestDriver.CheckAssertion("a10", ctx.MkConst("x", range) == ctx.MkConst("x", range));
            TestDriver.CheckAssertion("a11", ctx.MkConst("x", range) == ctx.MkConst(ctx.MkSymbol("x"), range));
            TestDriver.CheckAssertion("a12", ctx.MkConst("x", range) != ctx.MkConst("y", range));
        }
    }

}