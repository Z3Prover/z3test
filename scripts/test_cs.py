from util import *
import sys
# Usage: z3-lib-dir benchmark-dir
test_cs(sys.argv[1], sys.argv[2], ext="cs", timeout_duration=60.0)
exit(0)
