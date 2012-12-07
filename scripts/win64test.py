# Test for x64 Windows machines
import util
import os

def win64test(b="unstable"):
    # Build debug and release modes
    for d in [True, False]:
        util.buildz3(branch=b, everything=False, clean=True, debug=d,  java=False, static=False, jobs=1, clang=False, VS64=True)
        util.testz3py(branch=b, debug=b, clang=False)

if __name__ == "__main__":
    win64test()
