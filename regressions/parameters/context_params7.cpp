
/*++
Copyright (c) 2015 Microsoft Corporation

--*/

#include<iostream>
#include<sstream>
#include<z3++.h>
using namespace z3;

int main() {
  config cfg;

  cfg.set("auto_config", 1); // wrong value

  context ctx(cfg);
}
