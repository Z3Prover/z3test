# Test for x64 Windows machines
import util
import os

def win64test(b="unstable"):
    # Build debug and release modes
    for d in [True, False]:
        util.buildz3(branch=b, everything=False, clean=True, debug=d,  java=True, static=False, jobs=1, clang=False, VS64=True)
        util.testz3py(branch=b, debug=d, clang=False)
        util.testjavaex(branch=b, debug=d, clang=False)
        util.testz3ex('cpp_example', branch=b, debug=d, clang=False)
        util.testz3ex('c_example', branch=b, debug=d, clang=False)
        util.test_benchmarks_using_latest('regressions/smt2', branch=b, debug=d, clang=False)
        util.test_benchmarks_using_latest('regressions/smt2-extra', branch=b, debug=d, clang=False)
        util.test_pyscripts_using_latest('regressions/python', branch=b, debug=d, clang=False)

if __name__ == "__main__":
    win64test()
