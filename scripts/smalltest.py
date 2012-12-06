# Test for small machines
#   Skip java and clang
import util
import os

NUMJOBS=os.getenv("MAKEJOBS", 16)

def smalltest(b="unstable"):
    # Build debug and release modes
    for d in [True, False]:
        util.buildz3(branch=b, everything=False, clean=True, debug=d,  java=False, static=False, jobs=NUMJOBS, clang=False)
        util.testz3py(branch=b, debug=b, clang=False)

if __name__ == "__main__":
    smalltest()
