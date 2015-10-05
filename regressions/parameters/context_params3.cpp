
/*++
Copyright (c) 2015 Microsoft Corporation

--*/

#include<iostream>
#include<sstream>
#include<z3++.h>
using namespace z3;

int main() {
  config cfg;
  cfg.set("unsat_kore", true); // wrong parameter name
  context ctx(cfg);
}
