# Test for x64 Windows machines
import util
import os
import sys
import datetime

def win64test(b="unstable"):
    print "BUILD DATE:", datetime.date.today()
    sys.stdout.flush()
    # Build debug and release modes
    for d in [True, False]:
        util.buildz3(branch=b, everything=True, clean=True, debug=d,  java=False, static=False, jobs=1, clang=False, VS64=True)
        util.testz3py(branch=b, debug=d, clang=False)
        #util.testjavaex(branch=b, debug=d, clang=False)
        util.testz3ex('cpp_example', branch=b, debug=d, clang=False)
        util.testz3ex('c_example', branch=b, debug=d, clang=False)
        util.test_benchmarks_using_latest('regressions/smt2', branch=b, debug=d, clang=False)
        util.test_benchmarks_using_latest('regressions/smt2-extra', branch=b, debug=d, clang=False)
        if d:
            util.test_benchmarks_using_latest('regressions/smt2-debug', branch=b, debug=d, clang=False)
        util.test_pyscripts_using_latest('regressions/python', branch=b, debug=d, clang=False)
        util.test_cs_using_latest('regressions/cs', branch=b, debug=d, VS64=True, clang=False)


if __name__ == "__main__":
    win64test()
    exit(0)
