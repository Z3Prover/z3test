
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
    p.Add("blah", "blah"); // Invalid parameter.

    Solver s = ctx.MkSolver();
    s.Parameters = p;
    s.Check(); // Complains by throwing an assertion (OK).
  }
}
