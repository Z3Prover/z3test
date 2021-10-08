# Copyright (c) 2015 Microsoft Corporation

import os
import sys
import subprocess
import shutil
import config
import filecmp
import time
from multiprocessing import Pool

MAKEJOBS=os.getenv("MAKEJOBS", "24")

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
    for f in ["README.md", "LICENSE.txt", ".git", "RELEASE_NOTES", os.path.join("src", "ast", "ast.cpp")]:
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
    if is_z3depot(p):
        return p
    while True:
        new_p, h = os.path.split(p)
        if new_p == p:
            raise Exception("Failed to find path to the Z3 repository, try to set the environment variable Z3DIR")
        c = os.path.join(new_p, 'z3')
        if is_z3depot(c):
            return c
        p = new_p

def gitcheckout(branch):
    if subprocess.call([config.GIT, 'checkout', '-f', branch]) != 0:
        raise Exception("Failed to checkout branch '%s' at '%s'" % (branch, os.getcwd()))

def gitpull(branch):
    if subprocess.call([config.GIT, 'pull', '--commit', config.ORIGIN, branch]) != 0:
        raise Exception("Failed to pull latest changes from branch '%s' (from github) at '%s'" % (branch, os.getcwd()))

def get_builddir(branch, debug, clang):
    if clang:
        branch = '%s-clang' % branch
    if debug:
        return os.path.join(config.BUILDDIR, branch, 'debug')
    else:
        return os.path.join(config.BUILDDIR, branch, 'release')

def mk_make(branch, debug, dotnet, java, clang, static, VS64, extraflags):
    cmd = ['python', os.path.join('scripts', 'mk_make.py'), '-b', get_builddir(branch, debug, clang) ] + extraflags
    if debug:
        cmd.append('-d')
    if is_windows():
        cmd.append('--parallel=' + MAKEJOBS)
    if VS64 and is_windows():
        cmd.append('-x')
    if dotnet:
        cmd.append('--dotnet')
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

def print_dirlisting(bdir):
    print('Content of %s:' % bdir)
    for dirname, dirnames, filenames in os.walk(bdir):
        for subdirname in dirnames:
            print(os.path.join(dirname, subdirname))

        for filename in filenames:
            print(os.path.join(dirname, filename))

def buildz3(branch="master", everything=False, clean=False, debug=True, dotnet=False, java=False, clang=False, static=False, VS64=False, jobs=16, extraflags=[]):
    z3dir = find_z3depot()
    with cd(z3dir):
        gitcheckout(branch)
        gitpull(branch)
        bdir = get_builddir(branch, debug, clang)
        sys.stdout.flush()
        if clean:
            rmf(bdir)
        mk_dir(bdir)
        print_dirlisting(bdir)
        mk_make(branch, debug, dotnet, java, clang, static, VS64, extraflags)
        make(branch, debug, everything, clang, jobs)

def testz3py(branch="master", debug=True, clang=False):
    z3dir = find_z3depot()
    bdir = get_builddir(branch, debug, clang)
    p    = os.path.join(z3dir, bdir, "python")
    print('Testing docstrings in %s' % p)
    with cd(p):
        print('Testing z3test.py z3')
        if subprocess.call([config.PYTHON, 'z3test.py', 'z3']) != 0:
            raise Exception("Failed to execute Z3 python regression tests 'z3test.py' at '%s'" % p)
        print('Testing z3test.py z3num')
        if subprocess.call([config.PYTHON, 'z3test.py', 'z3num']) != 0:
            raise Exception("Failed to execute Z3 python regression tests 'z3num' at '%s'" % p)

