# Copyright (c) 2015 Microsoft Corporation


import os

SMTPSERVER='smtp.gmail.com'
SMTPPORT=587
SENDER = os.getenv('GMAILUSER', 'leodemouramsr@gmail.com')
PASSWORD = os.getenv('GMAILPASSW', None)
if PASSWORD != None:
    PASSWORD = PASSWORD.strip('\"\' \t\n')

NUMJOBS=os.getenv("MAKEJOBS", 16)

RSSFEED_BRANCHES=['master', 'mcsat']
DEVS=["levnach@microsoft.com", "cwinter@microsoft.com", "nbjorner@microsoft.com", "nlopes@microsoft.com"]
ORIGIN="https://github.com/z3prover/z3"
GIT="git"
PYTHON="python"
JAVA="java"
BUILDDIR="build"

# C#
CSC="csc.exe"
CSDRIVER="driver.cs"
CSTEMP="cstest.exe"

# C++
CPP_COMPILER="clang++"
