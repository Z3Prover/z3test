import os

SMTPSERVER='smtp.gmail.com'
SMTPPORT=587
SENDER = os.getenv('GMAILUSER', 'leodemouramsr@gmail.com')
PASSWORD = os.getenv('GMAILPASSW', None)
if PASSWORD != None:
    PASSWORD = PASSWORD.strip('\"\' \t\n')

NUMJOBS=os.getenv("MAKEJOBS", 16)

RSSFEED_BRANCHES=['master', 'unstable', 'contrib', 'mcsat', 'tptp']
DEVS=["leonardo@microsoft.com", "cwinter@microsoft.com", "nbjorner@microsoft.com", "kenmcmil@microsoft.com"]
ORIGIN="https://git01.codeplex.com/z3"
GIT="git"
PYTHON="python"
JAVA="java"
BUILDDIR="build"

# C#
CSC="csc.exe"
CSDRIVER="driver.cs"
CSTEMP="cstest.exe"