def testjavaex(branch="master", debug=True, clang=False):
    z3dir = find_z3depot()
    bdir = get_builddir(branch, debug, clang)
    p    = os.path.join(z3dir, bdir)
    with cd(p):
        if is_windows():
            if subprocess.call(['cmd', '/c', config.JAVA, '-cp', 'com.microsoft.z3.jar;.', 'JavaExample']) != 0:
                raise Exception("Failed to execute Java example at '%s'" % p)
        elif is_osx():
            if subprocess.call([config.JAVA, '-cp', 'com.microsoft.z3.jar:.', 'JavaExample']) != 0:
                raise Exception("Failed to execute Java example at '%s'" % p)
        elif is_linux() or is_freebsd():
            with setenv('LD_LIBRARY_PATH', '.'):
                if subprocess.call([config.JAVA, '-cp', 'com.microsoft.z3.jar:.', 'JavaExample']) != 0:
                    raise Exception("Failed to execute Java example at '%s'" % p)

def testz3ex(exe, branch="master", debug=True, clang=False):
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


# The duration is in seconds. It can be a float such as 0.001
def timeout(func, args=(), kwargs={}, timeout_duration=1.0, default=None):
    import threading
    class InterruptableThread(threading.Thread):
        def __init__(self):
            threading.Thread.__init__(self)
            self.result = None
            self.exception = None

        def run(self):
            try:
                self.result = func(*args, **kwargs)
            except Exception as ex:
                self.exception = ex

    it = InterruptableThread()
    it.start()
    it.join(timeout_duration)
    if it.exception is not None:
        raise it.exception
    if it.is_alive():
        return default
    else:
        return it.result

def subprocess_killer(args, stdin=None, stdout=None, stderr=None, shell=False, env=None, timeout=1.0):
    try:
        if shell:
            args = ''.join(a + ' ' for a in args)
            if not is_windows():
                for k, v in env.items():
                    args = k + '=' + v + ' ' + args
        p = subprocess.Popen(args, stdin=stdin, stdout=stdout, stderr=stderr, shell=shell, env=env)
        start = time.time()
        time.sleep(0.02)
        while (p.poll() == None):
            time.sleep(0.1)
            if (time.time() - start) > timeout:
                p.kill()
        return p.returncode
    except Exception as ex:
        print('Exception: %s' % ex)
        return 0

def test_benchmark(z3exe, benchmark, timeout, expected=None):
    if not os.path.exists(benchmark):
        raise Exception("Benchmark '%s' does not exist" % benchmark)
    base, ext = os.path.splitext(benchmark)
    if expected == None:
        expected = '%s.expected.out' % base
    if not os.path.exists(expected):
        raise Exception("Expected answer file '%s' does not exist" % benchmark)
    produced  = '%s.produced.out' % base
    producedf = open(produced, 'w')
    errcode = 0
    try:
        errcode = subprocess_killer([z3exe, 'model_validate=true', benchmark], stdout=producedf, stderr=producedf, timeout=timeout, env=os.environ)
    except:
        raise Exception("Failed to start Z3: %s" % z3exe)
    producedf.close()
    if errcode != 0 and errcode != 1 and errcode != 105:
        raise Exception("Z3 (%s) returned unexpected error code %s for %s" % (z3exe, errcode, benchmark))
    if not filecmp.cmp(expected, produced):
        print("EXPECTED")
        print(open(expected, 'r').read())
        print("======================")
        print("PRODUCED")
        print(open(produced, 'r').read())
        print("======================")
        raise Exception("Z3 (%s) produced unexpected output for %s" % (z3exe, benchmark))
    return True

def run_one(z3exe, benchdir, benchmark, timeout_duration):
  try:
      bench = os.path.join(benchdir, benchmark)
      print("Testing %s" % bench)
      if timeout(test_benchmark,
                  args=(z3exe, bench, timeout_duration),
                  timeout_duration=timeout_duration,
                  default=False) == False:
          raise Exception("Timeout executing benchmark %s using %s" % (bench, z3exe))
  except Exception as ex:
      print("Failed")
      print(ex)
      return True
  return False

