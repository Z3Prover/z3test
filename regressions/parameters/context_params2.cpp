#include<iostream>
#include<sstream>
#include<z3++.h>
using namespace z3;

int main() {
  config cfg;
  cfg.set("unsat_core", true); // OK
  context ctx(cfg);
}
