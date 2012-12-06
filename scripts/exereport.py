# Simple script for executing a command and reporting the result by email
import sendmail
import sys
import subprocess
import tempfile
import config
import socket

hostname = socket.gethostbyaddr(socket.gethostname())[0]
cmd      = ' '.join(sys.argv[1:])

OUT=open('out.txt', 'w')
ERR=open('err.txt', 'w')
EMPTY=open('empty.txt', 'w')
if subprocess.call(sys.argv[1:], stdout=OUT, stderr=ERR) != 0:
    OUT.close()
    ERR.close()
    sendmail.send("Faild to execute at %s" % hostname,
                  "See attached messages for standard output and standard error",
                  ["out.txt", "err.txt"],
                  [config.FROM])
else:
    EMPTY.write('\n')
    EMPTY.close()
    sendmail.send("Program executed at %s" % hostname,
                  "Command worked",
                  ["empty.txt"],
                  [config.FROM])