def test_benchmarks(argv):
    z3exe = argv[1]
    benchdir = argv[2]
    ext = argv[3] if len(argv) > 3 else "smt2"
    num_threads = int(argv[4]) if len(argv) > 4 else 0
    timeout_duration = float(argv[5]) if len(argv) > 5  else 60.0

    print("Testing benchmarks at %s using %s" % (benchdir, z3exe))
    error = False
    benchmarks = filter(lambda f: f.endswith(ext), os.listdir(benchdir))

    if num_threads == 0:
      for benchmark in benchmarks:
        if (run_one(z3exe, benchdir, benchmark, timeout_duration)):
          error = True
    else:
      pool = Pool(num_threads)
      rs = pool.starmap(run_one, [(z3exe, benchdir, f, timeout_duration) for f in benchmarks])
      for r in rs:
        error |= r

    if error:
        raise Exception("Found errors testing benchmarks at %s using %s" % (benchdir, z3exe))

def test_benchmarks_using_latest(benchdir, branch="master", debug=True, clang=False, ext="smt2", timeout_duration=60.0):
    z3dir = find_z3depot()
    bdir  = get_builddir(branch, debug, clang)
    z3exe = os.path.join(z3dir, bdir, 'z3')
    test_benchmarks(z3exe, benchdir, ext, timeout_duration)

def exec_pyscript(script, timeout, env):
    shell = False if is_windows() else True
    if subprocess_killer([config.PYTHON, script], timeout=timeout, shell=shell, env=env) != 0:
        raise Exception("Script '%s' returned non-zero exit code" % script)
    return True

def test_pyscripts(z3libdir, scriptdir, ext="py", timeout_duration=60.0):
    pydir = os.path.join(z3libdir, "python")

    myenv = {}

    if is_linux() or is_freebsd():
        myenv['LD_LIBRARY_PATH'] = z3libdir
    elif is_osx():
        myenv['DYLD_LIBRARY_PATH'] = z3libdir
    else:
        myenv['SYSTEMROOT'] = os.getenv('SYSTEMROOT', '')

    myenv['PATH'] = os.getenv("PATH", "") + os.pathsep + z3libdir
    myenv['PYTHONPATH'] = pydir

    print("Testing python scripts at %s using %s" % (scriptdir, z3libdir))
    error = False
    for script in filter(lambda f: f.endswith(ext), os.listdir(scriptdir)):
        script_file = os.path.join(scriptdir, script)
        print("Testing %s" % script_file)
        try:
            if timeout(exec_pyscript,
                       args=[script_file, timeout_duration, myenv],
                       timeout_duration=timeout_duration,
                       default=False) == False:
                raise Exception("Timeout executing script '%s' at '%s' using '%s'" % (script, scriptdir, z3libdir))
        except Exception as ex:
            print("Failed")
            print(ex)
            error = True
    if error:
        raise Exception("Found errors testing scripts at '%s' using '%s'" % (scriptdir, z3libdir))

def test_pyscripts_using_latest(scriptdir, branch="master", debug=True, clang=False, ext="py", timeout_duration=60.0):
    z3dir = find_z3depot()
    bdir  = get_builddir(branch, debug, clang)
    test_pyscripts(os.path.join(z3dir, bdir), scriptdir, ext, timeout_duration)

def exec_cs_compile(args, timeout, env):
    if subprocess_killer(args, timeout=timeout, env=env) != 0:
        raise Exception("Compilation of '%s' failed" % file)
    return True

def exec_cs(timeout, env):
    if subprocess_killer(config.CSTEMP, timeout=timeout, env=env) != 0:
        raise Exception("Execution of '%s' failed" % (config.CSTEMP))
    return True

