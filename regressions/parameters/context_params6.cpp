#include<iostream>
#include<sstream>
#include<z3++.h>
using namespace z3;

int main() {
  config cfg;

  // Problematic context parameters.
  cfg.set("memory_high_watermark", 0); // wrong value
  cfg.set("memory_max_size", 0);
  cfg.set("verbose", 10);
  cfg.set("warning", true);

  context ctx(cfg);
}
