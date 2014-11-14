using Microsoft.Z3;
using System;
using System.Collections.Generic;

class Test
{
  public static void Main() {
    Dictionary<string, string> cfg = new Dictionary<string, string>() { 
      { "smt.arith.nl.rounds", "2" }, // These are not context parameters!
      { "smt.arith.nl", "true" }
    };		
    
    Context ctx = new Context(cfg);	
  }
}