def test_cs(z3libdir, csdir, ext="cs", VS64=False, timeout_duration=60.0):
    print("Testing C# at %s using %s" % (csdir, z3libdir))
    error = False
    platform_arg = "/platform:x86"
    if VS64:
        platform_arg = "/platform:x64"
    shutil.copyfile("%s/Microsoft.Z3.dll" % z3libdir, "Microsoft.Z3.dll")
    with setenv('PATH', os.getenv("PATH") + ";" + z3libdir):
        for file in filter(lambda f: f.endswith(ext), os.listdir(csdir)):
            if file == config.CSDRIVER:
                continue
            file = os.path.join(csdir, file)
            print("Testing %s" % file)
            try:
                # Compile.
                if timeout(exec_cs_compile,
                           args=[[config.CSC, "/nologo",
                                  "/reference:%s\Microsoft.Z3.dll" % z3libdir,
                                  "/out:%s" % (config.CSTEMP),
                                  platform_arg,
                                  "%s\%s" % (csdir, config.CSDRIVER),
                                  file],
                                 timeout_duration,
                                 os.environ],
                           timeout_duration=timeout_duration,
                           default=False) == False:
                    raise Exception("Timeout compiling '%s' at '%s' using '%s'" % (file, csdir, z3libdir))
                # Run.
                if timeout(exec_cs,
                           args=[timeout_duration, os.environ],
                           timeout_duration=timeout_duration,
                           default=False) == False:
                    raise Exception("Timeout executing '%s' at '%s' using '%s'" % (file, csdir, z3libdir))
            except Exception as ex:
                print("Failed")
                print(ex)
                error = True
            try:
                os.remove(config.CSTEMP)
            except:
                pass
    os.remove("Microsoft.Z3.dll")
    if error:
        raise Exception("Found errors testing C# at '%s' using '%s'" % (csdir, z3libdir))

def exec_cpp(args, timeout):
    argsfilenameidx = 0
    if subprocess_killer(args, timeout=timeout) != 0:
        raise Exception("Execution of '%s' failed" % args[argsfilenameidx])
    return True

def compile_cpp(args, timeout):
    argsfilenameidx = -1
    if subprocess_killer(args, timeout=timeout) != 0:
        raise Exception("Compilation of '%s' failed" % args[argsfilenameidx])
    return True

def test_cpp(z3installdir, cppdir, ext="cpp", timeout_duration=60.0):
    error = False
    libdir = z3installdir + os.path.sep + "lib"
    includedir= z3installdir + os.path.sep + "include"
    with setenv('LD_LIBRARY_PATH', libdir):
        for file in filter(lambda f: f.endswith(ext), os.listdir(cppdir)):
            file = os.path.join(cppdir, file)
            fileexe = os.path.splitext(file)[0]
            print("Testing %s" % file)
            try:
                # Compile.
                if timeout(compile_cpp,
                           args=[[config.CPP_COMPILER, "-L", libdir, "-I", includedir, "-o", fileexe, "-lz3", file],
                               timeout_duration], timeout_duration=timeout_duration, default=False) == False:
                    raise Exception("Timeout compiling '%s' at '%s' using '%s'" % (file, cppdir, z3installdir))
                # Run.
                if timeout(exec_cpp,
                           args=[[fileexe],
                               timeout_duration], timeout_duration=timeout_duration, default=False) == False:
                    raise Exception("Timeout executing '%s' at '%s' using '%s'" % (file, cppdir, z3installdir))
                os.remove(fileexe)
            except Exception as ex:
                print("Failed")
                print(ex)
                error = True
    if error:
        raise Exception("Found errors testing C++ at '%s' using '%s'" % (cppdir, z3installdir))


def test_cs_using_latest(csdir, branch="master", debug=True, clang=False, ext="cs", VS64=False, timeout_duration=60.0):
    z3dir = find_z3depot()
    bdir  = get_builddir(branch, debug, clang)
    test_cs(os.path.join(z3dir, bdir), csdir, ext, VS64, timeout_duration)

# buildz3(java=True, everything=True)
# testjavaex()
# testz3ex('cpp_example', "master", True, True)
# testz3ex('c_example')
# test_benchmarks('/home/leo/projects/z3/build/debug/z3', 'regressions/smt2')
# test_benchmark('/home/leo/projects/z3/build/debug/z3', 'regressions/smt2/bad_patterns.smt2')
# test_benchmarks_using_latest('regressions/smt2')
# test_pyscripts('/home/leo/projects/z3/build/debug', 'regressions/python')
# test_pyscripts_using_latest('regressions/python')
