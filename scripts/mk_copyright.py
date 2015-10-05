# Copyright (c) 2015 Microsoft Corporation

import os
import re

cr = re.compile("Copyright")
aut = re.compile("Automatically generated")

cr_notice = """
/*++
Copyright (c) 2015 Microsoft Corporation

--*/

"""

smt2_cr_notice = """
; Copyright (c) 2015 Microsoft Corporation
"""

py_cr_notice = """
# Copyright (c) 2015 Microsoft Corporation
"""

def has_cr(file):
    ins = open(file)
    lines = 0
    line = ins.readline()
    while line and lines < 20:
	m = cr.search(line)
	if m:
	    ins.close()
	    return True
	m = aut.search(line)
	if m:
	    ins.close()
	    return True
	line = ins.readline()
    ins.close()
    return False

def add_cr(file):
    tmp = "%s.tmp" % file
    ins = open(file)
    ous = open(tmp,'w')
    if file.endswith("smt2"):
	ous.write(smt2_cr_notice)
    elif file.endswith("py"):
	ous.write(py_cr_notice)
    else:
	ous.write(cr_notice)
    line = ins.readline()
    while line:
	ous.write(line)
	line = ins.readline()
    ins.close()
    ous.close()
    os.system("move %s %s" % (tmp, file))
    
def add_missing_cr(dir):
    for root, dirs, files in os.walk(dir):
	for f in files:
	    if f.endswith('.cpp') or f.endswith('.h') or f.endswith('.c') or f.endswith('.cs') or f.endswith('.py') or f.endswith('.smt2'):
		path = "%s\\%s" % (root, f)
		if not has_cr(path):
		    print "Missing CR for %s" % path
		    add_cr(path)

add_missing_cr('regressions')
add_missing_cr('old-regressions')
