using Microsoft.Z3;
using System;
using System.Collections.Generic;

class Test
{
  public static void Main() {
    Dictionary<string, string> cfg = new Dictionary<string, string>() {};

    Global.SetParameter("smt.arith.nl", "42"); // invalid (not an int)
    
    Context ctx = new Context(cfg);	
  }
}
