
# Copyright (c) 2015 Microsoft Corporation
from z3 import *

Fruit = DeclareSort('Fruit')
Fruit2 = DeclareSort('Fruit')
assert(Fruit == Fruit2)
scriptStr = "(declare-sort Fruit) (declare-const a Fruit) (declare-const b Fruit) (assert (= a b))\n"
assertions = parse_smt2_string(scriptStr)
if isinstance(assertions, AstVector):
   assertions = assertions[0]
assert(assertions.arg(0).sort() == Fruit)
assert(Fruit.kind() == Z3_UNINTERPRETED_SORT)
assert(assertions.arg(0).sort().kind() == Z3_UNINTERPRETED_SORT)
