# Module for locating the Z3 main repository
import os

def is_z3depot(path):
    """
    Return true if the Z3 main repository is located in the given path. 
    The function checks the existence of several files.
    """
    for f in ["README", "LICENSE.txt", ".git", "RELEASE_NOTES", os.path.join("src", "ast", "ast.cpp")]:
        if not os.path.exists(os.path.join(path, f)):
            return False
    return True

def find_z3depot():
    """
    Try to find the Z3 main repository along the current path.
    The environment variable Z3DIR is also used.
    """
    c = os.getenv("Z3DIR", None)
    if c != None and c != "":
        if is_z3depot(c):
            return c
        else:
            raise Exception("Environment variable Z3DIR does not seem to contain the correct path to the Z3 repository.\nZ3DIR=%s" % c)
    p = os.getcwd()
    l = p.split(os.sep)
    n = len(l)
    for i in range(n):
        c = os.path.join(os.sep, os.path.join(*l[:n-i]), "z3")
        if is_z3depot(c):
            return c
    raise Exception("Failed to find path to the Z3 repository, try to set the environment variable Z3DIR")

if __name__ == "__main__":
    print find_z3depot()

