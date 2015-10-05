
# Copyright (c) 2015 Microsoft Corporation
from z3 import *
set_option(auto_config=True)

# print RealVal("1e-10")
# print RealVal("1.3e-2")
# exit(0);

print RealVal("1/3")
print RealVal("1e-10")
print RealVal("1.3e-2")
print RealVal("1")
print RealVal("23")
print RealVal("1e10")
print RealVal("1.3e2")
print RealVal("32e-3")
print RealVal("34.31e2")
print RealVal("2.33e-2")
print RealVal("12.33")
print "-----"
print RealVal("-1/3")
print RealVal("-1e-10")
print RealVal("-1.3e-2")
print RealVal("-1")
print RealVal("-23")
print RealVal("-1e10")
print RealVal("-1.3e2")
print RealVal("-32e-3")
print RealVal("-34.31e2")
print RealVal("-2.33e-2")
print RealVal("-12.33")
