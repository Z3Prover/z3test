
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

    Global.SetParameter("arith.nl.rounds", "2"); // invalid (missing scope)
    Global.SetParameter("arith.nl", "true"); // invalid(missing scope)
    
    Context ctx = new Context(cfg);	
  }
}
