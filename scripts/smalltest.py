# Test for small machines
#   Skip java and clang
import util
import os
import config

def smalltest(b="unstable"):
    print "BUILD DATE:", datetime.date.today()
    # Build debug and release modes
    for d in [True, False]:
        util.buildz3(branch=b, everything=False, clean=True, debug=d,  java=False, static=False, jobs=config.NUMJOBS, clang=False)
        util.testz3py(branch=b, debug=d, clang=False)
        if d:
            util.test_benchmarks_using_latest('regressions/smt2-debug', branch=b, debug=d, clang=False)
        util.test_benchmarks_using_latest('regressions/smt2', branch=b, debug=d, clang=False)
        util.test_pyscripts_using_latest('regressions/python', branch=b, debug=d, clang=False)

if __name__ == "__main__":
    smalltest()
    exit(0)
