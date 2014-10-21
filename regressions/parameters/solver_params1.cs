using Microsoft.Z3;
using System;
using System.Collections.Generic;

class Test
{
  public static void Main() {
    Context ctx = new Context();

    Params p = ctx.MkParams();
    p.Add("smt.arith.nl", true);
    p.Add("smt.arith.nl.rounds", 42);

    Solver s = ctx.MkSolver();
    s.Parameters = p;
    Console.WriteLine(s); // says "(solver)"

    s = ctx.MkSimpleSolver();
    s.Parameters = p;
    Console.WriteLine(s); // should also say "(solver)"
  }
}
