
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

    Global.SetParameter("smt.arith.nl.rounds", "abc"); // invalid (not a string)
    Global.SetParameter("smt.arith.nl.rounds", "true"); // invalid (not a Boolean)
    
    Context ctx = new Context(cfg);	
  }
}
