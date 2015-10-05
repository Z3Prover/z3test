# Copyright (c) 2015 Microsoft Corporation
# Aux script for sending results to developers.
# This script is useful when collecting the results from a machine that can't send emails.
import sys
import os
import re
import sendmail
import config

out  = sys.argv[1]
err  = sys.argv[2]
hostname = sys.argv[3]

if not os.path.exists(out) or not os.path.exists(err):
    sendmail.send(config.DEVS,
                  "Failed to read results from '%s'" % hostname,
                  "Failed to read files: '%s' '%s'" % (out, err),
                  [])
    exit(0)

pat = re.compile("Exception:")
f = open(err, "rt")
for i, line in enumerate(f):
    if pat.search(line):
        sendmail.send(config.DEVS,
                      "Failed to build z3 at '%s'" % hostname,
                      "See attached files for standard output and standard error",
                      [out, err])
        exit(0)
f.close()

sendmail.send(config.DEVS,
              "Z3 was built at '%s'" % hostname,
              "Command was successfully executed",
              [out, err])
