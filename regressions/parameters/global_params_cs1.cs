using Microsoft.Z3;
using System;
using System.Collections.Generic;

class Test
{
  public static void Main() {
    Dictionary<string, string> cfg = new Dictionary<string, string>() {};

    Global.SetParameter("smt.arith.nl.rounds", "2"); // OK
    Global.SetParameter("smt.arith.nl", "true"); // OK
    
    Context ctx = new Context(cfg);	
  }
}
