#include<iostream>
#include<sstream>
#include<z3++.h>
using namespace z3;

int main() {
  config cfg;

  // All good context paramters.
  cfg.set("auto_config", true);
  cfg.set("check_interpolants", true);
  cfg.set("debug_ref_count", true);
  cfg.set("model", true);
  cfg.set("model_validate", true);
  cfg.set("proof", true);
  cfg.set("smtlib2_compliant", true);
  cfg.set("timeout", 1200);
  cfg.set("trace", true);
  cfg.set("trace_file_name", "z3.log");
  cfg.set("type_check", true);
  cfg.set("unsat_core", true);
  cfg.set("well_sorted_check", true);

  context ctx(cfg);
}
