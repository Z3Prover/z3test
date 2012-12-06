import os
import subprocess
import shutil
import config 

def is_windows():
    return os.name == 'nt'

def is_linux():
    return os.name == 'posix' and os.uname()[0] == 'Linux'

def is_freebsd():
    return os.name == 'posix' and os.uname()[0] == 'FreeBSD'

def is_osx():
    return os.name == 'posix' and os.uname()[0] == 'Darwin'

# Goodie for changing the directory
class cd:
    def __init__(self, newPath):
        self.newPath = newPath

    def __enter__(self):
        self.savedPath = os.getcwd()
        os.chdir(self.newPath)

    def __exit__(self, etype, value, traceback):
        os.chdir(self.savedPath)

class setenv:
    def __init__(self, var, val):
        self.var = var
        self.val = val
        self.old_val = None

    def __enter__(self):
        if self.var in os.environ:
            self.old_val = os.environ[self.var]
        os.environ[self.var] = self.val

    def __exit__(self, etype, value, traceback):
        if self.old_val == None:
            os.environ.pop(self.var)
        else:
            os.environ[self.var] = self.old_val

def rmf(path):
    if not os.path.exists(path):
        return # nothing to be done
    if not os.path.isdir(path):
        os.path.remove(path)
    else:
        shutil.rmtree(path)

def mk_dir(d):
    if not os.path.exists(d):
        os.makedirs(d)

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

def gitcheckout(branch):
    if subprocess.call([config.GIT, 'checkout', branch]) != 0:
        raise Exception("Failed to checkout branch '%s' at '%s'" % (branch, os.getcwd()))

def gitpull(branch):
    if subprocess.call([config.GIT, 'pull', '--commit', config.ORIGIN, branch]) != 0:
        raise Exception("Failed to pull latest changes from branch '%s' (from codeplex) at '%s'" % (branch, os.getcwd()))

def get_builddir(branch, debug, clang):
    if clang:
        branch = '%s-clang' % branch
    if debug:
        return os.path.join(config.BUILDDIR, branch, 'debug')
    else:
        return os.path.join(config.BUILDDIR, branch, 'release')

def mk_make(branch, debug, java, clang, static, VS64):
    cmd = ['python', os.path.join('scripts', 'mk_make.py'), '-b', get_builddir(branch, debug, clang) ]
    if debug:
        cmd.append('-d')
    if VS64 and is_windows():
        cmd.append('-x')
    if java:
        cmd.append('--java')
    if static:
        cmd.append('--staticlib')
    if clang:
        with setenv('CXX', 'clang++'):
            with setenv('CC', 'clang'):
                if subprocess.call(cmd) != 0:
                    raise Exception("Failed to execute mk_make\n%s" % cmd)
    else:
        if subprocess.call(cmd) != 0:
            raise Exception("Failed to execute mk_make\n%s" % cmd)
    
def make(branch, debug, everything, clang, jobs):
    bdir = get_builddir(branch, debug, clang)
    with cd(bdir):
        if is_windows():
            cmd = ['nmake']
        else:
            cmd = ['make', '-j', str(jobs)]
        if everything:
            cmd.append('all')
            cmd.append('test')
            cmd.append('examples')
        if subprocess.call(cmd) != 0:
            raise Exception("Failed to make Z3\n%s\n" % cmd)
        

def buildz3(branch="unstable", everything=False, clean=False, debug=True, java=False, clang=False, static=False, VS64=False, jobs=16):
    z3dir = find_z3depot()
    with cd(z3dir):
        gitcheckout(branch)
        gitpull(branch)
        bdir = get_builddir(branch, debug, clang)
        if clean:
            rmf(bdir)
        mk_dir(bdir)
        mk_make(branch, debug, java, clang, static, VS64)
        make(branch, debug, everything, clang, jobs)

def testz3py(branch="unstable", debug=True, clang=False):
    z3dir = find_z3depot()
    bdir = get_builddir(branch, debug, clang)
    p    = os.path.join(z3dir, bdir)
    with cd(p):
        if subprocess.call([config.PYTHON, 'z3test.pyc']) != 0:
            raise Exception("Failed to execute Z3 python regression tests 'z3test.pyc' at '%s'" % p)

def testjavaex(branch="unstable", debug=True, clang=False):
    z3dir = find_z3depot()
    bdir = get_builddir(branch, debug, clang)
    p    = os.path.join(z3dir, bdir)
    with cd(p):
        print p
        if is_windows():
            if subprocess.call([config.JAVA, '-cp', 'com.microsoft.z3.jar;.', 'JavaExample']) != 0:
                raise Exception("Failed to execute Java example at '%s'" % p)
        elif is_osx():
            if subprocess.call([config.JAVA, '-cp', 'com.microsoft.z3.jar:.', 'JavaExample']) != 0:
                raise Exception("Failed to execute Java example at '%s'" % p)            
        elif is_linux() or is_freebsd():
            with setenv('LD_LIBRARY_PATH', '.'):
                if subprocess.call([config.JAVA, '-cp', 'com.microsoft.z3.jar:.', 'JavaExample']) != 0:
                    raise Exception("Failed to execute Java example at '%s'" % p)

def testz3ex(exe, branch="unstable", debug=True, clang=False):
    z3dir = find_z3depot()
    bdir = get_builddir(branch, debug, clang)
    p    = os.path.join(z3dir, bdir)
    with cd(p):
        with setenv('PATH', '.'):
            if is_windows() or is_osx():
                if subprocess.call([exe]) != 0:
                    raise Exception("Failed to execute '%s' at '%s'" % (exe, p))
            elif is_linux() or is_freebsd():
                with setenv('LD_LIBRARY_PATH', '.'):
                    if subprocess.call([exe]) != 0:
                        raise Exception("Failed to execute '%s' at '%s'" % (exe, p))

# buildz3(java=True, everything=True)
# testjavaex()                
# testz3ex('cpp_example')
# testz3ex('c_example')    
