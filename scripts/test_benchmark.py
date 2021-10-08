#!/usr/bin/env python
# Copyright (c) 2015 Microsoft Corporation
from util import *
import sys
# Usage: z3  benchmark
test_benchmark(sys.argv[1], sys.argv[2], timeout=60)
exit(0)
