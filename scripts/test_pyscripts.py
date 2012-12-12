from util import *
import sys
# Usage: z3-lib-dir benchmark-dir
test_pyscripts(sys.argv[1], sys.argv[2], ext="py", timeout_duration=60.0)
exit(0)
