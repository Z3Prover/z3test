
/*++
Copyright (c) 2015 Microsoft Corporation

--*/

using Microsoft.Z3;
using System;
using System.Collections.Generic;

class Test
{
  public static void Main() {
    Context ctx = new Context();

    Params p = ctx.MkParams();
    p.Add("blah", "blah"); // invalid parameter name

    Tactic t1 = ctx.MkTactic("smt");
    Tactic t2 = ctx.UsingParams(t1, p);
    Solver s = ctx.MkSolver(t2);
    s.Check();
  }
}
