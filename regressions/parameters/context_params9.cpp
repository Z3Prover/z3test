#include<iostream>
#include<sstream>
#include<z3++.h>
using namespace z3;

int main() {
  config cfg;

  cfg.set("timeout", 1200); // OK
  // cfg.set("timeout", 4294967295); // Does not compile; expects signed int
  cfg.set("timeout", "4294967295"); // OK?
  cfg.set("timeout", "Blah."); // OK?

  context ctx(cfg);
}
