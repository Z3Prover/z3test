# Copyright (c) 2015 Microsoft Corporation
from util import *
import sys
import multiprocessing

if __name__ == '__main__':
  multiprocessing.freeze_support()
  # Usage: z3 benchmark-dir
  test_benchmarks(sys.argv)
  exit(0)
