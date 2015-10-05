
/*++
Copyright (c) 2015 Microsoft Corporation

--*/

using Microsoft.Z3;
using System;
using System.Collections.Generic;

class Test
{
  public static void Main() {
    Dictionary<string, string> cfg = new Dictionary<string, string>() { 
      { "AUTO_CONFIG", "true" },
      { "auto_config", "true" }
    };
    
    Context ctx = new Context(cfg);	
  }
}
