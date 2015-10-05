# Copyright (c) 2015 Microsoft Corporation
# Simple script for executing a command and reporting the result by email
import sendmail
import sys
import subprocess
import tempfile
import config
import socket
import os

try:
    hostname = socket.gethostbyaddr(socket.gethostname())[0]
except:
    try:
        hostname = os.uname()[0]
    except:
        hostname = "unknown"

cmd      = ' '.join(sys.argv[1:])

OUT=open('out.txt', 'w')
ERR=open('err.txt', 'w')
try:
    result = subprocess.call(sys.argv[1:], stdout=OUT, stderr=ERR)
except Exception as ex:
    ERR.write('Python exception when trying to execute:\n%s\n' % cmd)
    ERR.write(str(ex))
    ERR.write('\n')
    result = 1

OUT.close()
ERR.close()

if result != 0:
    sendmail.send(config.DEVS,
                  "Failed to execute '%s' at '%s'" % (cmd, hostname),
                  "See attached files for standard output and standard error",
                  ["out.txt", "err.txt"])
    exit(1)
else:
    sendmail.send(config.DEVS,
                  "Executed '%s' at '%s'" % (cmd, hostname),
                  "Command was successfully executed",
                  ["out.txt", "err.txt"])
    exit(0)



