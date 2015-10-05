
/*++
Copyright (c) 2015 Microsoft Corporation

--*/

#include<iostream>
#include<sstream>
#include<z3++.h>
using namespace z3;

int main() {
  config cfg;

  cfg.set("trace_file_name", "abc"); // OK
  cfg.set("trace_file_name", 123); // OK?

  context ctx(cfg);
}
