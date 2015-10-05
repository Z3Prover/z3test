
/*++
Copyright (c) 2015 Microsoft Corporation

--*/

#include<iostream>
#include<sstream>
#include<z3++.h>
using namespace z3;

int main() {
  config cfg;
  cfg.set("UNSAT_CORE", true); // OK
  cfg.set("unsat_core", true); // OK
  cfg.set(":unsat_core", true); // Expected failure
  context ctx(cfg);
}
