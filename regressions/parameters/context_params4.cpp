#include<iostream>
#include<sstream>
#include<z3++.h>
using namespace z3;

int main() {
  config cfg;
  cfg.set("arith.nl.rounds", 2); // invalid parameter name
  cfg.set("smt.arith.nl.rounds", 3); // invalid parameter name
  context ctx(cfg);
}
