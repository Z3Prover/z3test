
/*++
Copyright (c) 2015 Microsoft Corporation

--*/

using Microsoft.Z3;
using System;
using System.Collections.Generic;

class Test
{
  public static void Main() {
    Dictionary<string, string> cfg = new Dictionary<string, string>() {};

    Global.SetParameter("smt.arith.nl.rounds", "42");
    Console.WriteLine("{0}", Global.GetParameter("smt.arith.nl.rounds"));

    Context ctx = new Context(cfg);	
  }
}
