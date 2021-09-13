from util import *
import sys
# Usage: z3-install-dir benchmark-dir
test_cpp(sys.argv[1], sys.argv[2], timeout_duration=1800.0)
exit(0)
