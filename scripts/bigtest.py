# Test for big machines that have
#   Java and clang installed
#   lots of frees space
import util
import config
import datetime
import sys

def bigtest():
    print "BUILD DATE:", datetime.date.today()
    sys.stdout.flush()
    # Build everything:
    #   - using clang and g++
    #   - release and debug modes
    for b in ['unstable']:
        for d in [True, False]:
            for c in [True, False]:
                util.buildz3(branch=b, everything=True, clean=True, debug=d,  java=True, static=True, jobs=config.NUMJOBS, clang=c)
                util.testz3py(branch=b, debug=d, clang=c)
                util.testjavaex(branch=b, debug=d, clang=c)
                util.testz3ex('cpp_example', branch=b, debug=d, clang=c)
                util.testz3ex('c_example', branch=b, debug=d, clang=c)
                util.test_benchmarks_using_latest('regressions/smt2', branch=b, debug=d, clang=c)
                if d:
                    util.test_benchmarks_using_latest('regressions/smt2-debug', branch=b, debug=d, clang=c)
                    util.test_benchmarks_using_latest('regressions/smt2-extra', branch=b, debug=d, clang=c)
                    util.test_pyscripts_using_latest('regressions/python', branch=b, debug=d, clang=c)
            if util.is_windows():
                util.test_cs_using_latest('regressions/cs', branch=b, debug=d, clang=False)
    util.buildz3(branch='mcsat', everything=True, clean=True, debug=True,  java=False, static=False, jobs=config.NUMJOBS, clang=False)
#   util.buildz3(branch='tptp', everything=True, clean=True, debug=True,  java=False, static=False, jobs=config.NUMJOBS, clang=False)
    util.test_pyscripts_using_latest('regressions/mcsat', branch='mcsat', debug=True, clang=False)
    util.test_benchmarks_using_latest('regressions/mcsat_smt2', branch='mcsat', debug=True, clang=False)
    util.test_benchmarks_using_latest('regressions/parameters', branch=b, debug=d, clang=False)
    util.test_pyscripts_using_latest('regressions/parameters', branch=b, debug=d, clang=False)

if __name__ == "__main__":
    bigtest()
    exit(0)
