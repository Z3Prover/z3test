import os

SMTPSERVER='smtp.gmail.com'
SMTPPORT=587
SENDER = os.getenv('GMAILUSER', 'leodemouramsr@gmail.com')
PASSWORD = os.getenv('GMAILPASSW', None)
if PASSWORD == None:
    raise Exception("You must set GMAILPASSW with the '%s' password. You can change the user by setting GMAILUSER" % SENDER)
PASSWORD = PASSWORD.strip('\"\' \t\n')

NUMJOBS=os.getenv("MAKEJOBS", 16)

DEVS=["leonardo@microsoft.com"]
ORIGIN="https://git01.codeplex.com/z3"
GIT="git"
PYTHON="python"
JAVA="java"
BUILDDIR="build"

